# 1. Windows & GameLoops

## Er wordt op het ogenblik nog aan dit vak gewerkt!
De inhoud van dit vak wordt nog aangevuld en is dus niet compleet.  
Meehelpen kan, ga naar [Meewerken](/meewerken) voor meer informatie.

## 1.0 Voorwoord
**<i class="fas fa-exclamation-triangle"></i> BELANGRIJK**
Vanaf nu wordt er verondersteld dat je SDL en alle submodules van SDL (image, mixer & ttf) hebt geïnstalleerd.

Om ook geen grote kant en klare code te delen werken we in de volgende tutorials **NIET** met het abstract factories, dit is iets dat je zelf zal moeten uitzoeken en leren implementeren.

## 1.1 Creeër een window
### Creeëren van een window klasse
Als we onze gewone c++ code laten runnen hebben we al vaak opgemerkt dar er geen window voor ons gecreerd wordt, maar dat alles wordt geoutput naar de console/terminal. Om een game te schrijven hebben we natuurlijk een window nodig waarop we objecten kunnen laten bewegen.

We beginnen door een nieuwe klasse Window te maken met volgende structuur:

```cpp
// Window.h

#include <SDL2/SDL.h>
#include <SDL2/SDL_render.h>
#include <SDL2/SDL_image.h>
#include <SDL2/SDL_ttf.h>
#include <SDL2/SDL_mixer.h>

class Window
{
public:
    Window();
    ~Window();

    void run();
    
private:
    bool initSdl();
    void loadMedia();

    SDL_Window* win;
    SDL_Surface* winSurface;
    SDL_Surface* imgSurface;
};
```

We zullen beginnen met de constructor te maken die SDL gaat initialiseren en vervolgens een afbeelding laat in memory. Je zal opmerken dat we een if statement hebben geplaatst rond de `initSdl`. Dit doen we omdat als het intialiseren van SDL fout gelopen is we de game niet gaan kunnen starten en dus best geen afbeeldingen laden.

```cpp
//Window.cpp

Window::Window()
{
    // Initialiseer sdl
    if(this->initSdl())
    {
        // Laad een afbeelding
        this->loadMedia();
    }
}
```

Om SDL te initialiseren en een window te creeëren gebruiken we volgend tuk code:
```cpp
bool Window::initSdl()
{
    // De SDL_INIT_AUDIO tag is enkel nodig als je SDL_Mixer gebruikt
    if( SDL_Init( SDL_INIT_VIDEO | SDL_INIT_AUDIO ) < 0)
    {
        // SDL is gefaald met initialiseren we returnen false
        // Als je de error van sdl wilt weten kan je `SDL_GetError()`
        // Loggen naar de console
        return false;
    }

    // Init de SDL_image library
    if(!(IMG_Init(IMG_INIT_PNG) & IMG_INIT_PNG))
    {
        return false;
    }

    // Init de SDL_ttf library
    if(TTF_Init() == -1)
    {
        return false;
    }

    // Init de SDL_mixer library
    if(Mix_OpenAudio( 44100, MIX_DEFAULT_FORMAT, 2, 2048 ) < 0 )
    {
        // om de error message hier te krijgen gebruik
        // je `Mix_GetError()`
        return false;
    }

    // Creëer een SDL Window met de titel: 'SDL Window'
    //      Op een onbepaalde plaats
    //      met een resolutie van 1280x720
    this->window = SDL_CreateWindow("SDL Window", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 
        1280, 720, SDL_WINDOW_SHOWN);
    
    // Als de window niet bestaat is de init ook niet geslaagd
    if(this->window == nullptr)
    {
        return false;
    }

    this->winSurface = SDL_GetWindowSurface(this->window);

    return true;
}
```


## Download de code
