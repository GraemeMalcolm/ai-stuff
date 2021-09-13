$endpoint="YOUR_ENDPOINT"
$key="YOUR_KEY"

# Code to call Text Analytics service to analyze sentiment in text
$txt_file = "review1.txt"
if ($args.count -gt 0 -And $args[0] -in ("review2.txt", "review3.txt", "review4.txt"))
{
    $txt_file = $args[0]
}

$txt = "https://github.com/GraemeMalcolm/ai-stuff/raw/main/data/text/reviews/$txt_file"

$headers = @{}
$headers.Add( "Ocp-Apim-Subscription-Key", $key )
$headers.Add( "Content-Type","application/json" )

$body = "{'url' : '$txt'}"

write-host "Analyzing text...`n"
$result = Invoke-RestMethod -Method Post `
          -Uri "$endpoint/text/analytics/v3.1/languages" `
          -Headers $headers `
          -Body $body | ConvertTo-Json -Depth 6

$analysis = ($result | ConvertFrom-Json)

# foreach ($listofdict in $analysis.regions.lines.words)
# {
#     foreach($dict in $listofdict)
#     {
#         Write-Host ("$dict, `n")
#     }
# }