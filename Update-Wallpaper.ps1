Add-Type -TypeDefinition @"
using System;
using System.IO;
using System.Text;
using System.Drawing;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.Linq;
using Microsoft.Win32;

namespace WinAPI {
  public class DesktopWallpaper
  {
    [StructLayout(LayoutKind.Sequential)]
    public struct Rect
    {
      public int Left;
      public int Top;
      public int Right;
      public int Bottom;
    }

    public enum DesktopSlideshowOptions
    {
      ShuffleImages = 0x01
    }

    public enum DesktopSlideshowState
    {
      Enabled = 0x01,
      Slideshow = 0x02,
      DisabledByRemoteSession = 0x04
    }

    public enum DesktopSlideshowDirection
    {
      Forward = 0,
      Backward = 1
    }

    public enum DesktopWallpaperPosition
    {
      Center = 0,
      Tile = 1,
      Stretch = 2,
      Fit = 3,
      Fill = 4,
      Span = 5
    }

    [ComImport, Guid("B92B56A9-8B55-4E14-9A89-0199BBB6F93B"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
    public interface IDesktopWallpaper
    {
      void SetWallpaper([MarshalAs(UnmanagedType.LPWStr)] string monitorID, [MarshalAs(UnmanagedType.LPWStr)] string wallpaper);

      [return: MarshalAs(UnmanagedType.LPWStr)]
      string GetWallpaper([MarshalAs(UnmanagedType.LPWStr)] string monitorID);

      [return: MarshalAs(UnmanagedType.LPWStr)]
      string GetMonitorDevicePathAt(uint monitorIndex);

      [return: MarshalAs(UnmanagedType.U4)]
      uint GetMonitorDevicePathCount();

      [return: MarshalAs(UnmanagedType.Struct)]
      Rect GetMonitorRECT([MarshalAs(UnmanagedType.LPWStr)] string monitorID);

      void SetBackgroundColor([MarshalAs(UnmanagedType.U4)] uint color);

      [return: MarshalAs(UnmanagedType.U4)]
      uint GetBackgroundColor();

      void SetPosition([MarshalAs(UnmanagedType.I4)] DesktopWallpaperPosition position);

      [return: MarshalAs(UnmanagedType.I4)]
      DesktopWallpaperPosition GetPosition();

      void SetSlideshow(IntPtr items);

      IntPtr GetSlideshow();

      void SetSlideshowOptions(DesktopSlideshowDirection options, uint slideshowTick);
      [PreserveSig]

      uint GetSlideshowOptions(out DesktopSlideshowDirection options, out uint slideshowTick);

      void AdvanceSlideshow([MarshalAs(UnmanagedType.LPWStr)] string monitorID, [MarshalAs(UnmanagedType.I4)] DesktopSlideshowDirection direction);

      DesktopSlideshowDirection GetStatus();

      bool Enable();
    }

    public class WallpaperWrapper
    {
      static readonly Guid CLSID_DesktopWallpaper = new Guid("{C2CF3110-460E-4fc1-B9D0-8A1C0C9CC4BD}");

      public static IDesktopWallpaper GetWallpaper()
      {
        Type typeDesktopWallpaper = Type.GetTypeFromCLSID(CLSID_DesktopWallpaper);
        return (IDesktopWallpaper)Activator.CreateInstance(typeDesktopWallpaper);
      }
    }
  }

  public class Wallpaper
  {
    public static void AdvanceSlideshow(uint id, DesktopWallpaper.DesktopSlideshowDirection direction)
    {
      DesktopWallpaper.IDesktopWallpaper wallpaper = DesktopWallpaper.WallpaperWrapper.GetWallpaper();

      if (id <= wallpaper.GetMonitorDevicePathCount()) {
        string monitor = wallpaper.GetMonitorDevicePathAt(id);
        wallpaper.AdvanceSlideshow(null, direction);
      }

      Marshal.ReleaseComObject(wallpaper);
    }
  }
}
"@ -ReferencedAssemblies 'System.Drawing.dll', System.Windows.Forms

# Bump desktop wallpaper slideshow
[WinAPI.Wallpaper]::AdvanceSlideshow(0,0)

# Pause for 5 secords before resetting slideshow timer
Start-Sleep -Seconds 2

# Reset desktop wallpaper slideshow timer
Set-ItemProperty -Path "HKCU:\Control Panel\Personalization\Desktop Slideshow" -Name LastTickHigh -Value 0 -Type Dword
Set-ItemProperty -Path "HKCU:\Control Panel\Personalization\Desktop Slideshow" -Name LastTickLow -Value 0 -Type Dword