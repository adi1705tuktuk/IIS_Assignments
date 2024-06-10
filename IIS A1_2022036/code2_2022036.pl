:-dynamic(list/2).
playlist(Name, Songs) :-
    list(Name,_),
    write("Playlist already exists"),fail;
    asserta(list(Name,Songs)).

add_song(Name, Title, Artist, UpdatedPlaylist) :-
    list(Name,Songs),
    (   Songs = []
    ->  UpdatedPlaylist = [New_song(Artist,Title)]
    ;   append(Songs, [New_song(Artist,Title)], UpdatedPlaylist)
    ),
    retract(list(Name,_)),
    asserta(list(Name,UpdatedPlaylist)).

display_playlist(Name):-
    list(Name,X),
    write(Name),p,displaying(X).

displaying([]):-!.
displaying([New_song(Artists,Title)|Y]):-
    write(Artists),p,write(Title),p,
    displaying(Y).