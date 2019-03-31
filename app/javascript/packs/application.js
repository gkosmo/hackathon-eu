import "bootstrap";
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("./../controllers", true, /\.js$/)
application.load(definitionsFromContext(context))



let dashboard = document.querySelector('.dashboard-container')
if(dashboard){ 

    const program_tab = document.querySelector('#tab-created')
    const visual_tab = document.querySelector('#tab-commented')
    const poetry_tab = document.querySelector('#tab-following')
    const program_div = document.querySelector('.created')
    const visual_div = document.querySelector('.commented')
    const poetry_div = document.querySelector('.followed')
    const array_tabs = [ program_tab, visual_tab, poetry_tab ]
    const array_divs = [ program_div, visual_div, poetry_div]
    function cleanAll(){
    array_tabs.forEach((tab) => {
        tab.classList.remove('underlines')
    
    })
    array_divs.forEach((div) => {
        div.classList.add('hidden')
    })
    }
    program_tab.addEventListener('click', function(e){
        e.preventDefault();
        cleanAll();
         program_div.classList.remove('hidden')
         e.currentTarget.classList.add('underlines')

    })
    visual_tab.addEventListener('click', function(e){
        e.preventDefault();
        cleanAll();
        visual_div.classList.remove('hidden')
        e.currentTarget.classList.add('underlines')
    })
    poetry_tab.addEventListener('click', function(e){
        e.preventDefault();
        cleanAll();
        poetry_div.classList.remove('hidden')
        e.currentTarget.classList.add('underlines')
    
    })
    

}