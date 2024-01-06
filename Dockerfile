# https://hub.docker.com/_/microsoft-dotnet-core
#first stage

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

WORKDIR /source

# copy csproj and restore as dependencies

COPY *.csproj  .

RUN dotnet restore

# copy everything else and build app

COPY . .

RUN dotnet publish -c release -o /app

# final stage/image

FROM mcr.microsoft.com/dotnet/aspnet:7.0

WORKDIR /app

COPY --from=build /app .

ENTRYPOINT ["dotnet", "CalApi2.dll"]