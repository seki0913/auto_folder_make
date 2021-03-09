## カレントディレクトリの情報を取得する
$str_path = (Convert-Path .)

$csv_file = "$($str_path)\folder_data.csv"

$fol_root = "E:\"

# 作業開始
$fol_data = Import-Csv $csv_file -Encoding UTF8

foreach($fol_check in $fol_data){
    $fol_Chec.name
    if(Test-Path "$($fol_root)\$($fol_Check.name)"){
    }else{
        New-Item "$($fol_root)\$($fol_Check.name)" -ItemType Directory
    }
}