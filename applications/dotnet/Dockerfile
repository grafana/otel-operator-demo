FROM mcr.microsoft.com/dotnet/aspnet:8.0@sha256:86cbca9fc08f712273edef23b0dff38d81fe0d20486662946f98b164c3af6d33 AS base
WORKDIR /app
EXPOSE 8083

ENV ASPNETCORE_URLS=http://+:8083

USER app
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:8.0@sha256:8f710c2f7f3e60392fba1d408dcd9c30c26295bd4ded326cb7cf6cc6fd66cfde AS build
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
