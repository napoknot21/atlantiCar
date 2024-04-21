import React, { useState } from 'react';
import { Platform, UIManager, Pressable, View, Text, Button, LayoutAnimation, StyleSheet, Alert, Image } from 'react-native';
import url from "./url.js"
import { useNavigationBuilder } from '@react-navigation/native';


if (Platform.OS === 'android' && UIManager.setLayoutAnimationEnabledExperimental) {
  UIManager.setLayoutAnimationEnabledExperimental(true);
}
export default ApplicationItem = props => {
  return (
    <View style = {styles.mainContainer}>
        <View style = {{...styles.titleContainer}}>
          <View style = {{flexDirection : "row", justifyContent : "space-between"}}>
            <Text style = {styles.defaultText}>Par {props.content.author}</Text>
            <Text style = {styles.defaultText}>{props.content.price} €</Text>
          </View>
          <View style = {{flexDirection : "row", flex : 1}}>
            <View style = {{flexDirection : "column"}}>
              <View style = {{alignSelf : "center", borderWidth: 4, borderColor: 'black', borderRadius : 10, width : 20, height : 20}}/>
              <View style = {{alignSelf : "center", height: '80%',width :0,  borderWidth: 3, borderColor: 'black', borderStyle: 'dashed'}}/>
              <View style = {{alignSelf : "center", borderWidth: 4, borderColor: 'black', borderRadius : 10, width : 20, height : 20}}/>
            </View>
            <View style = {{flexDirection : "column", flex : 1}}>
                <Text style = {styles.destinations}>De {props.content.departure}</Text>
              <View>
                <View>
                  <Text style = {styles.defaultText}>Le {props.content.date.substring(8,10)}/{props.content.date.substring(5,7)}/{props.content.date.substring(2,4)} à {props.content.date.substring(11,13)}h{props.content.date.substring(14,16)}</Text>
                </View>
                <View style = {styles.revealContainer}>  
                  <View>
                    <Text style = {{...styles.defaultText, fontWeight : 'bold'}}>État de votre candidature : </Text>
                      <View style = {{flexDirection : "row", justifyContent : "space-between"}}>                
                        {props.content.state == "True" ? <Text style = {styles.defaultText}>Accepté !</Text> : 
                        <Text style = {styles.defaultText}>En attente ...</Text>
                        }
                      </View>      
                  </View>
                </View>
              </View>
              <View style = {{flexDirection : "row"}}>
                <Text style = {styles.destinations}>A {props.content.arrival}</Text>
              </View>
            </View>
          </View>
        </View>
    </View>
  )
};
const styles = StyleSheet.create({
  destinations : {
    fontSize :  20,
    padding : 5,
    color : "#000",
    fontWeight : "bold",
  },
  defaultText : {
    fontSize :  14,
    padding : 5,
    color : "#000",
  },
  mainContainer : {
    color : "#111111",
    borderRadius : 10,
    margin : 10,
    shadowColor: "#000",
    elevation: 5,
  },
  titleContainer : {
    backgroundColor : "#efefef",
    borderRadius : 10,
    padding : 10,
    fontSize : 20
  },
  revealContainer : {
    padding : 10,
  },
  button : {
    flexDirection : "row",
    alignSelf : "center"
  },
  buttonText : {
    color : "#000",
    fontSize : 18,
    fontWeight : 'bold'
  },
  buttonContainer : { 
    margin : 10,
    borderRadius: 10,
    padding: 7,
    backgroundColor: "#99cc33",
    shadowColor: "#000",
    elevation: 5,
    alignSelf : "center",
  }
})