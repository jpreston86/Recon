# Ask for Target Name
echo "What is the Target you wish to perform reconaissance on?"
read TargetName
echo "Aquiring $TargetName ASN information...please wait."
 
# URL Encode Business name
TargetNameURLEncoded="$(urlencode $TargetName)"
 
# Perform ASN Lookup for Target and output to temporary file
curl https://www.ultratools.com/tools/asnInfoResult?domainName="$TargetNameURLEncoded" > ASNPage.txt
 
# Filter CURL results to only print ASN Numbers
# Removed extra web data
sed -n '/tool-results-heading/p' ASNPage.txt > ASNResults.txt
# Removes remaing web data and whitespace
sed -e 's/<[^>]*>//g' ASNResults.txt | tr -s ' ' > ASNNumbers.txt
