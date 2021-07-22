$endpoint="https://gmalc-cog.cognitiveservices.azure.com/"
$key="9fc9db061ed04f448cc31a01050bd976"


$headers = @{}
$headers.Add( "Ocp-Apim-Subscription-Key", $key )
$headers.Add( "Content-Type","application/json" )

$body = "{'documents' : [ `
    {'id':1,'text':'Hello world.'}, `
    {'id':2,'text':'Salut tout le monde.'} `
    ]}"

write-host "id text`n-- ----"
$docs = $body | ConvertFrom-Json
foreach ($doc in $docs.documents)
{
    write-host "$($doc.id) : $($doc.text)"
}

$result = Invoke-RestMethod -Method Post `
          -Uri "$endpoint/text/analytics/v3.0/languages?" `
          -Headers $headers `
          -Body $body | ConvertTo-Json -Depth 5


$resultDocs = $result | ConvertFrom-Json
foreach ($doc in $resultDocs.documents)
{
    write-host($doc.id, $doc.detectedLanguage.name)
}

#Full results
($result | ConvertFrom-Json).documents