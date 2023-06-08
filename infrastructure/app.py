import boto3
import os
import json
import requests
from requests_aws4auth import AWS4Auth

#comment

region = os.environ['ES_region']
service = 'es'
credentials = boto3.Session().get_credentials()
awsauth = AWS4Auth(credentials.access_key, credentials.secret_key, region, service, session_token=credentials.token)

host = os.environ['ES_domain']
index = os.environ['ES_index']
url = 'https://' + host + '/' + index + '/_search'

def lambda_handler(event, context):

    parsed_json = json.dumps(event)
    request = json.loads(parsed_json)

    query = request["search_query"]

    # Elasticsearch 6.x requires an explicit Content-Type header
    headers = { "Content-Type": "application/json" }

    # Make the signed HTTP request
    r = requests.get(url, auth=awsauth, headers=headers, data=json.dumps(query))

    # Create the response and add some extra content to support CORS
    response = {
        "statusCode": 200,
        "headers": {
            "Access-Control-Allow-Origin": '*'
        },
        "isBase64Encoded": False
    }

    # Add the search results to the response
    response['body'] = r.json()

    json_response = json.dumps(response)

    return response
