FROM mcr.microsoft.com/dotnet/aspnet:8.0@sha256:39b1272ca9a951df21a72df91cba0344a1a01a9e85ae61c90cb4db059ac62388 AS base
WORKDIR /app
EXPOSE 8083

ENV ASPNETCORE_URLS=http://+:8083

USER app
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:8.0@sha256:2c7794fef0107c1815193dc157ed3f8ca60eb504a439806a29b6f9bf1ce73679 AS build
ARG configuration=Release
WORKDIR /src
COPY ["rolldice.csproj", "/"]
RUN dotnet restore "/rolldice.csproj"
COPY . .
WORKDIR "/src/"
RUN dotnet build "rolldice.csproj" -c $configuration -o /app/build

FROM build AS publish
ARG configuration=Release
RUN dotnet publish "rolldice.csproj" -c $configuration -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "rolldice.dll"]
