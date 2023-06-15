using Microsoft.AspNetCore.Mvc.Formatters;
using Microsoft.Net.Http.Headers;
using System;
using System.IO;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace YourProjectName.Formatters
{
    public class XmlSerializerInputFormatter : TextInputFormatter
    {
        private const string ContentType = "application/xml";

        public XmlSerializerInputFormatter()
        {
            SupportedMediaTypes.Add(MediaTypeHeaderValue.Parse(ContentType));
            SupportedEncodings.Add(Encoding.UTF8);
            SupportedEncodings.Add(Encoding.Unicode);
        }

        public override async Task<InputFormatterResult> ReadRequestBodyAsync(InputFormatterContext context, Encoding encoding)
        {
            if (context == null)
            {
                throw new ArgumentNullException(nameof(context));
            }

            if (encoding == null)
            {
                throw new ArgumentNullException(nameof(encoding));
            }

            using var reader = new StreamReader(context.HttpContext.Request.Body, encoding);
            var xmlSerializer = new XmlSerializer(context.ModelType);
            var result = xmlSerializer.Deserialize(reader);

            return await InputFormatterResult.SuccessAsync(result);
        }

        protected override bool CanReadType(Type type)
        {
            return true;
        }
    }
}
