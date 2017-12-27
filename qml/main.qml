import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3


ApplicationWindow {
    id: window
    visible: true
    width: 1920
    height: 1080
    color: "grey"
    title: qsTr("Hello World")

    property int widthScreen: 1920
    property int heightScreen: 1080

    property int idState: 0



    FontLoader { id: amplify; source: "qrc:/font/Amplify_PersonalUseOnly.ttf" }
    FontLoader { id: chocolate1; source: "qrc:/font/Chocolate Covered Raindrops BOLD.ttf" }
    FontLoader { id: chocolate2; source: "qrc:/font/Chocolate Covered Raindrops Hollow.ttf" }
    FontLoader { id: chocolate3; source: "qrc:/font/Chocolate Covered Raindrops.ttf" }
    FontLoader { id: dancing; source: "qrc:/font/DancingScript-Regular.otf" }
    FontLoader { id: redvelvet; source: "qrc:/font/Red Velvet - Demo.ttf" }
    FontLoader { id: topsecret; source: "qrc:/font/_TOP_SECRET.otf" }
    FontLoader { id: mjfont; source: "qrc:/font/impact.ttf" }



    Item {
        Keys.onRightPressed: {
            idState+=1
            console.log("IdState: "+idState)
            if(idState>6)
                idState=0
        }
        id: plate
        width: widthScreen*5
        height: heightScreen*4



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
                    plate.x += mouse.x-previousX
                    plate.y += mouse.y-previousY
                }
                onWheel: {
                    if(wheel.angleDelta.y>0)
                    {
                        parent.rotation -= 1
                    }
                    else
                        parent.rotation += 1
                }
            }
        }

        Item {
            id: page1
            MovableImage {
                x: 120
                y:175
                width: 800
                height: 600
                source: "qrc:/img/logo/1500-rolisteam.png"
            }
            Text {
                text: "et"
                x: 800
                y: 400
                font.pixelSize: 40
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
            y: heightScreen
            width: widthScreen
            height: heightScreen
            Text {
                id: maitredejeu
                text: "Maitre de jeu"
                font.family: topsecret.name
                font.pixelSize: 40
            }

            PolaroidImage {
                id: mj
                x: 233
                y: 258
                size: 300
                source: "qrc:/img/Mj.jpg"
                text: " Kromisback"
                text2: "MJ - Projets R "
            }
            PostIt {
                id: krom1
                x: 1144
                y: 74
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;}
                text: "Sadique / Injuste / Lunatique"
                color: "pink"
            }
            PostIt {
                id: krom6
                x: 1422
                y: 471
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "10-18 - Appel d'urgence"
                color: "yellow"
            }
            PostIt {
                id: krom2
                x: 1246
                y: 102
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
                x: 247
                y: 652
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Comprends pas le seconde dégré"
                color: "green"
            }
            PostIt {
                id: krom4
                x: 485
                y: 638
                width: 200
                height: 150
                //font: amplify.name
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                //font.pixelSize: 15
                text: "Fondateur de Projets R"
                rotation: -5
                color: "pink"
            }
        }
        Item {//Denis + Bas du C
            id: page3
            x: window.widthScreen
            y: window.heightScreen
            width: window.widthScreen
            height: window.heightScreen

            MovableImage {//license pilote
                x: 640
                y:360
                source: ""
                PolaroidImage {
                    id: luckytarget

                    size: 300
                    source: "qrc:/img/Denis_Aquillian.jpg"
                    text: " Denis Aquillian"
                    text2: "Lucky Target "
                    font { family: chocolate3.name; pixelSize: 25; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                }
            }

            MovableImage {//Tonfa
                x: window.widthScreen*0.4
                y:20

                source: "qrc:/img/imgCops/tonfa.jpg"
            }
            PolaroidImage {//Hopital
                x: window.widthScreen*0.4
                y:20
                size: 200
                text: "Los Angeles General hospital (home)"
                source: "qrc:/img/imgCops/hospital.jpg"
            }
            MovableImage {//Radiographie cote cassees
                x: window.widthScreen*0.4
                y:20
                //text:"radio"
                source: "qrc:/img/imgCops/radio.jpg"
            }
            PolaroidImage {//Menottes
                x: window.widthScreen*0.4
                y:20
                size: 200
                text: "menottes"
                source: "qrc:/img/imgCops/menottes.jpg"
            }
            PolaroidImage {//Babouin
                x: window.widthScreen*0.4
                y:20
                size: 200
                text: "babouin"
                source: "qrc:/img/imgCops/babouin.jpg"
            }
            PostIt {
                id: denis1
                x: 1341
                y: 260
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Convocation Psy à 19h"
                color: "green"
            }
            PostIt {
                id: denis2
                x: 1176
                y: 241
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Convocation Psy à 15h"
                color: "pink"
            }
            PostIt {
                id: denis3
                x: 996
                y: 209
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Convocation Psy à 10h"
                color: "green"
            }
            PostIt {
                id: denis4
                x: 835
                y: 120
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Convocation SAD à 23h"
                color: "green"
            }
            PostIt {
                id: denis5
                x: 698
                y: 78
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Convocation SAD à 7h"
                color: "pink"
            }
            PostIt {
                id: denis6
                x: 657
                y: -35
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Convocation SAD à 12h"
                color: "green"
            }
            PostIt {
                id: denis7
                x: 247
                y: 652
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Muscu, Muscu, \nRespirer (important), muscu, muscu"
                color: "yellow"
            }
            PostIt {
                id: denis8
                x: 247
                y: 652
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Rappeler Beverly"
                color: "pink"
            }
            Press {
                id: denis9
                x: 247
                y: 652
                width: 200
                height: 150
                font { family: mjfont.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Un Cops tue un étudiant écolo"
                color: "gray"
            }
            Press {
                id: denis10
                x: 247
                y: 652
                width: 200
                height: 150
                font { family: mjfont.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Un cessna sur South Central"
                color: "gray"
            }
            Press {
                id: denis11
                x: 247
                y: 652
                width: 200
                height: 150
                font { family: mjfont.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Afin de repérer un sniper fou, il se sacrifie !!"
                color: "gray"
            }
            Press {
                id: denis12
                x: 247
                y: 652
                width: 200
                height: 150
                font { family: mjfont.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Le dernier disney fait un ravage"
                color: "gray"
            }
        }

        Item {//Guillermo + Bas du O
            id: page4
            x: window.widthScreen*2
            y: window.heightScreen
            width: window.widthScreen
            height: window.heightScreen

            PolaroidImage {
                id: captainPoubelle
                x: 1546
                y: 154
                size: 300
                source: "qrc:/img/Guillermo_Gonzalvez.jpg"
                text: " Guillermo Gonzalvez"
                text2: "Captain \n Poubelle "
            }
            PolaroidImage {//Mexique
                x: 100
                y: 511
                size:200
                text: "Mexique"
                source: "qrc:/img/imgCops/mexico.jpg"
            }
            PolaroidImage {//Gangers
                x: window.widthScreen*0.4
                y:20
                size: 200
                text: "Gangers"
                source: "qrc:/img/imgCops/gang.jpg"
            }
            PolaroidImage {//Voiture défoncée
                x: window.widthScreen*0.4
                y:20
                size: 200
                text: "Ma voiture de service"
                source: "qrc:/img/imgCops/accident.jpeg"
            }
            PolaroidImage {//Dossier censuré
                x: 1183
                y:155
                size: 200
                text: "Dossier censuré"
                source: "qrc:/img/a mod.png"
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
                x: window.widthScreen*0.4
                y:20
                size: 200
                text: "Poubelle"
                source: "qrc:/img/imgCops/trash-bin.jpg"
            }
            PostIt {
                x: 505
                y: 39
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Acheter Tequila"
                color: "green"
            }
            PostIt {
                x: 833
                y: 70
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Aller au Mexique"
                color: "green"
            }
            Press {
                x: 247
                y: 652
                width: 200
                height: 150
                font { family: mjfont.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Carambolage sur L'A10"
                color: "gray"
            }
            Press {
                x: 247
                y: 652
                width: 200
                height: 150
                font { family: mjfont.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Accident sur l'A5"
                color: "gray"
            }
            Press {
                x: 1153
                y: 16
                width: 200
                height: 150
                font { family: mjfont.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Incendit sur le pont impliquant plusieurs véhicules"
                color: "gray"
            }
        }

        Item {//Lynn + Bas du PS
            id: page5
            x: window.widthScreen*3
            y: window.heightScreen
            width: window.widthScreen
            height: window.heightScreen

            PolaroidImage {
                id: headshot
                x: 360
                y: 200
                size: 200
                source: "qrc:/img/Lynn.jpg"
                text: " Lynn Gray-Rike"
                text2: "HeadShot "
            }
            MovableImage {//Cible
                x: window.widthScreen*0.4
                y:20
                //size: 200
                //text: "Entrainement matinal"
                source: "qrc:/img/imgCops/targetheadshot.jpg"
            }
            PolaroidImage {//Head shot de CS
                x: 750
                y: 767
                size: 200
                text: "Motif sur masque"
                source: "qrc:/img/imgCops/logo_headshot.jpg"
            }
            PolaroidImage {//Moto
                x: 1140
                y: 333
                size: 200
                text: " Ma titine"
                source: "qrc:/img/imgCops/moto.jpg"
            }
            PolaroidImage {//Flingue 1
                x: 30
                y:761
                size: 200
                text: " Gangster"
                source: "qrc:/img/imgCops/compactUni_arme2.jpg"
            }
            PolaroidImage {//Flingue 2
                x: 378
                y:743
                size: 200
                text: " Paradise"
                source: "qrc:/img/imgCops/falcon_arme1.jpg"
            }
            MovableImage {//Diplôme
                x: window.widthScreen*0.4
                y:20
                //text:"radio"
                source: "qrc:/img/imgCops/lapd-diploma-1-638.jpg"
            }
            PostIt {
                x: 828
                y: 258
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Appeler Papa!"
                color: "yellow"
            }

            PostIt {
                x: 1469
                y: 442
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "-Lait et Graine de Soja\n-Tofu à Aubergine\n-Rhubarbe\n-Champignon\n-Pousses d'épinard"
                color: "green"
            }

            PostIt {
                x: 1323
                y: 99
                width: 200
                height: 150
                font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
                text: "Livrer Prostectus à Damask\n de recrutement COPS"
                color: "pink"
            }
        }
        Item {//Max + Haut du PS
            id: page6
            x: window.widthScreen*3
            y: 0
            width: window.widthScreen
            height: window.heightScreen

            PolaroidImage {
                id: columbo
                x: 713
                y: 200
                size: 200
                source: "qrc:/img/max_ohara_bis4.jpg"
                text: " Max O'Hara"
                text2: "Columbo "
                rotation: -3
            }
        }

        Item {//Others + Haut du CO
            id: page7
            x: window.widthScreen*1.5
            y: 0
            width: window.widthScreen
            height: window.heightScreen

            PolaroidImage {
                id: rick
                x: 0
                y: 200
                size: 200
                source: "qrc:/img/Rick_Darcy.jpg"
                text: " Rick Darcy"
                text2: ""
                rotation: 0
            }
            PolaroidImage {
                id: kim
                x: 543
                y: 200
                size: 200
                source: "qrc:/img/Khu_Ying_Kim_square.jpg"
                text: " Khu Ying Kim"
                text2: ""
                rotation: 0
            }
            PolaroidImage {
                id: atm
                x: 170
                y: 200
                size: 200
                source: "qrc:/img/Christopher_Atkins.jpg"
                text: " Christopher Atkins"
                text2: "ATM "
                rotation: 0
            }
            PolaroidImage {
                id: image
                x: 157
                y: 200
                size: 200
                source: "qrc:/img/Anpaytoo_Yepa_square.jpg"
                text: " Anpaytoo Yepa"
                text2: ""
                rotation: 0
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
                    x: 0
                    y: -window.heightScreen
                }
            },
            State {
                name: "three"
                when:idState == 2
                PropertyChanges {
                    target: plate
                    x: -window.widthScreen
                    y: -window.heightScreen
                }
            },
            State {
                name: "four"
                when:idState == 3
                PropertyChanges {
                    target: plate
                    x: -2*window.widthScreen
                    y: -window.heightScreen
                }
            },
            State {
                name: "five"
                when:idState == 4
                PropertyChanges {
                    target: plate
                    x: -3*window.widthScreen
                    y: -window.heightScreen
                }
            },
            State {
                name: "six"
                when:idState == 5
                PropertyChanges {
                    target: plate
                    x: -3*window.widthScreen
                    y: 0
                }
            },
            State {
                name: "sept"
                when:idState == 6
                PropertyChanges {
                    target: plate
                    x: -1.5*window.widthScreen
                    y: 0
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
                }
            }
        ]
        /*Line {
            anchors.fill: parent
            x1: headshot.x
            y1: headshot.y
            x2: 1543
            y2: 1569
            penWidth: 8
        }*/
    }

}
