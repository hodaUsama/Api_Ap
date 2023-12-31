# https://hub.docker.com/_/microsoft-dotnet-core

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build

WORKDIR /CalApi2

# copy csproj and restore as distinct layers

COPY *.sln .

COPY CalApi2/*.csproj ./CalApi2/

RUN dotnet restore

# copy everything else and build app

COPY CalApi2/. ./CalApi2/

WORKDIR /CalApi2

RUN dotnet publish -c release -o /app --no-restore

# final stage/image

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1

WORKDIR /app

COPY --from=build /app ./

ENTRYPOINT ["dotnet", "CalApi2.dll"]