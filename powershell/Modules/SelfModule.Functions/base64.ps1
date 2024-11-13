function ConvertTo-Base64String([string]$plainText){
    $b64Str = [Convert]::ToBase64String(([System.Text.Encoding]::Default).GetBytes($plainText))
    return $b64Str
}

function ConvertFrom-Base64String([string]$b64Str){
    $plainText = [System.Text.Encoding]::Default.GetString(
        [System.Convert]::FromBase64String($b64Str))
    return $plainText
}
