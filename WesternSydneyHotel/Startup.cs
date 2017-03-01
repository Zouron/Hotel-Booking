using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WesternSydneyHotel.Startup))]
namespace WesternSydneyHotel
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
