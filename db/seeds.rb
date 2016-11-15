# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
banner1 = Banner.create(name: "Banner 1", 
            title: "IMPULSO E INNOVACIÓN PARA SU MARCA", 
            subtitle: "Ocho años conectando productos de calidad con el consumidor final",
            button: "Exhibición", 
            image: "Some Image")

banner2 = Banner.create(name: "Banner 2", 
            title: "EXPANDIMOS NUESTROS HORIZONTES", 
            subtitle: "Diseño, producción y montaje de escenografía para Comedy Central Stand-Up Colombia",
            button: "Ambientación", 
            image: "Some Image")

banner3 = Banner.create(name: "Banner 3", 
            title: "TRADICIÓN", 
            subtitle: "Más de 27 años construyendo país",
            button: "Nuestra Historia", 
            image: "Some Image")

clients = Banner.create(name: "Clientes", 
            title: "Clientes Macromet", 
            subtitle: "Logos de los clientes de Macromet",
            button: "Clientes", 
            image: "Some Image")

