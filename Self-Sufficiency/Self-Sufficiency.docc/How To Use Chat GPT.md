# How To Use Chat GPT

French Page ! 
POur alimenter voici les formules pour dialoguer avec CHatGPT rapidement. 

## Overview


**Code pour présenter l'application :** 

```
L'application Self-Sufficiency est un guide de survie qui fournit aux utilisateurs une liste d'éléments de sujets contenant des ressources nécessaires pour la survie en cas d'urgence. Les utilisateurs peuvent naviguer à travers les éléments de sujets et marquer les éléments comme étant terminés, l'application calculant le score global en fonction de la somme de tous les éléments terminés et affichant le pourcentage d'achèvement. Cette application a trois modes, et ces trois modes seront utilisés en fonction de savoir si l'utilisateur veut être préparé, modérément préparé ou extrêmement bien préparé.
```

** le topic principal et sa vérification ** : 

```
Très bien , l’un des topic sera : "les premiers soins » , et dans les differents items de ma checklist j’avais penser à 

- J'ai une trousse de secours transportable
- j'ai des livres sur les premiers soins
- j'ai des livres plantes medicinales 
- j'ai des livres de medecines
- j'ai des compétence en survie médicale
- j'ai suivi une formation de premiers secours.
- j'ai du matériel de base
- Sterilisation


Qu’en penses tu ? vois tu d’autres choses a posseder en terme de materiel et/ ou de competences dans ce domaine uniquement ?
```

puis ensuite les écritures des informations du topic : 

```
Très bien ! c’est partie dans ce cas pour cette section « vehicules » : 
peut tu me proposeer : 
1 titre 
1 sous titre 
1 description courte ( 200 mots max 
) 
1 descroption longue ( 500 mots max )
```

**les contents :**
```
Travaillons maintenant sur le premier topic : "- j'ai du matériel de base"

peut tu commencer par rappeler pourquoi c'est important avec des explications, puis ensuite point par point  des exemples où des détails où bien 
 tout lieu ou l’on peut trouver des informations. 
- tu me fournira ta réponse dans un seul et unique bloc de code sous forme de json comme l’exemple ci dessous 
- tu ajouteras les textes dans la partie « content" suit en ajoutant a chaque paragraphe dans l’attribut value.
- ta reponse commencera donc par : « content"
- le type ne peux être que « text » 
- ta reponse ne contiendra uniquement le bloc code , sans explications ,sans autre texte . 

voila l’exemple de json : 
{
            "id": "CANOE",
            "title": "Je possède un canoe",
            "mode": "intemediate",
            "subtitle": "",
            "image": "",
            "links": [
                {
                    "url": "https://www.expertcanoe.com/comment-choisir-un-canoe/",
                    "description": "lien web",
                    "title": "Comment choisir un canoe"
                },
                {
                    "url": "https://www.expertcanoe.com/entretenir-son-canoe/type.pdf",
                    "description": "pdf",
                    "title": "Comment entretenir son canoë"
                }
            ],
            "content": [
            {
            "type": "text",
            "value": "Posséder un canoë est un atout important pour la préparation à des situations d'urgence. Voici pourquoi :"
            },
            {
            "type": "bullet",
            "value": "Le canoë est un moyen de transport silencieux et peu coûteux qui peut être utilisé pour se déplacer rapidement sur l'eau en cas d'inondation ou d'évacuation. "
            },
            {
            "type": "bullet",
            "value": "Il peut être utilisé pour la pêche, la chasse et la collecte de nourriture en cas d'urgence ou pour l'approvisionnement à long terme. "
            }
            ]
            }
```

**traduction de Json : **

```
peut tu me traduire ce json ci dessous en anglais . 
tu ne dois me retourner que le json traduit . 
tu ne dois traduire que les textes ( pas les attributs comme  "uid","title" etc...) 
```

## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->
