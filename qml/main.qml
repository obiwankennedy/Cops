import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3


ApplicationWindow {
    id: window
    visible: true
    width: 1920
    height: 1080
    color: "grey"
    title: qsTr("Cops Generique")

    property int widthScreen: 1920
    property int heightScreen: 1080

    property int opacityTime: 2000

    property int idState: 0
    readonly property int idMax: 10



    FontLoader { id: amplify; source: "qrc:/font/Amplify_PersonalUseOnly.ttf" }
    FontLoader { id: chocolate1; source: "qrc:/font/Chocolate Covered Raindrops BOLD.ttf" }
    FontLoader { id: chocolate2; source: "qrc:/font/Chocolate Covered Raindrops Hollow.ttf" }
    FontLoader { id: chocolate3; source: "qrc:/font/Chocolate Covered Raindrops.ttf" }
    FontLoader { id: dancing; source: "qrc:/font/DancingScript-Regular.otf" }
    FontLoader { id: redvelvet; source: "qrc:/font/Red Velvet - Demo.ttf" }
    FontLoader { id: topsecret; source: "qrc:/font/_TOP_SECRET.otf" }
    FontLoader { id: mjfont; source: "qrc:/font/impact.ttf" }

    Timer {
        id: time
        interval: 5000
        repeat: true
        onTriggered:{
            idState+=1
            if(idState>window.idMax)
                idState=0
        }
    }



    Item {
        Keys.onRightPressed: {
            /*idState+=1
            console.log("IdState: "+idState)
            if(idState>window.idMax)
                idState=0*/
            time.start()
        }
        id: plate
        width: widthScreen*5
        height: heightScreen*5
        /*onScaleChanged:{
            console.log("console scale: "+plate.scale)
        }
        onXChanged: {
            console.log("console x:"+plate.x)
        }
        onYChanged: {
            console.log("console y:"+plate.y)
        }*/

        Image {
            source: "qrc:/img/cork_fin.png"
            fillMode: Image.Tile
            x:0
            y:0
            width: plate.width//+Math.abs(plate.x)
            height: plate.height//+Math.abs(plate.y)

            MouseArea {
                anchors.fill: parent
                property int previousX : 0
                property int previousY : 0
                onPressed: {
                    previousX = mouse.x
                    previousY = mouse.y
                    parent.focus = true
                }
                onPositionChanged: {
                    plate.x += (mouse.x-previousX)*plate.scale
                    plate.y += (mouse.y-previousY)*plate.scale
                    //console.log("plate:"+plate.x+" "+plate.y)
                }
                onWheel: {
                    if(wheel.angleDelta.y>0)
                    {
                        plate.scale -= 0.1
                    }
                    else
                        plate.scale += 0.1
                }
            }
        }


        Item {
            id: page1
            Behavior on opacity {
                NumberAnimation{duration: root.opacityTime}
            }
            MovableImage {
                x: 50
                y:175
                width: 800
                height: 600
                source: "qrc:/img/logo/1500-rolisteam.png"
            }
            Text {
                text: "&"
                x: 880
                y: 600
                font.pixelSize: 100
            }

            MovableImage {
                x: 1050
                y:110
                width: 600
                height: 800
                source: "qrc:/img/logo/logoProjets-R2.png"
            }
            Text {
                text: "presentent"
                x: 800
                y: 900
                font.pixelSize: 40
            }

        }

        Item {//Krom + morceau du C
            id: page2
            x: 0
            y: 2260
            width: widthScreen
            height: heightScreen
            Behavior on opacity {
                NumberAnimation{duration: root.opacityTime}
            }
            /*MouseArea {
                anchors.fill: parent
                property int previousX : 0
                property int previousY : 0
                onPressed: {
                    previousX = mouse.x
                    previousY = mouse.y
                    parent.focus = true
                }
                onPositionChanged: {
                    parent.x += (mouse.x-previousX)*plate.scale
                    parent.y += (mouse.y-previousY)*plate.scale
                    console.log("krom x:"+parent.x+" y:"+parent.y)
                }
                onWheel: {
                    if(wheel.angleDelta.y>0)
                    {
                        plate.scale -= 0.1
                    }
                    else
                        plate.scale += 0.1
                }
            }*/
            Text {
                id: maitredejeu
                text: "Maitre de jeu"
                font.family: topsecret.name
                font.pixelSize: 40
            }

            PolaroidImage {
                id: mj
                x: 97
                y: 198
                size: 300
                source: "qrc:/img/Mj.jpg"
                text: " Kromisback"
                text2: "MJ - Projets R "
            }
            PostIt {
                id: krom1
                x: 1195
                y: 19
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;}
                text: "Sadique\nInjuste\nLunatique"
                color: "pink"
            }
            PostIt {
                id: krom8
                x: 1106
                y: 639
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;}
                text: "Attends! Je cherche le bookin"
                color: "pink"
            }
            PostIt {
                id: krom9
                x: 1195
                y: 45
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;}
                text: "Attends! Je cherche la bonne page"
                color: "pink"
            }
            PostIt {
                id: krom6
                x: 1172
                y: 879
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "10-18 - Appel d'urgence"
                color: "yellow"
            }
            PostIt {
                id: krom2
                x: 1102
                y: 400
                width: 200
                height: 150
                //font: amplify.name
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                //font.pixelSize: 15
                text: "Je voulais être joueur !!!"
                color: "yellow"
            }
            PostIt {
                id: krom3
                x: 71
                y: 583
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Comprends pas le seconde dégré"
                color: "green"
            }
            PostIt {
                id: krom4
                x: 346
                y: 585
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Fondateur de Projets R"
                rotation: -5
                color: "pink"
            }
            MovableImage {//ADD Image du batiment du LAPD
                x:215
                y:599
                scale: 0.6
                source: "qrc:/img/cops-jdr-lapd-commissariat.jpg"
            }

        }
        Item {//Denis + Bas du C
            id: page3
            x: 1636
            y: 3651
            width: window.widthScreen
            height: window.heightScreen
            Behavior on opacity {
                NumberAnimation{duration: root.opacityTime}
            }

            MovableImage {//license pilote
                x: 640
                y:360
                source: ""
            }
            PolaroidImage {
                id: luckytarget
                x:26
                y:486
                size: 300
                source: "qrc:/img/Denis_Aquillian.jpg"
                text: " Denis Aquillian"
                text2: "Lucky Target "
                font { family: chocolate3.name; pixelSize: 25; weight: Font.Bold;  }//capitalization: Font.AllLowercase
            }

            PolaroidImage {//Tonfa
                x: 998
                y:195
                size: 200
                text: " Cage thoracique tout ça tout ça"
                source: "qrc:/img/imgCops/tonfa.jpg"
            }
            MovableImage {//Radiographie cote cassees
                x:567
                y:395
                //text:"radio"
                scale: 0.6

                source: "qrc:/img/imgCops/radio_bullet2.jpg"
            }
            MovableImage {//Radiographie épaule
                x: 1417
                y:700
                scale:0.7
                source: "qrc:/img/imgCops/radio_bullet1.jpg"
            }
            MovableImage {//licence de vol
                x: 535
                y:598
                scale:0.5
                source: "qrc:/img/imgCops/license.png"
            }
            PolaroidImage {//Hopital
                x: 1296
                y:543
                size: 200
                text: "Los Angeles General hospital"
                source: "qrc:/img/imgCops/hospital.jpg"
            }
            PolaroidImage {//Voiture de Denis
                x: 1622
                y:338
                size: 200
                text: "Il est bon pour la casse"
                source: "qrc:/img/imgCops/voiture_denis.jpg"
            }
            PolaroidImage {//Babouin
                x: 481
                y:850
                size: 200
                text: "babouin"
                source: "qrc:/img/imgCops/babouin.jpg"
            }
            PostIt {
                id: denis1
                x: 361
                y: 355
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Convocation Psy à 19h"
                color: "green"
            }
            PostIt {
                id: denis2
                x: 30
                y: 375
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Convocation Psy à 15h"
                color: "dodgerblue"
            }
            PostIt {
                id: denis3
                x: 1207
                y: 2
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Convocation Psy à 10h"
                color: "green"
            }
            PostIt {
                id: denis4
                x: 1413
                y: 174
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Convocation SAD à 23h"
                color: "orange"
            }
            PostIt {
                id: denis5
                x: 892
                y: 1
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Convocation SAD à 7h"
                color: "pink"
            }
            PostIt {
                id: denis6
                x: 138
                y: -68
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Convocation SAD à 12h"
                color: "green"
            }
           /* PostIt {
                id: denisText1
                x: 463
                y: 606
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 40; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "+"
                color: "dodgerblue"
                hAlign: Text.AlignHCenter
                vAlign: Text.AlignVCenter
            }*/
           /* PostIt {
                id: denisText2
                x: 1049
                y: 605
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 40; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "="
                color: "orange"
                hAlign: Text.AlignHCenter
                vAlign: Text.AlignVCenter
            }*/
            PostIt {
                id: denis7
                x: 731
                y: 296
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Muscu, Muscu, \nRespirer (important), muscu, muscu"
                color: "yellow"
            }
            PostIt {
                id: denis8
                x: 1365
                y: 365
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 30; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Rappeler Beverly"
                color: "pink"
            }
            Press {
                id: denis9
                x: 1757
                y: -308
                size: 1000
                font { pixelSize: 60; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Un Cops tue un étudiant écolo"
                date: "23 Octobre 2030"
            }
            Press {
                id: denis10
                x: -139
                y: -668
                size: 1000
                font {  pixelSize: 60; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Un cessna sur South Central"
                date: "14 août 2030"
                photo: "qrc:/img/imgCops/cessna.jpg"
                article1: "He arrived around 6:30 a.m. on Sunday bearing the small gifts that the employees at a municipal Florida airport had come to expect from him. (they were cookies.)
He also dropped off a flight plan that indicated he would take an approximately 45-minute flight to the California Keys for a family getaway before returning later in the day.
But shortly after taking off in dense fog near Tampa, the pilot, John H. Shannon, 70, and four others — including two of his daughters — were killed in a crash, the authorities said."
                article2:  "The twin-engine plane burst into flames after going down at Bartow Municipal Airport in South Central, Los Angeles. The Cessna aircraft took off despite thick fog that had settled over the airport shortly before sunrise and had limited visibility to less than one-fifth of a mile.“No one should have attempted to take off in a small plane in that weather,” Grady Judd, the Polk County sheriff, said at a news conference on Sunday.
Continue reading the main story Related Coverage Small Plane Crashes on Long Island, Killing Two an airport employee who was filming the fog on a cellphone recorded the sounds of the plane taking off and crashing, Sheriff Judd said. The fog was so thick that the plane could not be seen in the video, he said."
                hasPhoto: true
            }
            Press {
                id: denis11
                x: -33
                y: -1551
                size: 1000
                font {  pixelSize: 60; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Sniper fou, un COPS se sacrifie!!"
                date: "4 juillet 2030"
            }
            Press {
                id: denis12
                x: 120
                y: -2389
                size: 1000
                font { pixelSize: 60; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Le dernier disney fait un ravage"
                date: "24 décembre 2030"//family: mjfont.name;
            }
       /*     MouseArea {
                anchors.fill: parent
                property int previousX : 0
                property int previousY : 0
                onPressed: {
                    previousX = mouse.x
                    previousY = mouse.y
                    parent.focus = true
                }
                onPositionChanged: {
                    parent.x += (mouse.x-previousX)*plate.scale
                    parent.y += (mouse.y-previousY)*plate.scale
                    console.log("denis x:"+parent.x+" y:"+parent.y)
                }
                onWheel: {
                    if(wheel.angleDelta.y>0)
                    {
                        plate.scale -= 0.1
                    }
                    else
                        plate.scale += 0.1
                }
            }*/
        }

        Item {//Guillermo + Bas du O
            id: page4
            x: 3327
            y: 2013
            width: window.widthScreen
            height: window.heightScreen
            Behavior on opacity {
                NumberAnimation{duration: root.opacityTime}
            }
            MovableImage {//Dossier censuré
                x: -982
                y: -762
                scale: 0.25
                //size: 200
                //text: "Dossier censuré"
                source: "qrc:/img/imgCops/applicationForm.JPG"
            }
            PolaroidImage {
                id: captainPoubelle
                x: 42
                y: 456
                size: 300
                source: "qrc:/img/Guillermo_Gonzalvez.jpg"
                text: " Guillermo Gonzalvez"
                text2: "Captain \n Poubelle "
            }
            MovableImage {//Mexique
                x: 444
                y: 885
                source: "qrc:/img/imgCops/mexico.jpg"
            }
            PolaroidImage {//Gangers
                x: 900
                y: 351
                size: 200
                text: "Gangers"
                source: "qrc:/img/imgCops/gang.jpg"
            }
            PolaroidImage {//Voiture défoncée
                x: 1604
                y: 39
                size: 200
                text: "Ma voiture de service"
                source: "qrc:/img/imgCops/voiture_cops.jpg"
            }
            PolaroidImage {//Wanted Voiture
                x: window.widthScreen*0.4
                y:20
                size: 200
                text: "Wanted Voiture"
                source: "qrc:/img/a mod.png"
            }
            PolaroidImage {//Wanted Cartel
                x: window.widthScreen*0.4
                y:20
                size: 200
                text: "Wanted Cartel"
                source: "qrc:/img/a mod.png"
            }
            PolaroidImage {//Poubelle
                x: 987
                y:796
                size: 200
                text: "Poubelle"
                source: "qrc:/img/imgCops/trash-bin.jpg"
            }
            PostIt {
                x: 1689
                y: 568
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Acheter Tequila"
                color: "green"
            }
            PostIt {
                x: 581
                y: 346
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Aller au Mexique"
                color: "green"
            }
            Press {
                x: 70
                y: -16
                size: 1000
                font { pixelSize: 60; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Carambolage sur L'A10"//family: gothi.name;
                date: "4 Janvier 2031"
                hasPhoto: true
                height:400
                photo: "qrc:/img/imgCops/car_crash_2.jpg"
                article1: "Authorities have identified the big rig driver who was killed this week in a fiery multi-vehicle crash on the 5 freeway near Griffith Park. Officials say 41-year-old Thang Le died at the scene of the crash that happened around 11 AM on Tuesday.Ten others were injured, one critically, in the crash Tuesday involving three big rigs and five other vehicles on the 5 Freeway in the Los Feliz area."
                article2: "The crash, which forced a full closure of the freeway, was reported at Los Feliz Boulevard about 10:55 a.m. and sparked a massive fire as debris scattered across the southbound freeway lanes."

            }
            Press {
                x: 2637
                y: 1157
                size: 1000
                font {  pixelSize: 60; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Accident sur l'A5"//family: gothi.name;
                date: "16 février 2031"
            }
            Press {
                x: 315
                y: 2063
                size: 1000
                font { pixelSize: 35; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Incendit sur un pont: des véhicules du LAPD impliqués"
                date: "6 mars 2031"
                photo: "qrc:/img/imgCops/accident.jpeg"
                hasPhoto: true
                height:400
                article1: "A Santa Maria police officer was hospitalized in stable condition Monday, a day after crashing his patrol car while responding to a foot chase involving another officer, according to police.Officer Damon Badenell, a Santa Maria resident who has been on the force for three years, was awake and sitting up in the intensive-care unit at Santa Barbara Cottage Hospital, according to police Lt. Rico Flores, head of the Police Department's traffic operations."
                article2: "Badenell, who suffered several broken bones and non-life-threatening injuries, was expected to remain in the hospital for about a week, Flores said. Badenell was northbound on Broadway, just north of Main Street, at about 4:30 a.m. Sunday when he lost control of his patrol car, Flores said."
            }
          /*  MouseArea {
                anchors.fill: parent
                property int previousX : 0
                property int previousY : 0
                onPressed: {
                    previousX = mouse.x
                    previousY = mouse.y
                    parent.focus = true
                }
                onPositionChanged: {
                    parent.x += (mouse.x-previousX)*plate.scale
                    parent.y += (mouse.y-previousY)*plate.scale
                    console.log("guillermo x:"+parent.x+" y:"+parent.y)
                }
                onWheel: {
                    if(wheel.angleDelta.y>0)
                    {
                        plate.scale -= 0.1
                    }
                    else
                        plate.scale += 0.1
                }
            }*/
        }

        Item {//Lynn + Bas du PS
            id: page5
            x: 7353
            y: 3678
            width: window.widthScreen
            height: window.heightScreen
            Behavior on opacity {
                NumberAnimation{duration: root.opacityTime}
            }
            MovableImage {//Diplôme
                x: 1147
                y: 331
                scale: 1.7
                //text:"radio"
                source: "qrc:/img/imgCops/lapd-diploma-1-638.jpg"
            }

            MovableImage {//Cible
                x: 271
                y:470
                scale: 0.8
                //size: 200
                //text: "Entrainement matinal"
                source: "qrc:/img/imgCops/targetheadshot.jpg"
            }
            MovableImage {//Head shot de CS
                x: 1580
                y: -200
                scale: 0.3
                //size: 200
                //text: "Motif sur masque"
                source: "qrc:/img/imgCops/logo_headshot.jpg"
            }
            PostIt {
                x: 1580
                y: -200
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Horraire COPS:\nNuit: 23h-7h\nMatin: 7h-15h\nAprès-midi: 15h23h"
                color: "blue"
            }
            PolaroidImage {//Moto
                x: 1610
                y: 10
                size: 200
                text: " Ma titine"
                source: "qrc:/img/imgCops/moto.jpg"
            }
            PolaroidImage {//Flingue 1
                x: 35
                y:723
                size: 200
                text: " Gangster"
                source: "qrc:/img/imgCops/compactUni_arme2.jpg"
            }
            PolaroidImage {//Flingue 2
                x: 628
                y: 723
                size: 200
                text: " Paradise"
                source: "qrc:/img/imgCops/falcon_arme1.jpg"
            }

            PostIt {
                x: 40
                y: 226
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Appeler Papa!"
                color: "yellow"
            }

            PostIt {
                x: 737
                y: 338
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "-Lait et Graine de Soja\n-Tofu à Aubergine\n-Rhubarbe\n-Champignon\n-Pousses d'épinard"
                color: "green"
            }

            PostIt {
                x: 382
                y: 318
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Donner Prostectus\n bureau de Damask\n de recrutement COPS"
                color: "pink"
            }
            PolaroidImage {
                id: headshot
                x: 1636
                y: 460
                size: 200
                source: "qrc:/img/Lynn.jpg"
                text: " Lynn Gray-Rike"
                text2: "HeadShot "
            }
            Press {
                x: 148
                y: -548
                size: 1000
                font { pixelSize: 60; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Carton plein pour la jeune COPS"//family: gothi.name;
                date: "20 Juin 2030"
                hasPhoto: true
                height:420
                photo: "qrc:/img/imgCops/cadet_Police.jpg"
                article1: "Une jeune policière du COPS a tué 3 gangers d'une balle dans la tête chacun lors de son premièr jour en service. Les services du LAPD assure que les tirs étaient justifiés. le SAD n'a pas été saisie du dossier.en raison du nombre important de témoin et de personnel du LAPD. Les officiers ont été témoin d'un go-fast d'un gang qui a mal tourné quand ils ont percuté un camion de 35tonnes."
                article2: "Les officiels n'ont pas communiqué le nom de la jeune officier. Il a été cependant expliqué qu'elle été une très bonne tireuse. Depuis toute petite, elle fréquente des stands de tir. L'identité des victimes n'a pas été révélé mais ils étaient tous connus des services de police. Des associations d'aide aux victimes policières accuse le LAPD de protéger un agent fou de la gachette."
            }
          /*  MouseArea {
                anchors.fill: parent
                property int previousX : 0
                property int previousY : 0
                onPressed: {
                    previousX = mouse.x
                    previousY = mouse.y
                    parent.focus = true
                }
                onPositionChanged: {
                    parent.x += (mouse.x-previousX)*plate.scale
                    parent.y += (mouse.y-previousY)*plate.scale
                    console.log("lynn x:"+parent.x+" y:"+parent.y)
                }
                onWheel: {
                    if(wheel.angleDelta.y>0)
                    {
                        plate.scale -= 0.1
                    }
                    else
                        plate.scale += 0.1
                }
            }*/
        }
        Item {//Max + Haut du PS
            id: page6
            x: 7396
            y: 1511
            width: window.widthScreen
            height: window.heightScreen
            Behavior on opacity {
                NumberAnimation{duration: root.opacityTime}
            }
            MovableImage {//Livret de famille de max
                x: 1618
                y: 767
                source: ""
            }
            PostIt {
                x: 1453
                y: 300
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Born in the USA!"
                color: "yellow"
            }
            PostIt {
                x: 598
                y: 829
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Comme le dirait\nma femme!"
                color: "yellow"
            }
            PostIt {
                x: 417
                y: 539
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "By the book"
                color: "yellow"
            }
            MovableImage {//Dessin d'enfant
                x: 1141
                y: 454
                source: "qrc:/img/imgCops/dessinenfant.jpg"
            }
            PolaroidImage {//house
                x: 1006
                y: 805
                size: 200
                text: " Maison"
                source: "qrc:/img/imgCops/house_max.jpg"
            }
            PolaroidImage {//sniper
                x: 1542
                y:546
                size: 200
                text: " Compagne"
                source: "qrc:/img/imgCops/hecate.jpg"
            }
            PolaroidImage {//Flingue 1
                x: -5
                y: -7
                size: 200
                text: " Cadeau du zoo de Pasadena!"
                source: "qrc:/img/imgCops/tigre.jpg"
            }

            PostIt {
                x: 1231
                y: -16
                rotation: 5
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Et le tigre est en toi!"
                color: "yellow"
            }
            PolaroidImage {
                id: columbo
                x: 801
                y: 327
                size: 200
                source: "qrc:/img/max_ohara_bis4.jpg"
                text: " Max O'Hara"
                text2: "Columbo "
            }//

          /*  MouseArea {
                anchors.fill: parent
                property int previousX : 0
                property int previousY : 0
                onPressed: {
                    previousX = mouse.x
                    previousY = mouse.y
                    parent.focus = true
                }
                onPositionChanged: {
                    parent.x += (mouse.x-previousX)*plate.scale
                    parent.y += (mouse.y-previousY)*plate.scale
                    console.log("Max x:"+parent.x+" y:"+parent.y)
                }
                onWheel: {
                    if(wheel.angleDelta.y>0)
                    {
                        plate.scale -= 0.1
                    }
                    else
                        plate.scale += 0.1
                }
            }*/
        }

        Item {//Others + Haut du CO
            id: page7
            x: window.widthScreen*1.5
            y: 0
            width: window.widthScreen
            height: window.heightScreen
            Behavior on opacity {
                NumberAnimation{duration: root.opacityTime}
            }
            Rectangle {
                x: 679
                y: 50
                width: 800
                height: 150
                color: "grey"
                Text {
                    anchors.centerIn: parent
                    font { family: topsecret.name; pixelSize: 60;   }//capitalization: Font.AllLowercase weight: Font.Bold;
                    text: "Ils ont servi le COPS"
                }
            }

            PolaroidImage {
                id: rick
                x: 140
                y: 400
                size: 200
                source: "qrc:/img/Rick_Darcy.jpg"
                text: " Rick Darcy"
                text2: ""
                rotation: 0
            }
            PolaroidImage {
                id: kim
                x: 620
                y: 400
                size: 200
                source: "qrc:/img/Khu_Ying_Kim_square.jpg"
                text: " Khu Ying Kim"
                text2: ""
                rotation: 0
            }
            PolaroidImage {
                id: atm
                x: 1100
                y: 400
                size: 200
                source: "qrc:/img/Christopher_Atkins.jpg"
                text: " Christopher Atkins"
                text2: "ATM "
                rotation: 0
            }
            PolaroidImage {
                id: image
                x: 1580
                y: 400
                size: 200
                source: "qrc:/img/Anpaytoo_Yepa_square.jpg"
                text: " Anpaytoo Yepa"
                text2: ""
                rotation: 0
            }
            PolaroidImage {//Menottes
                x: 1088
                y:753
                size: 200
                text: "Menottes"
                source: "qrc:/img/imgCops/menottes.jpg"
            }
            PolaroidImage {//Spitfire 1
                x: 243
                y: 942
                size: 200
                text: "Californian S90 \"spitfire\""
                source: "qrc:/img/imgCops/speedfire.png"
            }
        }
        Item {
            id: bodycount
            x: 4800
            y: 4000
            width: window.widthScreen
            height: window.heightScreen
            Rectangle {
                x: 679
                y: 50
                id:title
                width: 800
                height: 150
                color: "grey"
                Text {
                    anchors.centerIn: parent
                    font { family: topsecret.name; pixelSize: 60;   }//capitalization: Font.AllLowercase weight: Font.Bold;
                    text: "Body Count"
                }
            }
            ColumnLayout {
                anchors.top: title.bottom
                anchors.left: parent.left
                anchors.bottom:parent.bottom
                anchors.right: parent.right
                RowLayout {
                    Layout.alignment: Qt.AlignLeft
                    Layout.maximumWidth: 150+15*150
                    PostIt {
                        x: 1231
                        y: -16
                        rotation: 5
                        width: 200
                        height: 150
                        font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                        text: "Headshot"
                        color: "lightblue"
                    }
                    Repeater {
                        model: 15
                        MovableImage {//Cible
                            Layout.maximumHeight: 150
                            Layout.maximumWidth: 150
                            Layout.alignment: Qt.AlignLeft
                            source: "qrc:/img/imgCops/logo_headshot.jpg"
                        }
                    }
                }
                RowLayout {
                    Layout.alignment: Qt.AlignLeft
                    Layout.maximumWidth: 150+5*150
                    PostIt {
                        x: 1231
                        y: -16
                        rotation: -5
                        width: 200
                        height: 150
                        font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                        text: "Captain Poubelle"
                        color: "green"
                    }
                    Repeater {
                        model: 5
                        MovableImage {//Cible
                            Layout.maximumHeight: 150
                            Layout.maximumWidth: 150
                            Layout.alignment: Qt.AlignLeft
                            source: "qrc:/img/imgCops/123.png"
                        }
                    }
                }
                RowLayout {
                    Layout.alignment: Qt.AlignLeft
                    Layout.maximumWidth: 150+3*150
                    PostIt {
                        x: 1231
                        y: -16
                        rotation: -10
                        width: 200
                        height: 150
                        font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                        text: "Lucky Target"
                        color: "pink"
                    }
                    Repeater {
                        model: 3
                        MovableImage {//Cible
                            Layout.maximumHeight: 150
                            Layout.maximumWidth: 150
                            Layout.alignment: Qt.AlignLeft
                            source: "qrc:/img/imgCops/tonfa.jpg"
                        }
                    }
                }
                RowLayout {
                    Layout.alignment: Qt.AlignLeft
                    Layout.maximumWidth: 150+9*150
                    PostIt {
                        x: 1231
                        y: -16
                        rotation: 5
                        width: 200
                        height: 150
                        font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                        text: "Columbo"
                        color: "yellow"
                    }
                    Repeater {
                        model: 9
                        MovableImage {//Cible
                            Layout.maximumHeight: 150
                            Layout.maximumWidth: 150
                            Layout.alignment: Qt.AlignLeft
                            source: "qrc:/img/imgCops/snipe.png"
                        }
                    }
                }
            }
        }

        Item {
            id: imageFinale
            anchors.fill: parent
            Behavior on opacity {
                NumberAnimation{duration: root.opacityTime}
            }
            MovableImage {//Drapeau californie
                x: 7661
                y: 300
                source: "qrc:/img/imgCops/califorinia.jpg"
                scale: 1.4
            }
            MovableImage {//insigne LAPD
                x: 2430
                y: -550
                scale: 0.25
                source: "qrc:/img/imgCops/logo_police.png"
            }
            MovableImage {//Los Angeles Logo
                x: 4900
                y: 1120
                scale: 4.0
                source: "qrc:/img/imgCops/logo_la.png"
            }
            MovableImage {//Panneau Los Angeles
                x: 5987
                y: 2202
                source: "qrc:/img/imgCops/los-angelesPanneau.jpg"
            }
            MovableImage {//Hollywood
                x: 4550
                y: 3300
                scale: 0.4
                source: "qrc:/img/imgCops/hollywood.jpeg"
            }
            MovableImage {//Gob
                x: -295
                y: 3804
                scale: 0.7
                source: "qrc:/img/imgCops/carte-la-gob---gp.jpg"
            }
        }

        states: [
            State {
                name: "one"
                when:idState == 0
                PropertyChanges {
                    target: plate
                    x: 0
                    y: 0
                }
            },
            State {
                name: "two"
                when:idState == 1
                PropertyChanges {
                    target: plate
                    x: -page2.x
                    y: -page2.y
                }
            },
            State {
                name: "three"
                when:idState == 2
                PropertyChanges {
                    target: plate
                    x: -page3.x
                    y: -page3.y
                }
            },
            State {
                name: "four"
                when:idState == 3
                PropertyChanges {
                    target: plate
                    x: -page4.x
                    y: -page4.y
                }
            },
            State {
                name: "five"
                when:idState == 4
                PropertyChanges {
                    target: plate
                    x: -page5.x
                    y: -page5.y
                }
            },
            State {
                name: "six"
                when:idState == 5
                PropertyChanges {
                    target: plate
                    x: -page6.x
                    y: -page6.y
                }
            },
            State {
                name: "sept"
                when:idState == 6
                PropertyChanges {
                    target: plate
                    x: -page7.x
                    y: -page7.y
                }
            },
            State {
                name: "eight"
                extend: "sept"
                when:idState == 7
                PropertyChanges {
                    target: plate
                    scale: 0.2
                    x:-1920*2
                    y:-1080*2
                }
            },
            State {
                name: "nine"
                when:idState == 8
                extend: "eight"
                PropertyChanges {
                    target: grostext
                    opacity: 1.0
                }
            },
            State {
                name: "ten"
                extend: "nine"
                when:idState == 9
                PropertyChanges {
                    target: plate
                    scale: 0.2
                    x:-1920*2
                    y:-1080*2

                    //width: 1920
                    //height: 1080
                }
              /*  PropertyChanges {
                    target: grostext
                    opacity: 1.0
                }*/
                PropertyChanges {
                    target: page1
                    opacity: 0.0
                }
                PropertyChanges {
                    target: page2
                    opacity: 0.0
                }
                PropertyChanges {
                    target: page3
                    opacity: 0.0
                }
                PropertyChanges {
                    target: page4
                    opacity: 0.0
                }
                PropertyChanges {
                    target: page5
                    opacity: 0.0
                }
                PropertyChanges {
                    target: page6
                    opacity: 0.0
                }
                PropertyChanges {
                    target: page7
                    opacity: 0.0
                }
                PropertyChanges {
                    target: line
                    opacity: 0.0
                }
                PropertyChanges {
                    target: imageFinale
                    opacity: 0.0
                }
                PropertyChanges {
                    target: line1
                    opacity: 0.0
                }
            }
        ]
        transitions: [
            Transition {
                from: "*"
                to: "*"
                ParallelAnimation {
                    PropertyAnimation { target: plate
                        properties: "x"; duration: 1000 }
                    PropertyAnimation { target: plate
                        properties: "y"; duration: 1000 }
                    PropertyAnimation { target: plate
                        properties: "scale"; duration: 1000 }
                }
            }
        ]
        Line {
            id: line
            anchors.fill: parent
            x1: 800
            y1: 990
            xlist: [1343,210 ,1930,3500,9000,8300,4000]
            ylist: [1569,2860,4520,3020,4150,2060,280]
            penWidth: 8
        }

        Line {
            id: line1
            anchors.fill: parent
            color: "blue"
            x1: 3930
            y1: 4420
            xlist: [2000,2500,2899,3150,5150,5150,5600,6850,7550,8200]
            ylist: [3000,2110,1450,950 ,2100,3700,4100,3200,1800,1000]
            penWidth: 8
        }

        Text {
            id: grostext
             text: "COPS"
             anchors.fill: parent
             font.pixelSize: 3400
             verticalAlignment: Text.AlignVCenter
             horizontalAlignment: Text.AlignHCenter
             opacity: 1.0
             Behavior on opacity {
                 NumberAnimation{duration: root.opacityTime*1.5}
             }
         }
        Keys.onSpacePressed:{
            console.log("presssed space")
            if(time.running)
            {
                time.stop()
            }
            else
                time.restart()
        }
    }





}
