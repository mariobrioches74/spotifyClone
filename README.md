# SpotifyClone 🎵

SpotifyClone è un progetto sviluppato durante uno stage scolastico con l’obiettivo di ricreare alcune delle funzionalità principali di Spotify attraverso un’applicazione web realizzata con architettura MVC su Visual Studio e database SQL Microsoft.

Il progetto è stato sviluppato utilizzando tecnologie Microsoft come ASP.NET MVC, SQL Server e SSMS, permettendo di gestire utenti, contenuti musicali e interazioni con il database tramite una struttura organizzata e scalabile.

L’esperienza ha permesso di approfondire:

- sviluppo web con architettura MVC
- gestione database SQL Server
- utilizzo di Visual Studio
- collegamento tra frontend, backend e database
- utilizzo di GitHub e GitExtensions per il versionamento del progetto

---

# Installazione software per il funzionamento di SpotifyClone

## 1. Installare SQL Server

- Scaricare **SQL Server Express** (versione gratuita)
- Seguire tutte le installazioni di base
- Come autenticazione per accesso all'istanza inserire:
  - `"Autenticazione Windows"`
  - oppure decidere un ID e una password da inserire al login di SSMS


## 2. Installare SSMS

- Installare **SSMS (SQL Server Management Studio)**
- Una volta fatto il login creare un database chiamato: `Spotify`


## Installazione Visual Studio

Scaricare **Visual Studio** con le seguenti estensioni da inserire su **Visual Studio Installer**:

- ASP.NET and web development
- .NET desktop development
- Data storage and processing


## Configurazione GitHub

- Iscriversi sul web a GitHub e installare GitExtensions
- Copiare il code di GitHub e fare `"clone depository"` su GitExtensions
- Fare il pull di tutti i dati da GitExtensions e aprire il progetto su Visual Studio


## Configurazione Database

- Mentre si è connessi al database eseguire il `pubblish.xml` da Visual Studio
- Su SSMS fare una nuova query e copiare tutto il codice preso da `data.sql` da Visual Studio
- Fare il refresh del database su SSMS

In caso di problemi:

`EDIT -> IntelliSense -> Refresh local cache`

- Una volta fatto tutto dare `Execute` su SSMS  
  (anche se ripetuto più volte non causa problemi al database)


## Avvio del progetto

- Tornare su Visual Studio e avviare tramite il pulsante `"http"`
- Si aprirà il sito e da lì è in libero uso
