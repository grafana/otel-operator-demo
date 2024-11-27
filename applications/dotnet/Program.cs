using Microsoft.AspNetCore.Mvc;
using System.Globalization;

var appBuilder = WebApplication.CreateBuilder(args);

// Clear default logging providers used by WebApplication host.
appBuilder.Logging.ClearProviders();

var app = appBuilder.Build();

string HandleRollDice([FromServices] ILogger<Program> logger, string? player)
{
    var result = RollDice();

    if (string.IsNullOrEmpty(player))
    {
        logger.LogInformation("Anonymous player is rolling the dice: {result}", result);
    }
    else
    {
        logger.LogInformation("{player} is rolling the dice: {result}", player, result);
    }

    return result.ToString(CultureInfo.InvariantCulture);
}

int RollDice()
{
    return Random.Shared.Next(1, 7);
}

app.MapGet("/rolldice/{player?}", HandleRollDice);

app.Run();
