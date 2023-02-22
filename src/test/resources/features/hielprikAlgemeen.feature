# language: nl
Functionaliteit: Algemene eigenschappen van hielprikgegevens

  Scenario: Prematuur shortcut
    Gegeven een gewone eerste hielprik
    En het kindje is prematuur
    Als de algemene hielprik-beslistabel wordt uitgevoerd
    Dan verwacht ik dat het kindje als prematuur wordt beschouwd
    
  Scenario: Niet-prematuur shortcut
    Gegeven een gewone eerste hielprik
    En het kindje is niet prematuur
    Als de algemene hielprik-beslistabel wordt uitgevoerd
    Dan verwacht ik dat het kindje als niet-prematuur wordt beschouwd
    


  Scenario: Niet prematuur gewoon tijdige hielprik
    Gegeven een gewone eerste hielprik
    En het kindje is geboren op 2023-01-15T10:34
    En er was een bloedtransfusie op 2023-01-16
    En de hielprik is afgenomen op 2023-01-19
    En de zwangerschapsduur is 260 dagen
    En de afnametermijnPrematuur is 5
    En het geboortegewicht is 3000 gram
    En er was een bloedtransfusie met type "Erytrocyten"
    Als de algemene hielprik-beslistabel wordt uitgevoerd
    Dan verwacht ik dat het kindje als niet-prematuur wordt beschouwd
    En verwacht ik dat er voldoende tijd zit tussen de bloedtransfusie en de afname
    En verwacht ik dat de status van de bloedtransfusie "Geen relevante BT" is
    En verwacht ik dat het niet om een tweede hielprik gaat
    En verwacht ik dat er voldoende tijd zit tussen de geboorte en afname

  Scenario: testgevallen om niet-prematuur te bepalen met alle waarden gevuld
    Gegeven een gewone eerste hielprik
    En de afnametermijnPrematuur is <afnametermijnPrematuur>
    En de zwangerschapsduur is <zwangerschapsduur> dagen
    En het geboortegewicht is <geboortegewicht> gram
    Als de algemene hielprik-beslistabel wordt uitgevoerd
    Dan verwacht ik dat het kindje als niet-prematuur wordt beschouwd

    Voorbeelden:
      | afnametermijnPrematuur | zwangerschapsduur | geboortegewicht |
      | 5                      | 240               | 3000            |
      | 59                     | 252               | 2501            |

  Scenario: testgevallen om prematuur te bepalen met alle waarden gevuld
    Gegeven een gewone eerste hielprik
    En de afnametermijnPrematuur is <afnametermijnPrematuur>
    En de zwangerschapsduur is <zwangerschapsduur> dagen
    En het geboortegewicht is <geboortegewicht> gram
    Als de algemene hielprik-beslistabel wordt uitgevoerd
    Dan verwacht ik dat het kindje als prematuur wordt beschouwd

    Voorbeelden:
      | afnametermijnPrematuur | zwangerschapsduur | geboortegewicht |
      | 65                     | 260               | 3000            |
      | 60                     | 260               | 3000            |
      | 59                     | 252               | 2500            |

  Scenario: prematuur bepaling zonder afnametermijnPrematuur bekend
    Gegeven een gewone eerste hielprik
    En de zwangerschapsduur is 255 dagen
    Als de algemene hielprik-beslistabel wordt uitgevoerd
    Dan verwacht ik dat het kindje als niet-prematuur wordt beschouwd

  Scenario: Bepalen status bloedtransfusie
    Gegeven een gewone eerste hielprik
    En het kindje is geboren op 2023-01-15T10:10
    En er was een bloedtransfusie met type <type>
    En er was een bloedtransfusie op 2023-01-15T10:15
    En de hielprik is afgenomen op 2023-01-15T18:00
    Als de algemene hielprik-beslistabel wordt uitgevoerd
    Dan verwacht ik dat er onvoldoende tijd zit tussen de bloedtransfusie en de afname
    Dan verwacht ik dat de status van de bloedtransfusie <statusBT> is

    Voorbeelden:
      | type                    | statusBT              |
      | "Erytrocyten"           | "Relevante BT"        |
      | "Trombocyten"           | "Relevante BT"        |
      | "Bloedplasma"           | "Relevante BT"        |
      | "Gemigreerd"            | "Relevante BT"        |
      | "Onbekend bij screener" | "Relevante BT"        |
      | "Selecteer een type"    | "Navraag nodig"       |
      | "Niet van toepassing"   | "Geen relevante BT"   |
