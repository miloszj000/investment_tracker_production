# 🚀 Szybki Start - Instrukcja Krok po Kroku

## Po sklonowaniu/pobraniu repozytorium

### Opcja 1: Pierwsza instalacja (nowa baza danych)

```bash
# Krok 1: Upewnij się że Docker Desktop jest uruchomiony
# (Windows: uruchom Docker Desktop z menu Start)

# Krok 2: Otwórz terminal w folderze projektu
cd etf_trucker

# Krok 3: Uruchom aplikację
docker-compose up
```

**To wszystko!** Aplikacja otworzy się na: http://localhost:8501

Nowa pusta baza danych zostanie automatycznie stworzona w folderze `data/portfolio.duckdb`

---

### Opcja 2: Masz już bazę danych na swoim komputerze

```bash
# Krok 1: Skopiuj przykładową konfigurację
cp .env.example .env

# Krok 2: Edytuj plik .env (np. w Notatniku)
# Zmień linię:
#   DB_LOCATION=./data
# Na:
#   DB_LOCATION=C:/Users/TwojeImie/moj-folder-z-baza

# Przykład (Windows):
DB_LOCATION=C:/Users/Milos/Documents/ETF_Portfolio

# Przykład (Linux/Mac):
DB_LOCATION=/home/milos/etf-portfolio

# Krok 3: Upewnij się że w tym folderze jest plik portfolio.duckdb
# Jeśli baza ma inną nazwę, zmień jej nazwę na: portfolio.duckdb

# Krok 4: Uruchom Docker Desktop

# Krok 5: Uruchom aplikację
docker-compose up
```

Aplikacja użyje Twojej istniejącej bazy danych! Wszystkie dane będą zachowane.

---

## Windows - Jeszcze prostszy sposób

Po sklonowaniu repozytorium:

1. **Upewnij się że Docker Desktop jest uruchomiony**
2. **Kliknij dwa razy na plik: `start-docker.bat`**
3. **Gotowe!** 🎉

Aplikacja sama się otworzy w przeglądarce.

---

## Mac/Linux - Prostszy sposób

```bash
# Nadaj uprawnienia do uruchomienia
chmod +x start-docker.sh

# Uruchom
./start-docker.sh
```

---

## Aktualizacja do nowej wersji

```bash
# Krok 1: Pobierz najnowszą wersję obrazu Docker
docker pull ghcr.io/miloszj000/etf-tracker:latest

# Krok 2: Uruchom ponownie
docker-compose up
```

**Twoje dane NIE zostaną utracone!** Baza danych jest poza kontenerem Docker.

---

## FAQ - Najczęstsze Problemy

### ❓ Gdzie jest moja baza danych?

Domyślnie: `./data/portfolio.duckdb` (w folderze projektu)

### ❓ Jak wskazać swoją istniejącą bazę?

1. Skopiuj `.env.example` do `.env`
2. Edytuj `.env` i ustaw `DB_LOCATION` na folder gdzie masz `portfolio.duckdb`
3. Uruchom `docker-compose up`

### ❓ Co jeśli port 8501 jest zajęty?

Edytuj `docker-compose.yml`:
```yaml
ports:
  - "8502:8501"  # Zmień 8502 na dowolny wolny port
```

### ❓ Jak zobaczyć logi/błędy?

```bash
docker-compose logs -f
```

### ❓ Jak zatrzymać aplikację?

Naciśnij `CTRL+C` w terminalu lub zamknij okno terminala.

### ❓ Jak całkowicie wyczyścić i zacząć od nowa?

```bash
docker-compose down -v
rm -rf data/
docker-compose up
```

⚠️ **UWAGA:** To usunie WSZYSTKIE dane!

---

## Potrzebujesz więcej szczegółów?

- **Podstawy Docker:** [DOCKER_SETUP.md](DOCKER_SETUP.md)
- **Pełna dokumentacja:** [README.md](README.md)

---

**Powodzenia!** 🚀
