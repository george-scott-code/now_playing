namespace now_playing;

using Windows.Media.Control;

internal class Program
{
    public static async Task Main(string[] args)
    {
        try
        {
            var mediaControlSessionManager = await GetSystemMediaTransportControlsSessionManager();
            var mediaProperties = await GetMediaProperties(mediaControlSessionManager.GetCurrentSession());
            Console.WriteLine("{0} | {1} | {2}", mediaProperties.Title, mediaProperties.Artist, mediaProperties.AlbumTitle);
        }
        catch
        {
            // none found
        }
    }
    
    private static async Task<GlobalSystemMediaTransportControlsSessionManager> GetSystemMediaTransportControlsSessionManager() => await GlobalSystemMediaTransportControlsSessionManager.RequestAsync();
    private static async Task<GlobalSystemMediaTransportControlsSessionMediaProperties> GetMediaProperties(GlobalSystemMediaTransportControlsSession session) =>
        await session.TryGetMediaPropertiesAsync();
}