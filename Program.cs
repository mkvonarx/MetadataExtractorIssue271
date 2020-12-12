using System;
using System.IO;
using System.Linq;
using MetadataExtractor;
using MetadataExtractor.Formats.Xmp;
using XmpCore;

namespace MetadataExtractorBug
{
	class Program
	{
		static void Main(string[] args)
		{
			//RegisterNamespaceTest();

			PrintSchemaRegistry();
			Console.WriteLine();

			foreach (var filePath in args)
			{
				if (File.Exists(filePath))
				{
					Console.WriteLine($"\"{filePath}\":");
					//XmpMetaFactory.Reset(); // calling Reset() fixes the issue with Namespaces and Path being "MicrosoftPhoto:Rating" or "MicrosoftPhoto_1_:Rating", but Reset() should not be called as per the documentation ...
					var metadataDirectories = ImageMetadataReader.ReadMetadata(filePath);
					var xmpDirectory = metadataDirectories.OfType<XmpDirectory>().FirstOrDefault();
					foreach (var property in xmpDirectory.XmpMeta.Properties)
					{
						if (((property.Path != null) && property.Path.Contains("microsoft" /*"MicrosoftPhoto"*/, StringComparison.OrdinalIgnoreCase)) ||
						    ((property.Namespace != null) && property.Namespace.Contains("microsoft" /*"ns.microsoft.com/photo/1.0"*/, StringComparison.OrdinalIgnoreCase)))
						{
							Console.WriteLine($"  XMP: path={property.Path} => value={property.Value}, namespace={property.Namespace}");
						}
					}
					PrintSchemaRegistry();
				}
				else
				{
					Console.WriteLine($"ERROR: file \"{filePath}\" not found");
				}
				Console.WriteLine();
			}
		}

		private static void RegisterNamespaceTest()
		{
			Console.WriteLine("RegisterNamespace(\"http://ns.microsoft.com/photo/1.0/\", \"MicrosoftPhoto:\")");
			var result1 = XmpMetaFactory.SchemaRegistry.RegisterNamespace("http://ns.microsoft.com/photo/1.0/", "MicrosoftPhoto:");
			Console.WriteLine($"  -> returns \"{result1}\"");

			Console.WriteLine("RegisterNamespace(\"http://ns.microsoft.com/photo/1.0\", \"MicrosoftPhoto:\")");
			var result2 = XmpMetaFactory.SchemaRegistry.RegisterNamespace("http://ns.microsoft.com/photo/1.0", "MicrosoftPhoto:");
			Console.WriteLine($"  -> returns \"{result2}\"");
		
			Console.WriteLine();
		}

		private static void PrintSchemaRegistry()
		{
			Console.WriteLine("SchemaRegistry:");

			//Console.WriteLine($"  {XmpMetaFactory.SchemaRegistry.Aliases.Count} Aliases:"); // always the same 35
			//foreach (var alias in XmpMetaFactory.SchemaRegistry.Aliases)
			//{
			//	Console.WriteLine($"    {alias.Key} = {alias.Value}");
			//}

			Console.WriteLine($"  {XmpMetaFactory.SchemaRegistry.Namespaces.Count} Namespaces, printing the ones containing microsoft:");
			foreach (var ns in XmpMetaFactory.SchemaRegistry.Namespaces)
			{
				if (ns.Key.Contains("microsoft", StringComparison.OrdinalIgnoreCase) || ns.Value.Contains("microsoft", StringComparison.OrdinalIgnoreCase))
				{
					Console.WriteLine($"    namespace:{ns.Key} => prefix:{ns.Value}");
				}
			}

			Console.WriteLine($"  {XmpMetaFactory.SchemaRegistry.Prefixes.Count} Prefixes, printing the ones containing microsoft:");
			foreach (var pre in XmpMetaFactory.SchemaRegistry.Prefixes)
			{
				if (pre.Key.Contains("microsoft", StringComparison.OrdinalIgnoreCase) || pre.Value.Contains("microsoft", StringComparison.OrdinalIgnoreCase))
				{
					Console.WriteLine($"    prefix:{pre.Key} => namespace:{pre.Value}");
				}
			}
		}
	}
}
