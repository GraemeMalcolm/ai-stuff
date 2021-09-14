$endpoint="https://cog-serv-zi.cognitiveservices.azure.com/"
$key="74ad078619614f4fa9dc10b4d8bcf3f6"

# Code to call Text Analytics service to analyze sentiment in text
$txt_file = "review1.txt"
# if ($args.count -gt 0 -And $args[0] -in ("review2.txt", "review3.txt", "review4.txt"))
# {
#     $txt_file = $args[0]
# }

$txt = "https://raw.githubusercontent.com/GraemeMalcolm/ai-stuff/main/data/text/reviews/$txt_file"

$headers = @{}
$headers.Add( "Ocp-Apim-Subscription-Key", $key )
$headers.Add( "Content-Type","application/json" )

$body = "{'url' : '$txt'}"

Write-Host("`n $body")

write-host "Analyzing text...`n"
$result = Invoke-RestMethod -Method Post `
          -Uri "$endpoint/text/analytics/v3.1/keyPhrases" `
          -Headers $headers `
          -Body $body | ConvertTo-Json -Depth 6

# $result2 = Invoke-RestMethod -Method Post `
#           -Uri "$endpoint/text/analytics/v3.1/keyPhrases" `
#           -Headers $headers `
#           -Body $body | ConvertTo-Json -Depth 6

$analysis = ($result | ConvertFrom-Json)
#$analysis2 = ($result2 | ConvertFrom-Json)
# $analysis2.documents[0].keyPhrases,


Write-Host("`nLanguage Detected:")
foreach ($language in $analysis.documents)
{
    Write-Host ($language.detectedLanguage)
}



