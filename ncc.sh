#!/bin/bash

source secrets.txt
BASE_URL=$SERVER/remote.php/dav

# functions by order of implementation

usage() {
  echo "usage: ncc <subcommand> [<args>]"
  echo ""
  echo "subcommands:"
  echo "  download"
  echo "  upload"
}

upload() {
  body=$(cat "$1")
  _curl PUT "$BASE_URL/files/$USER/$2" "$body"
}

upload_usage() {
  echo "usage: ncc upload -s <local_path> -d <remote_path>"
}

download() {
  _curl GET "$BASE_URL/files/$USER/$1" "$2"
}

download_usage() {
  echo "usage: ncc download -s <remote_src> -d <local_path>"
}

# utils

_curl() {
  if [[ "$1" == "PUT" ]]
  then
    curl -ku "$USER:$PASSWORD" -X "$1" "$2" --data "$3"
  elif [[ "$1" == "GET" ]]
  then
    curl -ku "$USER:$PASSWORD" -x "$1" "$2" -o "$3"
  fi
}

# Reading subcommand and parameters
if [[ ! "$1" =~ ^(upload|download)$ ]]; then
  usage ; exit 1
fi
subcommand=$1
shift

while [[ -n "$1" ]]
do
  case $1 in
    #-u | --url )         shift
    #      	         url=$1;;
    -s | --source )      shift
		         src=$1;;
    -d | --destination ) shift
                         dst=$1;;
    -h | --help )        eval "${subcommand}_usage"
		         exit 0;;
    * )                  eval "echo ${subcommand}_usage"
		         exit 1;;
  esac
  shift
done

if [[ "$subcommand" == "upload" ]]
then
  upload $src $dst
elif [[ "$subcommand" == "download" ]]
then
  download "$src" "$dst"
fi

