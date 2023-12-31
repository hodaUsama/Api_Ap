# https://hub.docker.com/_/microsoft-dotnet-core

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

WORKDIR .

# copy csproj and restore as distinct layers

COPY CalApi2.sln .

COPY CalApi2.csproj ./CalApi2/

RUN dotnet restore

# copy everything else and build app

COPY . ./CalApi2/

WORKDIR /CalApi2

RUN dotnet publish -c release -o /app --no-restore

# final stage/image

FROM mcr.microsoft.com/dotnet/sdk:7.0

WORKDIR /app

COPY --from=build /app ./

ENTRYPOINT ["dotnet", "CalApi2.dll"]