# Introduzione

Repository per l'evento Agile O'Day 2020 del 12 giugno. Dimostrazione della parte di SQL Clone.

## Osservazioni

Il repository, seppure connesso ad una serie di macchine preconfigurate, è disconnesso dagli agent, perciò non sarà possibile eseguire le build pipeline. Allo stesso tempo non sarà possibile creare release pipeline sfruttando tali agent. Gli script sono solo file da cui è possibile prendere spunto.

## Contenuti

Il repository dimostrativo è [questo](https://suxstellinotfs.visualstudio.com/AgileODayPublic/_git/AgileODay2020_DemoClone). Il contenuto è il seguente:

- cartella `scripts` con:
  - file `breaking-change.sql` per l'esecuzione dello script corretto o errato (vedere commenti nello script)
  - file `create-clone.ps1` per creare il clone a partire dall'immagine (nomi interni allo script sulla base del vostro scenario)
  - file `remove-clone.ps1` per rimuovere il clone
  - file `create-image.ps1` per creare l'immagine (nomi interni allo script sulla base del vostro scenario)
- cartella `slides` con la presentazione pdf
