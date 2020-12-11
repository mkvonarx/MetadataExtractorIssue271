using System;
using System.IO;
using System.Linq;
using MetadataExtractor;
using MetadataExtractor.Formats.Xmp;

namespace MetadataExtractorBug
{
	class Program
	{
		static void Main(string[] args)
		{
			foreach (var filePath in args)
			{
				if (File.Exists(filePath))
				{
					Console.WriteLine($"\"{filePath}\":");
					var metadataDirectories = ImageMetadataReader.ReadMetadata(filePath);
					var xmpDirectory = metadataDirectories.OfType<XmpDirectory>().FirstOrDefault();
					foreach (var property in xmpDirectory.XmpMeta.Properties)
					{
						if (((property.Path != null) && property.Path.Contains("MicrosoftPhoto", StringComparison.OrdinalIgnoreCase)) ||
						    ((property.Namespace != null) && property.Namespace.Contains("ns.microsoft.com/photo/1.0", StringComparison.OrdinalIgnoreCase)))
						{
							Console.WriteLine($"  XMP: path={property.Path} => value={property.Value}, namespace={property.Namespace}");
						}
					}
				}
				else
				{
					Console.WriteLine($"ERROR: file \"{filePath}\" not found");
				}
			}
		}
	}
}
