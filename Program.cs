using Windows.Media.Control;
internal class Program
{
    public static async Task Main(string[] args)
    {
        try 
        {
            var gsmtcsm = await GetSystemMediaTransportControlsSessionManager();
            var mediaProperties = await GetMediaProperties(gsmtcsm.GetCurrentSession());
            Console.WriteLine("{0} - {1}", mediaProperties.Artist, mediaProperties.Title);
        }
        catch 
        {
        }        
    }

    private static async Task<GlobalSystemMediaTransportControlsSessionManager> GetSystemMediaTransportControlsSessionManager() => await GlobalSystemMediaTransportControlsSessionManager.RequestAsync();

    private static async Task<GlobalSystemMediaTransportControlsSessionMediaProperties> GetMediaProperties(GlobalSystemMediaTransportControlsSession session) =>
        await session.TryGetMediaPropertiesAsync();
}