# language: nl
Functionaliteit: uitslagen van screeningen

  Achtergrond: Niet prematuur gewoon tijdige hielprik
    Gegeven een gewone eerste hielprik
    En de afnametermijnPrematuur is 5
    En het geboortegewicht is 3000 gram

  Scenario:
    Gegeven de zwangerschapsduur is <zwDuur> dagen
    Gegeven het testresultaat "T4" met status <statusT4> en numerieke waarde <waardeT4>
    Gegeven het testresultaat "TBG" met status <statusTBG> en numerieke waarde <waardeTBG>
    Gegeven het testresultaat "TSH" met status <statusTSH> en numerieke waarde <waardeTSH>
    Gegeven het testresultaat "T4/TBG" met status <statusT4TBG> en numerieke waarde <waardeT4TBG>
    Gegeven het testresultaat "BIOT" met status 0 en numerieke waarde 25
    Gegeven de peildatum is 2010-01-01
    Als de nhs beslistabel wordt uitgevoerd
    Dan verwacht ik dat de interpretatie voor "CH" <InterpretatieCH> is
    Dan verwacht ik dat de interpretatie voor "BIO" "TODO" is
    Voorbeelden:
      | statusT4 | waardeT4 | statusTBG | waardeTBG | statusTSH | waardeTSH | statusT4TBG | waardeT4TBG | InterpretatieCH | zwDuur |
      # | 0        | -0,5     | 0         | null      | 0         | null      | 0           | null        | "Negatief"              | 260    |
      # | 0        | -1       | 0         | null      | 0         | null      | 0           | null        | null                    | 260    |
      # | 0        | -2,5     | 0         | null      | 0         | null      | 0           | null        | null                    | 260    |
      # | 0        | -3,4     | 0         | null      | 0         | null      | 0           | null        | null                    | 260    |
      # | 0        | null     | 0         | null      | 0         | null      | 0           | null        | null                    | 260    |
      # | 0        | 0,5      | 0         | null      | 0         | null      | 0           | null        | "Negatief"              | 260    |
      # | 3        | null     | 0         | null      | 0         | null      | 0           | null        | "NIET UITGEVOERD"       | 271    |
      # | 2        | -5       | 0         | null      | 0         | null      | 0           | null        | "NIET CLASSIFICEERBAAR" | 274    |
      # # | 0        | -3       | 1         | null      | 9         | 2         | 1           | null        | "Afwijkend"             | 280    |
      # # | 0        | -3,1     | 0         | null      | 5         | 10        | 0           | null        | null                    | 280    |
      # | 3        | -4       | 2         | 20        | 0         | 20        | 2           | null        | "NIET UITGEVOERD"       | 280    |
      # | 0        | -3       | 0         | 40        | 0         | 7         | 0           | null        | "Negatief"              | 280    |
      | 0        | -4       | 0         | 40        | 0         | 7,1       | 0           | null        | "Dubieus"       | 280    |

