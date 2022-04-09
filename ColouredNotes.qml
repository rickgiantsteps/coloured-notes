import QtQuick 2.0
import QtQuick.Controls 2.2
import MuseScore 3.0

MuseScore {
      
      menuPath: "ColouredNotes"
      description: "This Plugin colours the notes in a composition based on the chosen system."
      pluginType: "dialog"
      version: "1.0"
      
      width:  500 
      height: 630
      id: mainWindow
      
      function coloranote(nomesistema) {
            labelResult.text =  "Notes coloured following " + nomesistema + "'s system.";
            var NoteNere = ["#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000"]
            var Newton = ["#d82a2f", "#000000", "#e78c36", "#000000", "#fff32b", "#bcd85f", "#000000", "#009c95", "#000000", "#5e50a1", "#000000", "#cf3e96"]
            var Castel = ["#2b337f", "#009991", "#019e47", "#649851", "#f7e95e", "#f1cc5f", "#e78c36", "#d82a2f", "#992c2b", "#c42c82", "#5a337c", "#812d7d"]
            var Field = ["#2b337f", "#000000", "#812d7d", "#000000", "#d82a2f", "#e78c36", "#000000", "#f7e95e", "#000000", "#839841", "#000000", "#019e47"]
            var Jameson = ["#d82a2f", "#db6234", "#e78c36", "#f1cc5f", "#f7e95e", "#019e47", "#009991", "#2b337f", "#55307a", "#812d7d", "#a23484", "#c42c82"]
            var Helmholtz = ["#f7e95e", "#019e47", "#00968f", "#01769b", "#812d7d", "#c42c82", "#942953", "#d82d2e", "#be462c", "#be5031", "#da4e30", "#e58836"]
            var Bishop = ["#d82a2f", "#992c2b", "#e78c36", "#f3ca33", "#f7e95e", "#c0d75d", "#019e47", "#00a893", "#812d7d", "#c42c82", "#c5375e", "#d82a2f"]
            var Seemann = ["#702021", "#d82d2e", "#e78c36", "#f1cc5f", "#f7e95e", "#019e47", "#009991", "#2b337f", "#812d7d", "#c42c82", "#65433f", "#141313"]
            var Rimington = ["#d82a2f", "#992c2b", "#db6234", "#e78c36", "#f7e95e", "#839841", "#019e47", "#00a893", "#009991", "#812d7d", "#2b337f", "#c42c82"]
            var Scriabin = ["#d82a2f", "#c42c82", "#f7e95e", "#646989", "#006aa8", "#992c2b", "#2b337f", "#e78c36", "#812d7d", "#019e47", "#646989", "#006aa8"]
            var Klein = ["#b12b2c", "#d82a2f", "#db6234", "#e78c36", "#f7e95e", "#c0d75d", "#019e47", "#009991", "#2b337f", "#7d3984", "#c42c82", "#982c66"]
            var Aeppli = ["#d82a2f", "#000000", "#812d7d", "#000000", "#f7e95e", "#000000", "#019e47", "#009991", "#000000", "#016aa8", "#5a337c", "#812d7d"]
            var Belmont = ["#d82a2f", "#db6234", "#e78c36", "#f3ca33", "#f7e95e", "#c0d75d", "#019e47", "#009991", "#2b337f", "#993685", "#c42c82", "#a12d57"]
            var Zieverink = ["#c0d75d", "#019e47", "#009991", "#2b337f", "#812d7d", "#c42c82", "#6e254c", "#8f3128", "#d82a2f", "#e78c36", "#efe89c", "#f7e95e"]
            var startStaff = 0
            var endStaff = curScore.nstaves - 1
            var startTick = 0
            var endTick
            
            var cursor = curScore.newCursor()
            cursor.rewind(1)
            
            if (cursor.segment) {
                  startStaff = cursor.staffIdx
                  startTick = cursor.tick
                  cursor.rewind(2)
                  if (cursor.tick != 0)
                        endTick = cursor.tick
                  else
                        endTick = curScore.lastSegment.tick + 1
                        endStaff = cursor.staffIdx
                  }
            else
                  endTick = curScore.lastSegment.tick + 1
                  
            for (var s = startStaff; s <= endStaff; s++)
                  for (var v = 0; v < 4; v++) {
                        cursor.staffIdx = s
                        cursor.voice = v
                        cursor.rewind(0)
                        
                        if (!cursor.element)
                              break
                        
                        while (cursor.tick < startTick)
                              cursor.next()
                        
                        do {
                              if (cursor.element.type == Element.CHORD)
                                   for (var i = 0; i < cursor.element.notes.length; i++) {
                                   switch(nomesistema) {
                                    case "default":
                                          cursor.element.notes[i].color = NoteNere[cursor.element.notes[i].pitch % 12]
                                          if (cursor.element.notes[i].accidental) {
                                                cursor.element.notes[i].accidental.color = NoteNere[cursor.element.notes[i].pitch % 12]
                                          }
                                                 break ;
                                    case "Newton":
                                          cursor.element.notes[i].color = Newton[cursor.element.notes[i].pitch % 12]
                                          if (cursor.element.notes[i].accidental) {
                                                cursor.element.notes[i].accidental.color = Newton[cursor.element.notes[i].pitch % 12]
                                          }
                                                 break ;
                                    case "Castel":
                                          cursor.element.notes[i].color = Castel[cursor.element.notes[i].pitch % 12]  
                                          if (cursor.element.notes[i].accidental) {
                                                cursor.element.notes[i].accidental.color = Castel[cursor.element.notes[i].pitch % 12]
                                          }
                                                 break ;
                                    case "Field":
                                          cursor.element.notes[i].color = Field[cursor.element.notes[i].pitch % 12]
                                          if (cursor.element.notes[i].accidental) {
                                                cursor.element.notes[i].accidental.color = Field[cursor.element.notes[i].pitch % 12]
                                          }
                                                 break ;
                                    case "Jameson":
                                          cursor.element.notes[i].color = Jameson[cursor.element.notes[i].pitch % 12]
                                          if (cursor.element.notes[i].accidental) {
                                                cursor.element.notes[i].accidental.color = Jameson[cursor.element.notes[i].pitch % 12]
                                          }
                                                 break ;
                                    case "Helmholtz":
                                          cursor.element.notes[i].color = Helmholtz[cursor.element.notes[i].pitch % 12] 
                                          if (cursor.element.notes[i].accidental) {
                                                cursor.element.notes[i].accidental.color = Helmholtz[cursor.element.notes[i].pitch % 12]
                                          } 
                                                 break ;
                                    case "Bishop":
                                          cursor.element.notes[i].color = Bishop[cursor.element.notes[i].pitch % 12]
                                          if (cursor.element.notes[i].accidental) {
                                                cursor.element.notes[i].accidental.color = Bishop[cursor.element.notes[i].pitch % 12]
                                          }  
                                                 break ;
                                    case "Seemann":
                                          cursor.element.notes[i].color = Seemann[cursor.element.notes[i].pitch % 12]
                                          if (cursor.element.notes[i].accidental) {
                                                cursor.element.notes[i].accidental.color = Seemann[cursor.element.notes[i].pitch % 12]
                                          }
                                                 break ;
                                    case "Rimington":
                                          cursor.element.notes[i].color = Rimington[cursor.element.notes[i].pitch % 12]
                                          if (cursor.element.notes[i].accidental) {
                                                cursor.element.notes[i].accidental.color = Rimington[cursor.element.notes[i].pitch % 12]
                                          } 
                                                 break ;
                                    case "Scriabin":
                                          cursor.element.notes[i].color = Scriabin[cursor.element.notes[i].pitch % 12]  
                                          if (cursor.element.notes[i].accidental) {
                                                cursor.element.notes[i].accidental.color = Scriabin[cursor.element.notes[i].pitch % 12]
                                          }
                                                 break ;
                                    case "Klein":
                                          cursor.element.notes[i].color = Klein[cursor.element.notes[i].pitch % 12]  
                                          if (cursor.element.notes[i].accidental) {
                                                cursor.element.notes[i].accidental.color = Klein[cursor.element.notes[i].pitch % 12]
                                          }
                                                 break ;
                                    case "Aeppli":
                                          cursor.element.notes[i].color = Aeppli[cursor.element.notes[i].pitch % 12]  
                                          if (cursor.element.notes[i].accidental) {
                                                cursor.element.notes[i].accidental.color = Aeppli[cursor.element.notes[i].pitch % 12]
                                          }
                                                 break ;
                                    case "Belmont":
                                          cursor.element.notes[i].color = Belmont[cursor.element.notes[i].pitch % 12]  
                                          if (cursor.element.notes[i].accidental) {
                                                cursor.element.notes[i].accidental.color = Belmont[cursor.element.notes[i].pitch % 12]
                                          }
                                                 break ;
                                    case "Zieverink":
                                          cursor.element.notes[i].color = Zieverink[cursor.element.notes[i].pitch % 12] 
                                          if (cursor.element.notes[i].accidental) {
                                                cursor.element.notes[i].accidental.color = Zieverink[cursor.element.notes[i].pitch % 12]
                                          } 
                                                 break ;                                                                                                                     
                                                 }                            
                                        }
                            }
                        while (cursor.next() && cursor.tick < endTick)
                        }
            }
                            
      RadioButton {
            id: newton
            text: "Newton"
            anchors.left: mainWindow.left        	
            anchors.top: mainWindow.top        	
            anchors.leftMargin: 10        	
            anchors.topMargin: 10
            onClicked: {
                  coloranote("Newton")
                  }
            }
        
      RadioButton {
            id: castel
            text: "Castel"
            anchors.left: newton.left        	
            anchors.top: newton.bottom
            onClicked: {
                  coloranote("Castel")
                  }
            }
                  
      RadioButton {
            id: field
            text: "Field"
            anchors.left: castel.left        	
            anchors.top: castel.bottom
            onClicked: {
                  coloranote("Field")
                  }
            }
            
      RadioButton {
            id: jameson
            text: "Jameson"
            anchors.left: field.left        	
            anchors.top: field.bottom
            onClicked: {
                  coloranote("Jameson")
                  }
            }
      
      RadioButton {
            id: helmholtz
            text: "Helmholtz"
            anchors.left: jameson.left        	
            anchors.top: jameson.bottom
            onClicked: {
                  coloranote("Helmholtz")
                  }
            }
            
      RadioButton {
            id: bishop
            text: "Bishop"
            anchors.left: helmholtz.left        	
            anchors.top: helmholtz.bottom
            onClicked: {
                  coloranote("Bishop")
                  }
            }
      
      RadioButton {
            id: seemann
            text: "Seemann"
            anchors.left: bishop.left        	
            anchors.top: bishop.bottom
            onClicked: {
                  coloranote("Seemann")
                  }
            }
       
      RadioButton {
            id: rimington
            text: "Rimington"
            anchors.left: seemann.left        	
            anchors.top: seemann.bottom
            onClicked: {
                  coloranote("Rimington")
                  }
            }
      
      RadioButton {
            id: scriabin
            text: "Scriabin"
            anchors.left: rimington.left        	
            anchors.top: rimington.bottom
            onClicked: {
                  coloranote("Scriabin")
                  }
            }
      
      RadioButton {
            id: klein
            text: "Klein"
            anchors.left: scriabin.left        	
            anchors.top: scriabin.bottom
            onClicked: {
                  coloranote("Klein")
                  }
            }
      
      RadioButton {
            id: aeppli
            text: "Aeppli"
            anchors.left: klein.left        	
            anchors.top: klein.bottom
            onClicked: {
                  coloranote("Aeppli")
                  }
            }
            
       RadioButton {
            id: belmont
            text: "Belmont"
            anchors.left: aeppli.left        	
            anchors.top: aeppli.bottom
            onClicked: {
                  coloranote("Belmont")
                  }
            }
      
      RadioButton {
            id: zieverink
            text: "Zieverink"
            anchors.left: belmont.left        	
            anchors.top: belmont.bottom
            onClicked: {
                  coloranote("Zieverink")
                  }
            }
                          
      Button {
            id: buttonRestore
            text: "Reset"

            anchors.left: zieverink.left        	
            anchors.top: zieverink.bottom 
            anchors.topMargin: 10
                        
            onClicked: {
                 coloranote("default")
	          } 
            }      
                
      Button {
            id: exit
            text: "Exit"
            
            anchors.right: mainWindow.right        	
            anchors.bottom: mainWindow.bottom 
            anchors.bottomMargin: 50
            anchors.rightMargin: 10
                        
            onClicked: {
                 Qt.quit()
	          } 
            }  
                 
      Label {
            id: labelResult	
            anchors.left: buttonRestore.left        	
            anchors.top: buttonRestore.bottom       	
            anchors.topMargin: 10
            }

      onRun: {
            coloranote("default")
            }
      }
