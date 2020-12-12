dotnet build

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
SchemaRegistry:
  57 Namespaces, printing the ones containing microsoft:
  57 Prefixes, printing the ones containing microsoft:

"Test-exiftool.jpg":
  XMP: path= => value=, namespace=http://ns.microsoft.com/photo/1.0
  XMP: path=MicrosoftPhoto:LastKeywordXMP => value=, namespace=http://ns.microsoft.com/photo/1.0
  XMP: path=MicrosoftPhoto:LastKeywordXMP[1] => value=exiftool-MSKeyword1, namespace=
  XMP: path=MicrosoftPhoto:LastKeywordXMP[2] => value=exiftool-MSKeyword2, namespace=
  XMP: path=MicrosoftPhoto:Rating => value=25, namespace=http://ns.microsoft.com/photo/1.0
SchemaRegistry:
  58 Namespaces, printing the ones containing microsoft:
    namespace:http://ns.microsoft.com/photo/1.0 => prefix:MicrosoftPhoto:
  58 Prefixes, printing the ones containing microsoft:
    prefix:MicrosoftPhoto: => namespace:http://ns.microsoft.com/photo/1.0


$ .\bin\Debug\net5.0\MetadataExtractorBug.exe Test-WindowsExplorer.jpg
SchemaRegistry:
  57 Namespaces, printing the ones containing microsoft:
  57 Prefixes, printing the ones containing microsoft:

"Test-WindowsExplorer.jpg":
  XMP: path= => value=, namespace=http://ns.microsoft.com/photo/1.0/
  XMP: path=MicrosoftPhoto:Rating => value=75, namespace=http://ns.microsoft.com/photo/1.0/
  XMP: path=MicrosoftPhoto:LastKeywordXMP => value=, namespace=http://ns.microsoft.com/photo/1.0/
  XMP: path=MicrosoftPhoto:LastKeywordXMP[1] => value=WinExplorerTag1, namespace=
  XMP: path=MicrosoftPhoto:LastKeywordXMP[2] => value=WinExplorerTag2, namespace=
SchemaRegistry:
  58 Namespaces, printing the ones containing microsoft:
    namespace:http://ns.microsoft.com/photo/1.0/ => prefix:MicrosoftPhoto:
  58 Prefixes, printing the ones containing microsoft:
    prefix:MicrosoftPhoto: => namespace:http://ns.microsoft.com/photo/1.0/


$ .\bin\Debug\net5.0\MetadataExtractorBug.exe Test-exiftool.jpg Test-WindowsExplorer.jpg
SchemaRegistry:
  57 Namespaces, printing the ones containing microsoft:
  57 Prefixes, printing the ones containing microsoft:

"Test-exiftool.jpg":
  XMP: path= => value=, namespace=http://ns.microsoft.com/photo/1.0
  XMP: path=MicrosoftPhoto:LastKeywordXMP => value=, namespace=http://ns.microsoft.com/photo/1.0
  XMP: path=MicrosoftPhoto:LastKeywordXMP[1] => value=exiftool-MSKeyword1, namespace=
  XMP: path=MicrosoftPhoto:LastKeywordXMP[2] => value=exiftool-MSKeyword2, namespace=
  XMP: path=MicrosoftPhoto:Rating => value=25, namespace=http://ns.microsoft.com/photo/1.0
SchemaRegistry:
  58 Namespaces, printing the ones containing microsoft:
    namespace:http://ns.microsoft.com/photo/1.0 => prefix:MicrosoftPhoto:
  58 Prefixes, printing the ones containing microsoft:
    prefix:MicrosoftPhoto: => namespace:http://ns.microsoft.com/photo/1.0

"Test-WindowsExplorer.jpg":
  XMP: path= => value=, namespace=http://ns.microsoft.com/photo/1.0/
  XMP: path=MicrosoftPhoto_1_:Rating => value=75, namespace=http://ns.microsoft.com/photo/1.0/
  XMP: path=MicrosoftPhoto_1_:LastKeywordXMP => value=, namespace=http://ns.microsoft.com/photo/1.0/
  XMP: path=MicrosoftPhoto_1_:LastKeywordXMP[1] => value=WinExplorerTag1, namespace=
  XMP: path=MicrosoftPhoto_1_:LastKeywordXMP[2] => value=WinExplorerTag2, namespace=
SchemaRegistry:
  59 Namespaces, printing the ones containing microsoft:
    namespace:http://ns.microsoft.com/photo/1.0 => prefix:MicrosoftPhoto:
    namespace:http://ns.microsoft.com/photo/1.0/ => prefix:MicrosoftPhoto_1_:
  59 Prefixes, printing the ones containing microsoft:
    prefix:MicrosoftPhoto: => namespace:http://ns.microsoft.com/photo/1.0
    prefix:MicrosoftPhoto_1_: => namespace:http://ns.microsoft.com/photo/1.0/


$ .\bin\Debug\net5.0\MetadataExtractorBug.exe Test-WindowsExplorer.jpg Test-exiftool.jpg
SchemaRegistry:
  57 Namespaces, printing the ones containing microsoft:
  57 Prefixes, printing the ones containing microsoft:

"Test-WindowsExplorer.jpg":
  XMP: path= => value=, namespace=http://ns.microsoft.com/photo/1.0/
  XMP: path=MicrosoftPhoto:Rating => value=75, namespace=http://ns.microsoft.com/photo/1.0/
  XMP: path=MicrosoftPhoto:LastKeywordXMP => value=, namespace=http://ns.microsoft.com/photo/1.0/
  XMP: path=MicrosoftPhoto:LastKeywordXMP[1] => value=WinExplorerTag1, namespace=
  XMP: path=MicrosoftPhoto:LastKeywordXMP[2] => value=WinExplorerTag2, namespace=
SchemaRegistry:
  58 Namespaces, printing the ones containing microsoft:
    namespace:http://ns.microsoft.com/photo/1.0/ => prefix:MicrosoftPhoto:
  58 Prefixes, printing the ones containing microsoft:
    prefix:MicrosoftPhoto: => namespace:http://ns.microsoft.com/photo/1.0/

"Test-exiftool.jpg":
  XMP: path= => value=, namespace=http://ns.microsoft.com/photo/1.0
  XMP: path=MicrosoftPhoto_1_:LastKeywordXMP => value=, namespace=http://ns.microsoft.com/photo/1.0
  XMP: path=MicrosoftPhoto_1_:LastKeywordXMP[1] => value=exiftool-MSKeyword1, namespace=
  XMP: path=MicrosoftPhoto_1_:LastKeywordXMP[2] => value=exiftool-MSKeyword2, namespace=
  XMP: path=MicrosoftPhoto_1_:Rating => value=25, namespace=http://ns.microsoft.com/photo/1.0
SchemaRegistry:
  59 Namespaces, printing the ones containing microsoft:
    namespace:http://ns.microsoft.com/photo/1.0/ => prefix:MicrosoftPhoto:
    namespace:http://ns.microsoft.com/photo/1.0 => prefix:MicrosoftPhoto_1_:
  59 Prefixes, printing the ones containing microsoft:
    prefix:MicrosoftPhoto: => namespace:http://ns.microsoft.com/photo/1.0/
    prefix:MicrosoftPhoto_1_: => namespace:http://ns.microsoft.com/photo/1.0
