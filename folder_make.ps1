## カレントディレクトリの情報を取得する
$str_path = (Convert-Path .)

$csv_file = "$($str_path)\folder_data.csv"

$fol_root = "E:\test"

# 作業開始
$fol_data = Import-Csv $csv_file -Encoding UTF8

# フォルダ作成
foreach($fol_check in $fol_data){
    $fol_Chec.name
    if(Test-Path "$($fol_root)\$($fol_Check.name)"){
    }else{
        New-Item "$($fol_root)\$($fol_Check.name)" -ItemType Directory
    }
}

# ファイルのリンクルートを作成
$file = Get-ChildItem

# mp4のショートカットリンクを作成する
foreach($file_check in $file){
    # 拡張子がmp4の場合、リンクパスを作る
    if($file_check.name.contains("mp4")){
        Write-Host "$($fol_root)\$($file_check.name)"
        $WshShell = New-Object -ComObject WScript.Shell
        $ShortCut = $WshShell.CreateShortcut("$($fol_root)\$($file_check.name).lnk")
        $ShortCut.TargetPath = "$($fol_root)\$($file_check.name)"
        $ShortCut.Save()
    }
}