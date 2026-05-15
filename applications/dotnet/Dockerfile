FROM mcr.microsoft.com/dotnet/aspnet:8.0@sha256:93154e00cb227f2fad30724455ecd1e77f46afc9a0273590af652ac220664e54 AS base
WORKDIR /app
EXPOSE 8083

ENV ASPNETCORE_URLS=http://+:8083

USER app
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:8.0@sha256:ebecce75fb42c4c14db108f88054d20a93b0b9e6dfbacad56c8f744c342cf9ef AS build
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
