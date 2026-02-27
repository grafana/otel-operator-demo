FROM mcr.microsoft.com/dotnet/aspnet:8.0@sha256:88c86e5469c2b69969e07343193fd3dbe4ff6936d95b994dbfa27348299af111 AS base
WORKDIR /app
EXPOSE 8083

ENV ASPNETCORE_URLS=http://+:8083

USER app
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:8.0@sha256:bfb6ed602caa605141700aea7dc7d42574b74b704368e67d683c71a002123808 AS build
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
