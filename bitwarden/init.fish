#!/bin/bash
echo "Logging out of bitwarden if we need to"
bw logout

echo "Logging into bitwarden"
login_result=$(bw login oryan@moshe.ai)
EXPORT_STRING=$(echo "$login_result" | grep -sho 'export [^>]*"')

eval $EXPORT_STRING

echo "Bitwarden's export string"
echo $EXPORT_STRING

secrets_folder_id=$(bw list items --search secrets_folder_id | jq -r '.[].notes')
secrets_folder=$(bw list items --folderid $secrets_folder_id | jq '.')

jq -rc '.[] | select(.fields and .fields[].name=="path")' <<< $secrets_folder | while read -r secret; do
  _jq() {
    path=$(jq -r '.fields[] | select(.name=="path") | .value' <<< $secret)
    name=$(jq -r '.name' <<< $secret)
    content=$(jq '.notes' <<< $secret)

    jq -r <<< $content > $path

    echo "Putting secret '$name' into path '$path'"
  }

  _jq
done
