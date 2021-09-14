$endpoint="https://sg-ai900-cogserv.cognitiveservices.azure.com/"
$key="7c0aaae11c244068a364eed3187d1461"

# Code to call Text Analytics service to analyze sentiment in text
# $txt_file = "review1.txt"

# $txt = "https://raw.githubusercontent.com/GraemeMalcolm/ai-stuff/main/data/text/reviews/$txt_file"

$txt = "Good Hotel and staff`nThe Royal Hotel, London, UK`n3/2/2018`nClean rooms, good service, great location near Buckingham Palace and Westminster Abbey, and so on. We thoroughly enjoyed our stay. The courtyard is very peaceful and we went to a restaurant which is part of the same group and is Indian ( West coast so plenty of fish) with a Michelin Star. We had the taster menu which was fabulous. The rooms were very well appointed with a kitchen, lounge, bedroom and enormous bathroom. Thoroughly recommended."

$headers = @{}
$headers.Add( "Ocp-Apim-Subscription-Key", $key )
$headers.Add( "Content-Type","application/json" )

$body = "{ `
    'documents': [ `
      { `
        'id': '0', `
        'text': $txt, `
        'language': 'en-US' `
      } `
    ] `
  }"

Write-Host("`n $body")

write-host "Analyzing text...`n"
$result = Invoke-RestMethod -Method Post `
          -Uri "$endpoint/text/analytics/v3.1/keyPhrases" `
          -Headers $headers `
          -Body $body | ConvertTo-Json -Depth 6

$analysis = ($result | ConvertFrom-Json)

Write-Host("`nLanguage Detected:")
foreach ($language in $analysis.documents)
{
    Write-Host ($language.detectedLanguage)
}