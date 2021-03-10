## カレントディレクトリの情報を取得する
$str_path = (Convert-Path .)

$csv_file = "$($str_path)\folder_data.csv"

$fol_root = "E:\test"

# 作業開始
$fol_data = Import-Csv $csv_file -Encoding UTF8

# フォルダ作成
foreach($fol_check in $fol_data){
    $fol_check.name
    if(Test-Path "$($fol_root)\$($fol_Check.folder)"){
    }else{
        New-Item "$($fol_root)\$($fol_Check.folder)" -ItemType Directory
    }
}

# ファイルのリンクルートを作成
$file = Get-ChildItem

# 指定した名前が含まえる場合、移動する
foreach($fol_check in $fol_data){
    foreach($file_check in $file){
        $file_check.name
        $fol_check.name
        if(($file_check.name.contains("$($fol_check.name)")) -and ($file_check.name.contains("mp4")) ){
            Write-Host "いました"
            Move-Item "$($fol_root)\$($file_check.name)" "$($fol_root)\$($fol_check.name)"

            # ショートカットリンクを作成する
            $WshShell = New-Object -ComObject WScript.Shell
            $ShortCut = $WshShell.CreateShortcut("$($fol_root)\$($file_check.name).lnk")
            $ShortCut.TargetPath = "$($fol_root)\$($fol_check.name)\$($file_check.name)"
            $ShortCut.Save()
        }
    }
}