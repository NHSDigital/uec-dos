#!/bin/bash

function terraform-format-check {
    DIR=$1
    if [[ $(terraform fmt -recursive -check -list=true $DIR) ]] ; then
      echo formatting issues with terraform files
      terraform fmt -recursive -check -list=true --diff $DIR
    fi
}

