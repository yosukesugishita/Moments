#include "xamarin/xamarin.h"


void xamarin_register_modules ()
{

}

void xamarin_register_assemblies ()
{
	xamarin_open_and_register ("Xamarin.iOS.dll");
	xamarin_open_and_register ("Xamarin.Forms.Platform.iOS.dll");
	xamarin_open_and_register ("ImageCircle.Forms.Plugin.iOS.dll");
	xamarin_open_and_register ("Microsoft.WindowsAzure.Mobile.Ext.dll");
	xamarin_open_and_register ("PLCrashReporterUnifiedBinding.dll");
	xamarin_open_and_register ("BTProgressHUD.dll");

}

void xamarin_setup ()
{
	xamarin_use_old_dynamic_registrar = FALSE;
	xamarin_init_mono_debug = FALSE;
	xamarin_executable_name = "MomentsiOS.exe";
	xamarin_use_new_assemblies = 1;
	mono_use_llvm = FALSE;
	xamarin_log_level = 0;
	xamarin_new_refcount = TRUE;
	setenv ("MONO_GC_PARAMS", "nursery-size=512k", 1);
}

int main (int argc, char **argv)
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	int rv = xamarin_main (argc, argv, false);
	[pool drain];
	return rv;
}
