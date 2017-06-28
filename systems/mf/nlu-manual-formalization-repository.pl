k:- discontiguous sentence/3, hasFormalization/3.

%% load_all_nlu_mf_texts.

%% load_all_nlu_mf_texts :-
%% 	write('LOADING nlu-manual-formalization texts.'),nl,
%% 	sorted_directory_files_no_hidden('/var/lib/myfrdcsa/codebases/minor/nlu/data-git/formalized-texts/texts',Directories),
%% 	member(Dir,Directories),
%% 	load_nlu_mf_text_from_dir(Dir),
%% 	fail.
%% load_all_nlu_mf_texts.

%% load_nlu_mf_text_from_dir(Dir) :-
%% 	write(Dir),nl,
%% 	atomic_list_concat(['/var/lib/myfrdcsa/codebases/minor/nlu/data-git/formalized-texts/texts','/',Dir,'/formalizations/prolog'],PrologFormalizationsDir),
%% 	load_all_formalized_text_files_in_directory(PrologFormalizationsDir).

%% load_all_formalized_text_files_in_directory(Dir) :-
%% 	load_all_files_having_extension_in_directory(Dir,'.nlu.pl').

%% search_sentences_of_text(Text,Search,Sentences) :-
%% 	findall(Sentence,(sentence(Text,_,Sentence),hasSubatom(Sentence,Search)),Sentences).

%% %% findall(Sentence,sentence(Text,_,Sentence),Sentences).

%% list_all_formalizations_of_text(Text,AllFormalizations) :-
%% 	findall(Formalizations,(hasFormalization(Text,SentenceID,Formalizations),not(length(Formalizations,1))),AllFormalizations).

%% load_all_nlu_mf_texts :-
%% 	write('LOADING nlu-manual-formalization texts.'),nl,
%% 	sorted_directory_files_no_hidden('/var/lib/myfrdcsa/codebases/minor/nlu/data-git/formalized-texts/texts',Directories),
%% 	member(Dir,Directories),
%% 	load_nlu_mf_text_from_dir(Dir),
%% 	fail.
%% load_all_nlu_mf_texts.

%% load_nlu_mf_text_from_dir(Dir) :-
%% 	write(Dir),nl,
%% 	atomic_list_concat(['/var/lib/myfrdcsa/codebases/minor/nlu/data-git/formalized-texts/texts','/',Dir,'/formalizations/prolog'],PrologFormalizationsDir),
%% 	load_all_formalized_text_files_in_directory(PrologFormalizationsDir).

%% load_all_formalized_text_files_in_directory(Dir) :-
%% 	load_all_files_having_extension_in_directory(Dir,'.nlu.pl').

%% search_sentences_of_text(Text,Search,Sentences) :-
%% 	findall(Sentence,(sentence(Text,_,Sentence),hasSubatom(Sentence,Search)),Sentences).

%% %% findall(Sentence,sentence(Text,_,Sentence),Sentences).

%% list_all_formalizations_of_text(Text,AllFormalizations) :-
%% 	findall(Formalizations,(hasFormalization(Text,SentenceID,Formalizations),not(length(Formalizations,1))),AllFormalizations).

%% findall(Formalization,(hasFormalization(Text,SentenceID,Formalizations),forall(member(Formalization,Formalizations),nonvar(Formalization)),member(Formalization,Formalizations)),AllFormalizations),write_list(AllFormalizations).

%% ITEM1: findall(Formalization,(hasFormalization(Text,SentenceID,Formalizations),forall(member(Formalization,Formalizations),nonvar(Formalization)),member(Formalization,Formalizations)),AllFormalizations),write_list(AllFormalizations).

formalizeThisWithNLUMF('/var/lib/myfrdcsa/codebases/minor/poverty-survival-system/data-git').