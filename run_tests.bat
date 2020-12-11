:: only Test-exiftool.jpg
.\bin\Debug\net5.0\MetadataExtractorBug.exe Test-exiftool.jpg

:: only Test-WindowsExplorer.jpg
.\bin\Debug\net5.0\MetadataExtractorBug.exe Test-WindowsExplorer.jpg

:: both Test-exiftool.jpg and Test-WindowsExplorer.jpg
.\bin\Debug\net5.0\MetadataExtractorBug.exe Test-exiftool.jpg Test-WindowsExplorer.jpg

:: and in the other order
.\bin\Debug\net5.0\MetadataExtractorBug.exe Test-WindowsExplorer.jpg Test-exiftool.jpg

pause
goto :eof


results:

$ .\bin\Debug\net5.0\MetadataExtractorBug.exe Test-exiftool.jpg
"Test-exiftool.jpg":
  XMP: path= => value=, namespace=http://ns.microsoft.com/photo/1.0
  XMP: path=MicrosoftPhoto:LastKeywordXMP => value=, namespace=http://ns.microsoft.com/photo/1.0
  XMP: path=MicrosoftPhoto:LastKeywordXMP[1] => value=exiftool-MSKeyword1, namespace=
  XMP: path=MicrosoftPhoto:LastKeywordXMP[2] => value=exiftool-MSKeyword2, namespace=
  XMP: path=MicrosoftPhoto:Rating => value=25, namespace=http://ns.microsoft.com/photo/1.0

$ .\bin\Debug\net5.0\MetadataExtractorBug.exe Test-WindowsExplorer.jpg
"Test-WindowsExplorer.jpg":
  XMP: path= => value=, namespace=http://ns.microsoft.com/photo/1.0/
  XMP: path=MicrosoftPhoto:Rating => value=75, namespace=http://ns.microsoft.com/photo/1.0/
  XMP: path=MicrosoftPhoto:LastKeywordXMP => value=, namespace=http://ns.microsoft.com/photo/1.0/
  XMP: path=MicrosoftPhoto:LastKeywordXMP[1] => value=WinExplorerTag1, namespace=
  XMP: path=MicrosoftPhoto:LastKeywordXMP[2] => value=WinExplorerTag2, namespace=

$ .\bin\Debug\net5.0\MetadataExtractorBug.exe Test-exiftool.jpg Test-WindowsExplorer.jpg
"Test-exiftool.jpg":
  XMP: path= => value=, namespace=http://ns.microsoft.com/photo/1.0
  XMP: path=MicrosoftPhoto:LastKeywordXMP => value=, namespace=http://ns.microsoft.com/photo/1.0
  XMP: path=MicrosoftPhoto:LastKeywordXMP[1] => value=exiftool-MSKeyword1, namespace=
  XMP: path=MicrosoftPhoto:LastKeywordXMP[2] => value=exiftool-MSKeyword2, namespace=
  XMP: path=MicrosoftPhoto:Rating => value=25, namespace=http://ns.microsoft.com/photo/1.0
"Test-WindowsExplorer.jpg":
  XMP: path= => value=, namespace=http://ns.microsoft.com/photo/1.0/
  XMP: path=MicrosoftPhoto_1_:Rating => value=75, namespace=http://ns.microsoft.com/photo/1.0/
  XMP: path=MicrosoftPhoto_1_:LastKeywordXMP => value=, namespace=http://ns.microsoft.com/photo/1.0/
  XMP: path=MicrosoftPhoto_1_:LastKeywordXMP[1] => value=WinExplorerTag1, namespace=
  XMP: path=MicrosoftPhoto_1_:LastKeywordXMP[2] => value=WinExplorerTag2, namespace=

$ .\bin\Debug\net5.0\MetadataExtractorBug.exe Test-WindowsExplorer.jpg Test-exiftool.jpg
"Test-WindowsExplorer.jpg":
  XMP: path= => value=, namespace=http://ns.microsoft.com/photo/1.0/
  XMP: path=MicrosoftPhoto:Rating => value=75, namespace=http://ns.microsoft.com/photo/1.0/
  XMP: path=MicrosoftPhoto:LastKeywordXMP => value=, namespace=http://ns.microsoft.com/photo/1.0/
  XMP: path=MicrosoftPhoto:LastKeywordXMP[1] => value=WinExplorerTag1, namespace=
  XMP: path=MicrosoftPhoto:LastKeywordXMP[2] => value=WinExplorerTag2, namespace=
"Test-exiftool.jpg":
  XMP: path= => value=, namespace=http://ns.microsoft.com/photo/1.0
  XMP: path=MicrosoftPhoto_1_:LastKeywordXMP => value=, namespace=http://ns.microsoft.com/photo/1.0
  XMP: path=MicrosoftPhoto_1_:LastKeywordXMP[1] => value=exiftool-MSKeyword1, namespace=
  XMP: path=MicrosoftPhoto_1_:LastKeywordXMP[2] => value=exiftool-MSKeyword2, namespace=
  XMP: path=MicrosoftPhoto_1_:Rating => value=25, namespace=http://ns.microsoft.com/photo/1.0
