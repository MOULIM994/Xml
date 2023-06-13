// Startup.cs
public class Startup
{
    public Startup(IConfiguration configuration)
    {
        Configuration = configuration;
    }

    public IConfiguration Configuration { get; }

    public void ConfigureServices(IServiceCollection services)
    {
        services.AddControllers();
        services.AddXmlSerializerFormatter();

        // Register the XML service
        services.AddScoped<IXmlService, XmlService>();
    }

    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
        if (env.IsDevelopment())
        {
            app.UseDeveloperExceptionPage();
        }

        app.UseRouting();

        app.UseEndpoints(endpoints =>
        {
            endpoints.MapControllers();
        });
    }
}

// Program.cs
public class Program
{
    public static void Main(string[] args)
    {
        var host = new WebHostBuilder()
            .UseStartup<Startup>()
            .Build();

        host.Run();
    }
}

// XmlService.cs
public class XmlService : IXmlService
{
    public XmlDocument Parse(string xml)
    {
        return XDocument.Parse(xml);
    }
}

// Controller.cs
public class HomeController : Controller
{
    private readonly IXmlService _xmlService;

    public HomeController(IXmlService xmlService)
    {
        _xmlService = xmlService;
    }

    [HttpGet]
    public ActionResult Get()
    {
        // Get the XML input from the request
        var xmlInput = Request.Body;

        // Parse the XML input
        var xmlDocument = _xmlService.Parse(xmlInput);

        // Return the XML document as the response
        return new XmlResult(xmlDocument);
    }
}
