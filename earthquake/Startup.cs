using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(earthquake.Startup))]
namespace earthquake
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
