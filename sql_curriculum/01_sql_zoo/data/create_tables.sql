--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

CREATE TABLE actors (
    id integer NOT NULL,
    name character varying
);

CREATE TABLE albums (
    asin character(10) NOT NULL,
    title character varying(50),
    artist character varying(50),
    price decimal(10,2),
    rdate date,
    label character varying(50),
    rank integer
);

CREATE TABLE castings (
    movie_id integer NOT NULL,
    actor_id integer NOT NULL,
    ord integer
);

CREATE TABLE countries (
    name character varying NOT NULL,
    continent character varying,
    area integer,
    population bigint,
    gdp bigint
);

CREATE TABLE depts (
    id integer NOT NULL,
    name character varying NOT NULL
);

CREATE TABLE movies (
    id integer NOT NULL,
    title character varying,
    yr integer,
    score double precision,
    votes integer,
    director_id integer
);

CREATE TABLE nobels (
    yr integer,
    subject character varying,
    winner character varying
);

CREATE TABLE routes (
    num character varying NOT NULL,
    company character varying NOT NULL,
    pos integer NOT NULL,
    stop_id integer
);

CREATE TABLE stops (
    id integer NOT NULL,
    name character varying
);

CREATE TABLE styles (
    album character(10) NOT NULL,
    style character varying(100) NOT NULL
);

CREATE TABLE teachers (
    id integer NOT NULL,
    dept_id integer,
    name character varying,
    phone integer,
    mobile character varying
);

CREATE TABLE tracks (
    album character(10) NOT NULL,
    disk integer NOT NULL,
    posn integer NOT NULL,
    song character varying(255)
);

COPY actors (id, name) FROM stdin;
1	Woody Allen
2	Clint Eastwood
3	Robert De Niro
4	Sean Connery
5	Sylvester Stallone
6	Harrison Ford
7	Robin Williams
8	Tom Hanks
9	Arnold Schwarzenegger
10	Kevin Costner
11	Alfred Hitchcock
12	Al Pacino
13	Bruce Willis
14	Steve Martin
15	Dan Aykroyd
16	Gene Hackman
17	Nicolas Cage
18	Steven Spielberg
19	Tom Cruise
20	Michael Douglas
21	Ron Howard
22	Mel Gibson
23	John Carpenter
24	Danny DeVito
25	Tim Robbins
26	Johnny Depp
27	Dustin Hoffman
28	Francis Ford Coppola
29	Mel Brooks
30	Kurt Russell
31	Brian De Palma
32	John Cusack
33	Eddie Murphy
34	John Travolta
35	Jeff Bridges
36	Robert Redford
37	Rob Reiner
38	Barry Levinson
39	Anthony Hopkins
40	Julia Roberts
41	Denzel Washington
42	Paul Newman
43	Jack Nicholson
44	Robert Duvall
45	Michelle Pfeiffer
46	Kevin Bacon
47	Mike Nichols
48	Kenneth Branagh
49	Wesley Snipes
50	Matthew Broderick
51	Dennis Quaid
52	Michael Keaton
53	Keanu Reeves
54	Sigourney Weaver
55	Chevy Chase
56	Val Kilmer
57	Meg Ryan
58	Charlie Sheen
59	Terry Gilliam
60	Warren Beatty
61	Kevin Kline
62	John Landis
63	Meryl Streep
64	Demi Moore
65	Blake Edwards
66	John Badham
67	Robert Zemeckis
68	Alan Parker
69	Oliver Stone
70	Michael J. Fox
71	Robert Downey Jr.
72	Bill Murray
73	Harvey Keitel
74	Richard Gere
75	Cary Grant
76	Kevin Spacey
77	Richard Dreyfuss
78	Martin Scorsese
79	Billy Wilder
80	Sidney Lumet
81	Norman Jewison
82	Stanley Kubrick
83	Michael Caine
84	Sandra Bullock
85	Marlon Brando
86	Peter Weir
87	Lawrence Kasdan
88	Christian Slater
89	Samuel L. Jackson
90	Roman Polanski
91	Morgan Freeman
92	Sydney Pollack
93	Sean Penn
94	Diane Keaton
95	Hugh Grant
96	William Hurt
97	David Cronenberg
98	Gary Oldman
99	Christopher Walken
100	Liam Neeson
101	Nick Nolte
102	Bill Pullman
103	Peter Hyams
104	Glenn Close
105	Joel Schumacher
106	Jack Lemmon
107	Tony Scott
108	Harold Ramis
109	Ivan Reitman
110	Ridley Scott
111	Joel Coen
112	Susan Sarandon
113	James Woods
114	Alec Baldwin
115	Peter Sellers
116	Winona Ryder
117	Jackie Chan
118	James Stewart
119	Tommy Lee Jones
120	Steve Guttenberg
121	Leslie Nielsen
122	Brendan Fraser
123	Frank Oz
124	Drew Barrymore
125	Dennis Hopper
126	Jim Carrey
127	Jack Warden
128	William Shatner
129	Garry Marshall
130	Bill Paxton
131	Emilio Estevez
132	Walter Matthau
133	Wes Craven
134	Christopher Lloyd
135	Donald Sutherland
136	Sharon Stone
137	Jean-Claude Van Damme
138	George Clooney
139	David Lynch
140	Wolfgang Petersen
141	Sam Raimi
142	Jamie Lee Curtis
143	Walter Hill
144	John Hughes
145	Charles Chaplin
146	Roger Donaldson
147	Rick Moranis
148	Tim Burton
149	Stephen Herek
150	Joe Dante
151	Ethan Hawke
152	Joan Cusack
153	Neil Jordan
154	Jeff Daniels
155	Robert Altman
156	Chris Columbus
157	Forest Whitaker
158	Billy Crystal
159	Ben Affleck
160	Max von Sydow
161	Jon Voight
162	Willem Dafoe
163	John Turturro
164	Gregory Peck
165	Charlton Heston
166	Whoopi Goldberg
167	Donald Pleasence
168	Daniel Day-Lewis
169	Nicole Kidman
170	John Wayne
171	Steven Seagal
172	Geena Davis
173	Kathleen Turner
174	Ed Harris
175	Jim Jarmusch
176	Fred Ward
177	Ralph Fiennes
178	Roy Scheider
179	John Goodman
180	John Candy
181	Matt Damon
182	Faye Dunaway
183	William Holden
184	Bridget Fonda
185	Leonardo DiCaprio
186	Steve Buscemi
187	Christina Ricci
188	Adam Sandler
189	Jim Abrahams
190	Jeff Goldblum
191	Mia Farrow
192	Sam Neill
193	Leonard Nimoy
194	Julianne Moore
195	John Cleese
196	John McTiernan
197	Howard Hawks
198	James Cameron
199	Michael Apted
200	Herbert Ross
201	Paul Verhoeven
202	Oliver Platt
203	Melanie Griffith
204	John Woo
205	Richard Linklater
206	Spike Lee
207	Barbra Streisand
208	Akira Kurosawa
209	Richard Donner
210	Renny Harlin
211	Gwyneth Paltrow
212	Phillip Noyce
213	Humphrey Bogart
214	Andy Garcia
215	Jodie Foster
216	Chris O'Donnell
217	J.T. Walsh
218	Woody Harrelson
219	Pierce Brosnan
220	Hank Azaria
221	Carl Reiner
222	Cary Elwes
223	Matt Dillon
224	Kiefer Sutherland
225	Anne Bancroft
226	William H. Macy
227	John Mahoney
228	Andie MacDowell
229	Ewan McGregor
230	John Heard
231	Burt Reynolds
232	Patrick Swayze
233	Goldie Hawn
234	Danny Glover
235	Richard Attenborough
236	Roger Moore
237	Mike Myers
238	Ned Beatty
239	Ian Holm
240	Matthew McConaughey
241	Mark Wahlberg
242	Ben Stiller
243	Uma Thurman
244	Michael Madsen
245	Christian Bale
246	Dan Hedaya
247	Albert Brooks
248	Bob Hoskins
249	Annette Bening
250	James Caan
251	Jennifer Lopez
252	Lance Henriksen
253	Orson Welles
254	Barbara Hershey
255	Gary Sinise
256	James Spader
257	Sean Astin
258	Brad Pitt
259	Joe Pesci
260	Antonio Banderas
261	John Leguizamo
262	Jonathan Lynn
263	Christopher McDonald
264	William Friedkin
265	Bette Midler
266	Clyde Geronimi
267	Gene Wilder
268	Sergio Leone
269	Wim Wenders
270	Trey Parker
271	Gus Van Sant
272	Fred Schepisi
273	Ang Lee
274	Richard Lester
275	Alan J. Pakula
276	George Roy Hill
277	Kirsten Dunst
278	Elisabeth Shue
279	Steve McQueen
280	Holly Hunter
281	Jonathan Demme
282	Cameron Diaz
283	Adrian Lyne
284	Macaulay Culkin
285	Howard Deutch
286	Robert Wise
287	John Ford
288	Philip Kaufman
289	Christopher Lambert
290	Roland Emmerich
291	Andrew Davis
292	Stephen Frears
293	John Boorman
294	Patrick Stewart
295	Harry Dean Stanton
296	Robert Loggia
297	Kim Basinger
298	Billy Bob Thornton
299	Christopher Reeve
300	Danny Aiello
301	Peter Boyle
302	Benicio Del Toro
303	Lea Thompson
304	Malcolm McDowell
305	Robert Prosky
306	Martin Sheen
307	Bonnie Hunt
308	Gabriel Byrne
309	Randy Quaid
310	Madonna
311	Daniel Stern
312	John Huston
313	Will Patton
314	John Lithgow
315	Mira Sorvino
316	Joan Allen
317	Stockard Channing
318	Tom Sizemore
319	Mickey Rourke
320	Richard Benjamin
321	Kathy Bates
322	Audrey Hepburn
323	Freddie Prinze Jr.
324	Russell Crowe
325	Rene Russo
326	Peter Jackson
327	Peter Weller
328	Neve Campbell
329	Ben Kingsley
330	Dennis Dugan
331	Laurence Fishburne
332	Griffin Dunne
333	Minnie Driver
334	Joe Mantegna
335	David Arquette
336	J&#252;rgen Prochnow
337	Maggie Smith
338	Treat Williams
339	James Remar
340	Shirley MacLaine
341	Michael McKean
342	Claire Danes
343	Anjelica Huston
344	Richard Crenna
345	Henry Fonda
346	Don Siegel
347	Robert Carlyle
348	Giovanni Ribisi
349	Ellen Barkin
350	Jennifer Jason Leigh
351	Ian McKellen
352	Christopher Guest
353	Juliette Lewis
354	Charles Durning
355	Ving Rhames
356	Tom Skerritt
357	Bruno Kirby
358	Janeane Garofalo
359	Emma Thompson
360	George Lucas
361	Penny Marshall
362	Wilford Brimley
363	Denis Leary
364	John Waters
365	Steve Miner
366	G&#233;rard Depardieu
367	Diane Lane
368	Rosanna Arquette
369	Sally Field
370	Laurence Olivier
371	Michael Lehmann (I)
372	Rob Lowe
373	Lloyd Bridges
374	Michael Caton-Jones
375	Andrew Bergman
376	Rob Cohen
377	Hugh Wilson
378	Kevin Reynolds
379	George A. Romero
380	Aidan Quinn
381	Ice Cube
382	Edward Zwick
383	Randal Kleiser
384	Peter Segal
385	Burgess Meredith
386	Peter Greenaway
387	Lasse Hallstr&#246;m
388	Terence Young
389	Luc Besson
390	Lewis Gilbert (II)
391	Cameron Crowe
392	Frank Capra
393	Yun-Fat Chow
394	Pedro Almod&#243;var
395	Brian Levant
396	John Singleton
397	Charles Shyer
398	Krzysztof Kieslowski
399	Federico Fellini
400	Bubba Smith
401	Michael Hoffman
402	Richard Fleischer
403	Amy Heckerling
404	Kirk Douglas
405	Franklin J. Schaffner
406	Patricia Arquette
407	Roger Spottiswoode
408	Milos Forman
409	Don Bluth
410	Joseph Ruben
411	Jon Turteltaub
412	Jeremiah S. Chechik
413	Tom Wilkinson (I)
414	David Fincher
415	Ron Underwood
416	Michael Rooker
417	David Morse
418	Michael Ritchie (I)
419	Spencer Tracy
420	Ingmar Bergman
421	Jan de Bont
422	Barry Sonnenfeld
423	James Foley
424	Joe Johnston
425	Betty Thomas (I)
426	Anne Heche
427	Edward Norton
428	Stanley Donen
429	Katharine Hepburn
430	Tom Berenger
431	James Cromwell
432	Viggo Mortensen
433	James Rebhorn
434	John C. McGinley
435	Hal Holbrook
436	Carol Kane
437	M. Emmet Walsh
438	John Hurt
439	Jeffrey Jones
440	Geoffrey Rush
441	Chazz Palminteri
442	Joaquin Phoenix
443	Philip Seymour Hoffman
444	Quentin Tarantino
445	Kevin Smith
446	Sarah Jessica Parker
447	Chris Farley
448	Jon Favreau
449	Vincent D'Onofrio
450	Burt Young
451	Tch&#233;ky Karyo
452	Helen Mirren
453	Martin Balsam
454	Rupert Everett
455	Michael Wincott
456	Loren Dean
457	Tim Curry
458	Kevin Dunn (I)
459	John C. Reilly
460	Giancarlo Esposito
461	Kelly Preston
462	Carrie Fisher
463	Sissy Spacek
464	David Graf
465	Martin Lawrence
466	Alan Arkin
467	Madeline Kahn
468	Tom Everett Scott
469	Will Smith
470	Charles Grodin
471	Maury Chaykin
472	James Coburn
473	Brian Dennehy
474	Natalie Wood
475	River Phoenix
476	George Kennedy
477	Cheech Marin
478	Matthew Lillard
479	George C. Scott
480	Jennifer Aniston
481	Oliver Reed
482	R. Lee Ermey
483	Vince Vaughn
484	Delroy Lindo
485	Edward Burns (I)
486	David Duchovny
487	Angelina Jolie
488	Virginia Madsen
489	Don Taylor (I)
490	Joan Plowright
491	Alicia Silverstone
492	Ryan Phillippe
493	Michael Biehn
494	Cloris Leachman
495	Frances McDormand
496	Catherine Deneuve
497	Jane Fonda
498	Ronny Cox
499	Jessica Lange
500	Jonathan Frakes
501	Penelope Ann Miller
502	Talia Shire
503	John Malkovich
504	Dianne Wiest
505	Fran&#231;ois Truffaut
506	David Paymer
507	Bob Gunton
508	John Gielgud
509	Simon Callow
510	Michael Winslow
511	Steve Zahn
512	Matthew Modine
513	Vanessa Redgrave
514	Tobey Maguire
515	Brion James
516	Xander Berkeley
517	Craig T. Nelson
518	Martin Landau
519	Christopher Plummer
520	Stephen Tobolowsky
521	Raymond J. Barry
522	Annabella Sciorra
523	Jay Mohr
524	Salma Hayek
525	Jonathan Pryce
526	David Chappelle
527	Denholm Elliott
528	Kevin Pollak
529	Mary Steenburgen
530	Hector Elizondo
531	Catherine O'Hara
532	James Doohan
533	Marisa Tomei
534	Lauren Bacall
535	Lauren Holly
536	Robin Wright
537	Bill Duke
538	Nigel Hawthorne
539	Elizabeth Taylor
540	Mako
541	Lindsay Crouse
542	Burt Lancaster
543	David Thewlis
544	Bruce Campbell (I)
545	Robert Englund
546	James Earl Jones
547	Josh Mostel
548	Lili Taylor
549	Gina Gershon
550	Ben Gazzara
551	Dom DeLuise
552	Mark Hamill
553	Isabella Rossellini
554	Hume Cronyn
555	Teri Garr
556	Rod Taylor
557	Emily Watson
558	Shelley Duvall
559	Brian Blessed
560	Philip Baker Hall
561	Jessica Tandy
562	Tom Holland (I)
563	Gary Busey
564	William Hickey (I)
565	Sam Shepard
566	Richard E. Grant
567	Olympia Dukakis
568	Alfre Woodard
569	Ryan O'Neal
570	David Warner
571	Nicholas Meyer
572	Nick Park
573	David Zucker
574	James L. Brooks
575	Jane Campion
576	James Ivory
577	Russell Mulcahy
578	Toni Collette
579	Bob Clark (III)
580	Jonathan Kaplan (I)
581	Jim Sheridan
582	Mike Judge
583	Mike Leigh
584	Bille August
585	Mike Newell
586	Tom Shadyac
587	Mike Starr (I)
588	Shelley Long
589	Mimi Leder
590	Cuba Gooding Jr.
591	Daryl Hannah
592	Jennifer Love Hewitt
593	Neil LaBute
594	Beverly D'Angelo
595	Martin Brest
596	Josh Brolin
597	Danny Boyle
598	Bernardo Bertolucci
599	Donald Petrie
600	Jeannot Szwarc
601	DeForest Kelley
602	Sarah Michelle Gellar
603	Jean Reno
604	Jay Roach
605	Judy Davis
606	David Mamet
607	Curtis Hanson
608	Peter O'Toole
609	Kristin Scott Thomas
610	Richard Pryor
611	Kyle MacLachlan
612	Peter Bogdanovich
613	William Baldwin
614	Frank Marshall (I)
615	Lars von Trier
616	Harold Becker
617	Fred Zinnemann
618	Hal Needham
619	Louis Malle
620	William Wyler
621	Anthony Minghella
622	Lou Diamond Phillips
623	Paul Reubens
624	Lee Tamahori
625	Peter Sallis
626	Gene Kelly
627	Geoff Murphy
628	George Cukor
629	George Dzundza
630	Gregory Hoblit
631	George P. Cosmatos
632	Les Mayfield
633	Raja Gosnell
634	Graham Chapman
635	Glenne Headly
636	Guy Hamilton (I)
637	Illeana Douglas
638	Rub&#233;n Blades
639	Bryan Singer
640	Kate Winslet
641	Kathryn Bigelow
642	Ron Shelton
643	Veronica Cartwright
644	Keith Gordon
645	Timothy Hutton
646	Anthony Michael Hall
647	Kate Nelligan
648	Roddy McDowall
649	Marcello Mastroianni
650	Ally Sheedy
651	Irvin Kershner
652	Paul Schrader
653	Paul Anderson (III)
654	Andy Tennant
655	Elia Kazan
656	Elias Koteas
657	Andrew Fleming
658	Andrei Tarkovsky
659	Ellen Burstyn
660	Robert Benton
661	Howard Zieff
662	Emile Ardolino
663	Emir Kusturica
664	Wayne Wang
665	Atom Egoyan
666	Robert Rodriguez
667	Stanley Tong
668	John Glen (II)
669	Jon Amiel
670	Cher
671	Tim Matheson
672	Stephen Hopkins
673	Stanley Kramer
674	Taylor Hackford
675	Michael Curtiz
676	John Frankenheimer
677	John Schlesinger
678	Michael Bay
679	Carl Weathers
680	Chris Sarandon
681	Bruce Greenwood (I)
682	Melinda Dillon
683	John G. Avildsen
684	Tim Allen
685	Bruce Beresford
686	Terrence Malick
687	John Ritter
688	Takashi Shimura
689	Steven Soderbergh
690	Charles Dutton
691	Jon Avnet
692	Joe Don Baker
693	John Milius
694	Terry Jones
695	Parker Posey
696	Bob Balaban
697	Michael Rapaport
698	Keith David (I)
699	Heather Graham
700	Kristy Swanson
701	James Gandolfini
702	Eric Stoltz
703	Joe Pantoliano
704	Brad Dourif
705	Pam Grier
706	Marcia Gay Harden
707	Kevin J. O'Connor
708	Reese Witherspoon
709	Dabney Coleman
710	Chris Penn
711	Murray Hamilton
712	Jeffrey Tambor
713	Brian Cox
714	Ron Perlman
715	Julie Hagerty
716	Helena Bonham Carter
717	Luke Wilson
718	Frank Whaley
719	Warren Oates
720	Paul Mazursky
721	Tommy Chong
722	Ernest Borgnine
723	Gena Rowlands
724	Famke Janssen
725	Eileen Brennan
726	Kate Capshaw
727	Mario Van Peebles
728	Chris Cooper (I)
729	William Forsythe
730	Hart Bochner
731	William Daniels (I)
732	Jack Palance
733	Albert Finney
734	Julie Christie
735	Toshir&#244; Mifune
736	Embeth Davidtz
737	Nathan Lane
738	Fisher Stevens
739	Don Cheadle
740	John Wood (I)
741	Jeremy Northam
742	Jeremy Irons
743	Rip Torn
744	David Strathairn
745	Udo Kier
746	Brian Doyle-Murray
747	Scott Glenn
748	Josef Sommer
749	Eric Idle
750	Judi Dench
751	Rod Steiger
752	Dennis Farina
753	Kurtwood Smith
754	Walter Koenig
755	Paul Guilfoyle (II)
756	Alfonso Arau
757	Ray Walston
758	Ossie Davis
759	Dana Delany
760	Cate Blanchett
761	David Ogden Stiers
762	Debi Mazar
763	Louise Fletcher
764	Don Ameche
765	Stephen Rea
766	Billy Zane
767	Joe Morton
768	Shawn Hatosy
769	John Ashton (I)
770	Fairuza Balk
771	Kevin McCarthy
772	Katie Holmes
773	Bruce Davison
774	Peter MacNicol
775	Rade Serbedzija
776	Ray Liotta
777	Anthony LaPaglia
778	Judge Reinhold
779	Michael York
780	Joseph Cotten
781	Kelly McGillis
782	Kathleen Quinlan
783	William L. Petersen
784	Bonnie Bedelia
785	Laura Dern
786	John Belushi
787	Nastassja Kinski
788	Joshua Jackson
789	Tony Shalhoub
790	Nancy Travis
791	Tim Roth
792	Jean-Marc Barr
793	Jude Law
794	James Russo
795	Rose McGowan
796	Charlotte Rampling
797	Dennis Franz
798	Armand Assante
799	Michael Palin
800	Paul Rudd (I)
801	Helen Hunt
802	James Mason
803	Jonny Lee Miller
804	Courteney Cox
805	Richard Burton
806	Peter Berg
807	Joely Richardson
808	William Atherton
809	Kim Cattrall
810	Maureen Stapleton
811	Ir&#232;ne Jacob
812	Julie Andrews
813	Bryan Brown
814	Julian Sands
815	Luis Bu&#241;uel
816	Gary Cole
817	Isabelle Adjani
818	Jack Weston
819	Vincent Gallo
820	Roberto Benigni
821	Genevi&#232;ve Bujold
822	Bruce Dern
823	Steven Weber
824	Raul Julia
825	Molly Ringwald
826	Lorraine Gary
827	Ingrid Bergman
828	Bette Davis
829	Sidney Poitier
830	Mary-Louise Parker
831	Edward Furlong
832	John Glover
833	Colleen Camp
834	Bradley Whitford
835	Austin Pendleton
836	Peter Horton
837	John Carradine
838	Charlize Theron
839	Bernard Lee (I)
840	Molly Shannon
841	David Niven
842	Richard Jenkins (I)
843	Pat Hingle
844	Richard Libertini
845	Robert Stack
846	Jon Lovitz
847	Christine Baranski
848	Rob Schneider
849	Amanda Plummer
850	Robert Wuhl
851	Ashley Judd
852	Brad Renfro
853	Bill Nunn
854	Amy Brenneman
855	Michael Ironside
856	Christopher Eccleston
857	Amy Yasbeck
858	Richard Masur
859	Jamie Kennedy
860	D.B. Sweeney
861	Seth Green
862	Pete Postlethwaite
863	Casey Siemaszko
864	Robert Wagner
865	Jeanne Tripplehorn
866	Ren&#233;e Zellweger
867	George Gaynes
868	Valeria Golino
869	Devon Sawa
870	Gaby Hoffmann
871	Natalie Portman
872	Harris Yulin
873	Tom Selleck
874	Richard Briers
875	JoBeth Williams
876	Laura Linney
877	Dave Foley
878	Leslie Easterbrook
879	Anthony Edwards
880	Moses Gunn
881	Peter Gallagher
882	O.J. Simpson
883	Dudley Moore
884	Maria Conchita Alonso
885	C. Thomas Howell
886	Cyril Cusack
887	Ed O'Ross
888	Sterling Holloway
889	Ernie Hudson
890	Paul Michael Glaser
891	Tom Hulce
892	Teresa Wright
893	James Garner
894	George Takei
895	Annabeth Gish
896	Adrienne Barbeau
897	Lori Petty
898	Deborah Unger
899	Gunnar Bj&#246;rnstrand
900	Strother Martin
901	Edward Fox
902	Jerry Orbach
903	Rosie Perez
904	Patrick Dempsey
905	Steven Berkoff
906	Lara Flynn Boyle
907	Joe Grifasi
908	Herbert Lom
909	Ken Russell
910	Temuera Morrison
911	Nia Long
912	Peter Ustinov
913	Mary Elizabeth Mastrantonio
914	Eric Bogosian
915	Marilyn Monroe
916	Philip Bosco
917	Liev Schreiber
918	Phil Hartman
919	Alan Rickman
920	Kathy Najimy
921	John Spencer (I)
922	Stellan Skarsg&#229;rd
923	Rita Wilson
924	Peter Coyote
925	Alec Guinness
926	John Neville
927	Alan Cumming
928	Marshall Bell
929	Kyra Sedgwick
930	John Savage
931	John Sayles
932	Pruitt Taylor Vince
933	Karen Allen
934	Moira Kelly (I)
935	Will Ferrell
936	Peter Fonda
937	John Cazale
938	Kim Hunter
939	Anne Archer
940	Aaron Eckhart
941	Robert Mitchum
942	Powers Boothe
943	Anthony Quinn
944	J.E. Freeman
945	Lily Tomlin
946	Gillian Anderson
947	Elliott Gould
948	Steve Oedekerk
949	Roberts Blossom
950	Mary McDonnell
951	Owen Wilson
952	Jim Henson
953	Frank Langella
954	Ted Kotcheff
955	Michael Moore (II)
956	Chris Elliott (I)
957	Richard Edson
958	Dermot Mulroney
959	B.D. Wong
960	Crispin Glover
961	Karen Young (I)
962	Ethan Embry
963	Allen Garfield
964	F. Murray Abraham
965	Wendy Crewson
966	M. Night Shyamalan
967	Jerry Paris
968	G.W. Bailey
969	Thora Birch
970	Ralph Richardson
971	Hal Ashby
972	Andrew Robinson
973	Robert Hays
974	John McNaughton
975	Robert John Burke
976	Paul Dooley
977	Adam Rifkin
978	Priscilla Presley
979	George Miller (II)
980	Volker Schl&#246;ndorff
981	Groucho Marx
982	Hal Hartley
983	Andrew McCarthy
984	William Sadler
985	Alejandro Amen&#225;bar
986	Caroline Goodall
987	Hugh Laurie
988	Iain Softley
989	Ray Wise
990	Phil Daniels (I)
991	Kenny Ortega
992	Leo McCarey
993	Phil Alden Robinson
994	Peter Yates
995	Marc Caro
996	Linda Hamilton
997	Agnieszka Holland
998	Carl Franklin
999	Yahoo Serious
1000	Michael Gough
1001	Peter Medak
1002	Peter Vaughan
1003	Carol Reed
1004	Wolfgang Reitherman
1005	Edward James Olmos
1006	John Hannah
1007	Robert Mandel
1008	Edward Woodward
1009	Rebecca De Mornay
1010	Alan Metter
1011	John Madden (II)
1012	Lois Chiles
1013	Melanie Lynskey
1014	Guy Pearce
1015	John Getz
1016	Lewis Teague
1017	Michael Crichton
1018	Greg Kinnear
1019	Heather Langenkamp
1020	Richard Marquand
1021	Penelope Spheeris
1022	George Stevens
1023	Kim Darby (I)
1024	Pen&#233;lope Cruz
1025	Allan Moyle
1026	Alex D. Linz
1027	Rachel Ticotin
1028	Bruce Robinson (I)
1029	Stuart Rosenberg (I)
1030	Helen Slater
1031	Grace Kelly
1032	Rachel Talalay
1033	Lisa Kudrow
1034	Wes Anderson
1035	F. Gary Gray
1036	Henry Selick
1037	Paul Thomas Anderson
1038	Paul Sorvino
1039	Richard Rush
1040	Frank Darabont
1041	Alex Cox
1042	Elizabeth Perkins
1043	Steven Zaillian
1044	John Lasseter
1045	Fred MacMurray
1046	Linda Hunt
1047	Alex Proyas
1048	Ted Demme
1049	Andrei Konchalovsky
1050	John Lennon
1051	Hayao Miyazaki
1052	Paul Hogan
1053	Luis Llosa
1054	Frank Coraci
1055	Tamra Davis
1056	George Sanders
1057	Casey Affleck
1058	Franco Zeffirelli
1059	William Dear
1060	Robert Aldrich
1061	George Seaton
1062	John Dahl
1063	Hugh Hudson
1064	Stuart Baird
1065	Jason Alexander
1066	Juliette Binoche
1067	Mark Harmon
1068	Julie Harris
1069	Baz Luhrmann
1070	David O. Russell
1071	David N. Twohy
1072	Sam Peckinpah
1073	Mark L. Lester
1074	Topol
1075	Sam Weisman
1076	Nicolas Roeg
1077	Thomas Mitchell (I)
1078	Samantha Mathis
1079	Brenda Blethyn
1080	David Lean
1081	Tracey Walter
1082	David Keith
1083	Breckin Meyer
1084	James Dean
1085	Jared Leto
1086	Debra Winger
1087	Arthur Hiller
1088	Matthew Perry
1089	James Fox (I)
1090	Rowdy Herrington
1091	Nora Ephron
1092	James Gammon (I)
1093	Denise Richards
1094	Brett Ratner
1095	Kar-wai Wong
1096	Steve Barron
1097	James Whale
1098	Marion Ramsey
1099	James Mangold
1100	Rutger Hauer
1101	Dean Parisot
1102	Dean Martin
1103	Stephen Sommers (I)
1104	Barbet Schroeder
1105	Barnard Hughes
1106	Michael Mann
1107	Ruby Dee
1108	Clark Gable
1109	Ming-Na
1110	Colin Higgins (I)
1111	Joseph L. Mankiewicz
1112	Jeroen Krabb&#233;
1113	Christina Applegate
1114	Simon West (I)
1115	Simon Wincer
1116	Jerry Zucker
1117	David Hand
1118	Mick Jackson (II)
1119	Joseph Sargent
1120	Jonathan Mostow
1121	Todd Solondz
1122	Chuck Russell
1123	Tobe Hooper
1124	Bob Fosse
1125	Christine Taylor
1126	Mary Stuart Masterson
1127	Joe Chappelle
1128	Claude Rains
1129	Danny Cannon
1130	Jean-Hugues Anglade
1131	Jean-Jacques Annaud
1132	Jean-Jacques Beineix
1133	David Anspaugh
1134	Dave Goelz
1135	Scott Hicks
1136	Darren Aronofsky
1137	Morton DaCosta
1138	Stephan Elliott
1139	Brad Silberling
1140	Martin Donovan (II)
1141	Martha Coolidge
1142	Jeffrey Combs
1143	Daniel Auteuil
1144	Dan O'Herlihy
1145	Sean Young
1146	Jena Malone
1147	Chris Tucker
1148	Bibi Andersson
1149	Nicholas Hytner
1150	Bernard Rose
1151	Victor Fleming
1152	Ron Clements
1153	Kelly Lynch
1154	Michael Radford
1155	Verna Felton
1156	Douglas Trumbull
1157	Patricia Neal
1158	Jackie Cooper (I)
1159	Antonia Bird
1160	Katt Shea (I)
1161	James Brolin
1162	Don Rickles
1163	Doug Liman
1164	J. Lee Thompson
1165	Kelsey Grammer
1166	Ole Bornedal
1167	James Algar
1168	Robin Tunney
1169	P.J. Hogan
1170	Roland Joff&#233;
1171	Brian Gibson
1172	Irwin Winkler
1173	Jack Sholder
1174	John Bruno
1175	Annabel Jankel
1176	Diane Venora
1177	Vincent Perez
1178	Dwight H. Little
1179	Robin Shou
1180	Isaac Hayes
1181	Annie Potts
1182	Marco Brambilla
1183	Charles Laughton
1184	Robert Shaw
1185	Katrin Cartlidge
1186	Bill Cobbs
1187	Patricia Clarkson
1188	Charles Rocket
1189	Charles Hallahan
1190	William Fichtner
1191	Lois Smith
1192	Victor Wong (III)
1193	Natasha Lyonne
1194	Ian Hart
1195	Ted Danson
1196	Freddie Jones
1197	Don Harvey (I)
1198	Frederic Forrest
1199	Jason Isaacs
1200	Jack Noseworthy
1201	Glenn Plummer
1202	Clancy Brown
1203	Paul Winfield
1204	Mykelti Williamson
1205	Tom Atkins
1206	Brent Spiner
1207	Anna Paquin
1208	Stephen Collins
1209	Harvey Korman
1210	Elijah Wood
1211	Anthony Zerbe
1212	James Frain
1213	Geraldine Chaplin
1214	Dylan Baker
1215	Jason Lee (I)
1216	Phoebe Cates
1217	Everett McGill
1218	Jonathan Hyde
1219	David Krumholtz
1220	Blythe Danner
1221	Peter Falk
1222	Wallace Shawn
1223	Stephen Fry
1224	Seymour Cassel
1225	Catherine Hicks
1226	Judd Nelson
1227	Martin Short
1228	Nancy Allen
1229	Stanley Tucci
1230	E.G. Marshall
1231	Ralph Bellamy
1232	Kasi Lemmons
1233	Cliff De Young
1234	Michael Gambon
1235	Jennifer Tilly
1236	Luis Guzm&#225;n
1237	Wil Wheaton
1238	Mary Beth Hurt
1239	James Hampton
1240	Maximilian Schell
1241	Anthony Perkins
1242	Jeffrey DeMunn
1243	Stephen Baldwin
1244	Marsha Mason
1245	Sean Patrick Flanery
1246	Terry O'Quinn
1247	Daniel von Bargen
1248	Connie Nielsen
1249	Tony Burton
1250	Vin Diesel
1251	Jon Cryer
1252	Piper Laurie
1253	Fred Gwynne
1254	Rachel Griffiths (I)
1255	Graham Greene (II)
1256	Angie Dickinson
1257	George Segal
1258	Jerry O'Connell
1259	Bill McKinney
1260	Campbell Scott
1261	Ian Bannen
1262	Caroline Aaron
1263	Corey Feldman
1264	Dylan McDermott
1265	Miranda Richardson
1266	Yaphet Kotto
1267	Gene Saks
1268	Jennifer Grey
1269	Jennifer Connelly
1270	Jennifer Beals
1271	Jerry Nelson
1272	Jack Thompson (I)
1273	Brenda Fricker
1274	Thomas Jane
1275	Mae Whitman
1276	Ward Bond
1277	Richard Bohringer
1278	Joey Lauren Adams
1279	John Vernon
1280	Rosie O'Donnell
1281	Brenda Vaccaro
1282	Diana Scarwid
1283	Jason London
1284	Larry Miller
1285	Rick Rossovich
1286	Andre Braugher
1287	Jacqueline Bisset
1288	Dee Wallace-Stone
1289	Eugene Levy
1290	Henry Jones (I)
1291	John Forsythe
1292	Henry Winkler
1293	Bernard Hill
1294	Bernadette Peters
1295	Robert Forster
1296	Teri Hatcher
1297	Richard Roundtree
1298	Charlie Korsmo
1299	Catherine Zeta-Jones
1300	Pamela Reed
1301	Katherine Helmond
1302	Elizabeth Hurley
1303	Nina Foch
1304	Brigitte Nielsen
1305	Tony Roberts (I)
1306	David Hemblen
1307	Donald Moffat
1308	Michael Jeter
1309	CCH Pounder
1310	Bruce McGill
1311	Armin Mueller-Stahl
1312	Richard Riehle
1313	Peter Stormare
1314	Patrick McGoohan
1315	Frank McRae
1316	Alan Alda
1317	Halle Berry
1318	Richard Kiel
1319	Liv Tyler
1320	Saul Rubinek
1321	David Caruso
1322	Leo G. Carroll
1323	Cathy Moriarty
1324	Damon Wayans
1325	Chris Rock
1326	Muse Watson
1327	Elizabeth Daily
1328	Marvin J. McIntyre
1329	Paul Bartel
1330	Jeremy Piven
1331	Peter Donat
1332	Paul Gleason (I)
1333	Kenneth Mars
1334	John Saxon
1335	Joseph Maher
1336	Porter Hall
1337	James Caviezel
1338	James Duval
1339	Kirstie Alley
1340	Michael Par&#233;
1341	John Lurie
1342	James Cosmo
1343	M.C. Gainey
1344	Joanna Cassidy
1345	Ian McDiarmid
1346	Jack MacGowran
1347	Josh Charles
1348	Lee Marvin
1349	Julie Delpy
1350	Maurice Evans
1351	Lee Van Cleef
1352	Harland Williams
1353	Jason Robards
1354	Mitch Ryan
1355	P.J. Soles
1356	Miriam Margolyes
1357	Marc McClure (I)
1358	Harry Connick Jr.
1359	Milla Jovovich
1360	Kevin Peter Hall
1361	Keenen Ivory Wayans
1362	LL Cool J
1363	Oprah Winfrey
1364	James Belushi
1365	Omar Sharif
1366	Mickey Rooney
1367	Kieran Culkin
1368	Robert Patrick
1369	Richard Schiff
1370	Ed Binns
1371	Rachel Roberts
1372	Charles Martin Smith
1373	David Schwimmer
1374	Regina King
1375	Charles Cyphers
1376	Billy Crudup
1377	Wallace Ford
1378	Dominique Pinon
1379	Betsy Palmer
1380	Gedde Watanabe
1381	Rodney Dangerfield
1382	Richard Griffiths (I)
1383	Edward Herrmann
1384	Richard A. Dysart
1385	Dennis Haysbert
1386	Colm Meaney
1387	Reni Santoni
1388	Tia Carrere
1389	Ann-Margret
1390	Claudia Cardinale
1391	Clea DuVall
1392	Cliff Curtis
1393	Christopher Lee
1394	Clare Higgins (I)
1395	Bill Hunter (I)
1396	Tony Darrow
1397	Joseph Mazzello
1398	Tony Goldwyn
1399	Timothy Spall
1400	Josh Hamilton
1401	Judd Hirsch
1402	Mary Kay Place
1403	James Cagney
1404	Joseph Gordon-Levitt
1405	Jos&#233; Ferrer
1406	Otto Preminger
1407	Ron Livingston
1408	Oskar Werner
1409	Tori Spelling
1410	Dina Meyer
1411	Omar Epps
1412	Tom Arnold
1413	Olivia Newton-John
1414	Olivia Williams
1415	Ron Rifkin
1416	Verna Bloom
1417	Hugo Weaving
1418	Robert Davi
1419	Katharine Ross
1420	Elizabeth Wilson (I)
1421	Elle Macpherson
1422	Hoyt Axton
1423	Isaiah Washington
1424	Kathryn Beaumont
1425	Iben Hjejle
1426	Paul Mercurio
1427	Keir Dullea
1428	Keith Coogan
1429	Margot Kidder
1430	Marco Leonardi
1431	Paul Scofield
1432	Marianne S&#228;gebrecht
1433	Edmund Gwenn
1434	Jack Gilford
1435	Julia Ormond
1436	Dylan Walsh
1437	Trevor Howard
1438	Rosalind Russell
1439	Patrick Bergin
1440	Kate Beckinsale
1441	Robert Sean Leonard
1442	Karl Malden
1443	Julie Walters
1444	Robert Preston (I)
1445	Irene Bedard
1446	Juliet Stevenson
1447	Tuesday Weld
1448	Ice-T
1449	Jack Hawkins
1450	James Hong
1451	Sean Bean
1452	Miriam Flynn
1453	Sterling Hayden
1454	Charles Dance
1455	Dan Futterman
1456	Jeffrey Wright
1457	Dana Carvey
1458	Roy Dotrice
1459	Michael Dorn
1460	John Astin
1461	Danny Kaye
1462	Casper Van Dien
1463	Cary-Hiroyuki Tagawa
1464	Myrna Loy
1465	Carol Burnett
1466	Michael Beck
1467	Charles Bronson
1468	Stanley Baker
1469	Jim Mallon
1470	Solveig Dommartin
1471	Sofia Coppola
1472	Michelle Yeoh
1473	Joaquim de Almeida
1474	Skeet Ulrich
1475	Cylk Cozart
1476	Sihung Lung
1477	Shannon Elizabeth
1478	Sheryl Lee
1479	Chia-Liang Liu
1480	Michael Jai White
1481	Craig Sheffer
1482	Mimi Rogers
1483	Craig Wasson
1484	Takeshi Kitano
1485	Spike Jonze
1486	James Marsden
1487	Carlo Cecchi
1488	Maureen O'Hara
1489	Nicolette Sheridan
1490	Thomas F. Wilson
1491	Ruth Warrick
1492	Dean Stockwell
1493	Brian Henson
1494	Ruth Gordon
1495	Nick Cassavetes
1496	John Williams (II)
1497	Pamela Blair
1498	Rufus Sewell
1499	Paul Smith (I)
1500	Johnathon Schaech
1501	James Fleet
1502	Bobby Driscoll
1503	Nikita Mikhalkov
1504	Sammi Davis (I)
1505	Mary Wickes
1506	Bruce McCulloch
1507	John Houseman
1508	Tara Fitzgerald
1509	Jean Arthur
1510	Tate Donovan
1511	Saffron Burrows
1512	Brooke Adams
1513	David Carradine
1514	Sam Wanamaker
1515	Bridgette Wilson
1516	Nichelle Nichols
1517	John Meillon
1518	Sam Elliott
1519	Maxwell Caulfield
1520	Terry Kinney
1521	Jason Scott Lee
1522	Adam Hann-Byrd
1523	Greg Cruttwell
1524	Vivien Leigh
1525	Radha Mitchell
1526	Warren Clarke
1527	Farley Granger
1528	Hayden Panettiere
1529	Henry Czerny
1530	Liza Minnelli
1531	Reginald VelJohnson
1532	Gailard Sartain
1533	Lou Jacobi
1534	Heath Ledger
1535	Alexis Arquette
1536	Walter Brennan
1537	George Carlin
1538	Richard Jordan (I)
1539	Yul Brynner
1540	Richard Lineback
1541	Louis Gossett Jr.
1542	Amy Madigan
1543	William Powell
1544	Akira Terao
1545	Lee J. Cobb
1546	Angela Lansbury
1547	Koji Yakusho
1548	Linda Fiorentino
1549	Piper Perabo
1550	Linus Roache
1551	Paul Walker (I)
1552	Richard Farnsworth
1553	Glynis Johns
1554	Kenneth Tsang
1555	Annette O'Toole
1556	Lisa Bonet
1557	Peter Graves (I)
1558	Leslie Mann
1559	LeVar Burton
1560	Peter Facinelli
1561	Lane Smith (I)
1562	Vincent Cassel
1563	Ricki Lake
1564	Rex Linn
1565	Allison Janney
1566	Nicky Katt
1567	Jim Broadbent
1568	Tom Waits
1569	Fred Dalton Thompson
1570	Frankie Faison
1571	David Patrick Kelly
1572	Martha Plimpton
1573	Jane Adams (II)
1574	Derek Jacobi
1575	Jon Polito
1576	Anthony Heald
1577	Stuart Pankin
1578	Marc Macaulay
1579	Ronald Lacey
1580	Bebe Neuwirth
1581	Matt Craven
1582	G.D. Spradlin
1583	Lucinda Jenney
1584	Daniel Roebuck
1585	Chelcie Ross
1586	Jeff Corey
1587	Frances Bay
1588	Sarah Polley
1589	Holland Taylor
1590	Max Casella
1591	Sam Rockwell
1592	Ally Walker
1593	John Pankow
1594	John Randolph
1595	Michael Rispoli
1596	Jake Busey
1597	George Wendt
1598	Billy Connolly
1599	Olek Krupa
1600	Donal Logue
1601	Jon Tenney
1602	Michael J. Pollard
1603	Miguel Ferrer
1604	Ling Bai
1605	Jake Weber
1606	Cliff Robertson
1607	Cole Hauser
1608	Kyle Secor
1609	Stephen Lang
1610	Om Puri
1611	Allen Covert
1612	Chloe Webb
1613	William Lee Scott
1614	John P. Ryan
1615	Lorraine Bracco
1616	John M. Jackson
1617	Telly Savalas
1618	John Larroquette
1619	Lena Olin
1620	Maura Tierney
1621	Sandy Baron
1622	David Suchet
1623	Albert Hall (I)
1624	Johnny Galecki
1625	Brendan Sexton III
1626	Grant Heslov
1627	Noah Emmerich
1628	Danny Trejo
1629	Boyd Gaines
1630	Rowan Atkinson
1631	Rebecca Gayheart
1632	Jeffrey Kramer
1633	Alan Ruck
1634	Mason Gamble
1635	Roshan Seth
1636	Timothy Busfield
1637	Lonette McKee
1638	Mark Blum
1639	Harvey Fierstein
1640	Paul Giamatti
1641	Iggy Pop
1642	Fran Drescher
1643	Marilu Henner
1644	Anthony Rapp
1645	Margaret Colin
1646	Elizabeth McGovern
1647	Kevin Anderson
1648	Trey Wilson
1649	Til Schweiger
1650	Paul Shenar
1651	Judith Anderson
1652	Marc Anthony (I)
1653	Barry Pepper
1654	Elizabeth Berkley
1655	Anthony Daniels
1656	Joss Ackland
1657	Eric Christmas
1658	Angela Bassett
1659	Edie McClurg
1660	James Whitmore
1661	Thierry Lhermitte
1662	Andrew Divoff
1663	Charlotte Stewart
1664	Bill Campbell
1665	Cynthia Stevenson
1666	Sally Kirkland
1667	Alec McCowen
1668	Cedric Hardwicke
1669	Elsa Lanchester
1670	Lee Evans (I)
1671	Lesley Ann Warren
1672	Peter Michael Goetz
1673	Imelda Staunton
1674	Damian Chapa
1675	Lesley Sharp
1676	Brent Jennings
1677	Kathy Baker
1678	John Rhys-Davies
1679	Edward G. Robinson
1680	Robert Pastorelli
1681	Matt Stone
1682	Marianne Jean-Baptiste
1683	Nicholas Farrell
1684	Sela Ward
1685	Charles Cioffi
1686	Greta Scacchi
1687	Josh Hartnett
1688	David Bowie
1689	Jean-Luc Godard
1690	Gemma Jones
1691	Sammo Hung Kam-Bo
1692	Taylor Nichols
1693	Elaine Hendrix
1694	Ursula Andress
1695	Swoosie Kurtz
1696	Sandahl Bergman
1697	Mia Kirshner
1698	Tatsuya Nakadai
1699	Natasha Henstridge
1700	John Herzfeld
1701	Natascha McElhone
1702	Leon (I)
1703	Jason Mewes
1704	Darren McGavin
1705	George Newbern
1706	Nicholas Ray
1707	Irma P. Hall
1708	Peter Riegert
1709	Cybill Shepherd
1710	Sam J. Jones
1711	Elizabeth Pe&#241;a
1712	Brittany Murphy
1713	Angela Featherstone
1714	Nancy Kyes
1715	Michael Clarke Duncan
1716	Elaine May
1717	Janet Leigh
1718	Elden Ratliff
1719	Phil Harris (I)
1720	Michael Bates (I)
1721	Gregory Hines
1722	Karen Black
1723	Stan Shaw
1724	Kim Dickens
1725	Stacy Keach
1726	Ben Johnson (I)
1727	Billy Dee Williams
1728	Ron Eldard
1729	Hilary Swank
1730	Ben Cross
1731	Jack Black (I)
1732	Jessica Harper
1733	Alison Elliott (I)
1734	Christine Lahti
1735	Madolyn Smith-Osborne
1736	Christine Ebersole
1737	Ali Larter
1738	Anouk Aim&#233;e
1739	Ron Silver
1740	Mike McGlone
1741	Spalding Gray
1742	Harry Morgan
1743	Pupella Maggio
1744	Claire Bloom
1745	Alyson Hannigan
1746	Jim Brown
1747	Michelle Williams
1748	Wayne Knight
1749	Cleavon Little
1750	Slim Pickens
1751	Marg Helgenberger
1752	Michael Vartan
1753	Linda Blair
1754	Frances Sternhagen
1755	Marco Hofschneider
1756	Bill Tung
1757	Gilbert Gottfried
1758	Eric Roberts
1759	Polly Walker (II)
1760	Shawn Wayans
1761	Fritz Weaver
1762	Colm Feore
1763	Milo O'Shea
1764	Sid Caesar
1765	Norm Macdonald
1766	Lew Ayres
1767	Lucy Liu
1768	Grace Jones
1769	Chlo&#235; Sevigny
1770	Peter Jason
1771	Jennifer Rubin (I)
1772	Anatoli Solonitsyn
1773	Curtis Armstrong
1774	Keenan Wynn
1775	Deborah Kerr
1776	Eliza Dushku
1777	Larry Gates
1778	Patricia Hayes (I)
1779	Miko Hughes
1780	Michael Lonsdale
1781	Joel Grey
1782	Richard Haydn
1783	Michael Lerner
1784	Victor Argo
1785	Jon Finch
1786	Ben Chaplin
1787	Dennis Miller (I)
1788	Paul McGann
1789	Mildred Natwick
1790	Noble Willingham
1791	David Margulies
1792	Jack Kehoe
1793	Desmond Llewelyn
1794	Grace Zabriskie
1795	Leon Rippy
1796	Grand L. Bush
1797	Stefan Gierasch
1798	David Cross (II)
1799	Lisa Jane Persky
1800	Lois Maxwell
1801	Jenette Goldstein
1802	Zach Grenier
1803	Zeljko Ivanek
1804	Bronson Pinchot
1805	Ed Lauter
1806	Lanny Flaherty
1807	Julia Sweeney
1808	Mark Rolston
1809	Dick Miller (I)
1810	Nicholas Pryor
1811	Terence Stamp
1812	Ted Raimi
1813	Richard Harris
1814	David Proval
1815	John Kapelos
1816	Madeleine Stowe
1817	Frank Vincent (I)
1818	Tony Todd (I)
1819	Bill Irwin
1820	David Spade
1821	Julie Kavner
1822	James LeGros
1823	Deborah Rush
1824	William Windom
1825	David Hayman
1826	David Thornton (I)
1827	Laurie Metcalf
1828	Elya Baskin
1829	Mary McCormack
1830	Heather Matarazzo
1831	Adam Baldwin
1832	Ed Begley Jr.
1833	Edward Hardwicke
1834	Bob Goldthwait
1835	Patrick Magee (I)
1836	Todd Allen
1837	Blair Underwood
1838	Tom 'Tiny' Lister Jr.
1839	Julia Louis-Dreyfus
1840	Roma Maffia
1841	Jacqueline Kim
1842	Ricky Jay
1843	Jack Nance
1844	Michelle Johnson
1845	Robert Webber (I)
1846	Carlos G&#243;mez (II)
1847	John Hillerman
1848	Natasha Gregson Wagner
1849	Adrian Pasdar
1850	Michael G. Hagerty
1851	Ian McNeice
1852	Brian O'Halloran
1853	Paul Bates
1854	Wes Studi
1855	Kenneth Cranham
1856	Zero Mostel
1857	Tracey Ullman
1858	Tom Guiry
1859	Lillo Brancato
1860	Billy Gilbert (I)
1861	Victoria Rowell
1862	Joe Berlinger
1863	Klaus Maria Brandauer
1864	Mel Smith
1865	Wesley Addy
1866	Mic Rodgers
1867	Megan Ward
1868	Suzy Amis
1869	Ulrich Thomsen
1870	Angel David
1871	Brooke Shields
1872	Artie Lange
1873	Tara Reid
1874	Benjamin Bratt
1875	Amy Irving
1876	'Weird Al' Yankovic
1877	Tony Danza
1878	Mario Machado
1879	Billie Whitelaw
1880	Michael Elphick
1881	Abe Vigoda
1882	Sonny Bono
1883	Bruno Ganz
1884	Adrien Brody
1885	Kevin Hooks
1886	Werner Herzog
1887	Judith Hoag
1888	Tatum O'Neal
1889	Louis Giambalvo
1890	Andrew Dice Clay
1891	Beah Richards
1892	Leland Orser
1893	Brian Thompson (I)
1894	Brad Davis
1895	Ted Levine
1896	Michael Currie
1897	Mark Pellington
1898	Louise Lasser
1899	Zak Orth
1900	Brian McCardie
1901	Leslie Carlson
1902	Theresa Randle
1903	Arnold Vosloo
1904	Steve Railsback
1905	Steve Whitmire
1906	Cecil B. DeMille
1907	Thandie Newton
1908	Zach Galligan
1909	Barry Dennen
1910	Jon Seda
1911	Barry Miller
1912	Jurnee Smollett
1913	Adam Goldberg
1914	Terence Rigby
1915	Leopold Stokowski
1916	Cherie Lunghi
1917	Larry Block
1918	Stuart Wilson (II)
1919	Julie Bowen
1920	Arsenio Hall
1921	Magda Szubanski
1922	Bokeem Woodbine
1923	Mathieu Kassovitz
1924	John Witherspoon
1925	Julia Stiles
1926	John Duigan
1927	Jake Kasdan
1928	Sherilyn Fenn
1929	Scott Caan
1930	Oliver Parker (I)
1931	Daryl Mitchell
1932	James Brown (I)
1933	Paul Reiser
1934	Monica Potter
1935	Heather Locklear
1936	Dick Van Dyke
1937	Sam Waterston
1938	Jeanne Moreau
1939	Sean McGinley
1940	Peter Howitt (II)
1941	Ron Carey
1942	Osheen Jones
1943	Hope Davis
1944	Gretchen Mol
1945	Roger Rees
1946	Minoru Chiaki
1947	Hope Lange
1948	Jenny Agutter
1949	Craig Bierko
1950	Courtney B. Vance
1951	Jeremy Davies
1952	Guillermo D&#237;az
1953	Ethan Suplee
1954	Jamie Foxx
1955	Jamie Uys
1956	Richard O'Brien (I)
1957	Saeed Jaffrey
1958	Harvey Atkin
1959	Penelope Allen
1960	Fiona Shaw
1961	Nicoletta Braschi
1962	James Sikking
1963	Richard Gant
1964	David Alan Grier
1965	Rick Ducommun
1966	Djimon Hounsou
1967	David Hyde Pierce
1968	Nina Siemaszko
1969	Russ Tamblyn
1970	Harmony Korine
1971	Roy Kinnear
1972	Dennis Christopher
1973	Norman Alden
1974	Ric Young
1975	Jean-Paul Belmondo
1976	Erland Josephson
1977	Jean-Pierre L&#233;aud
1978	Jason Patric
1979	Glenn Shadix
1980	J.A. Preston
1981	Jim Haynie
1982	Gregg Henry
1983	Patrice Camhi
1984	Jeremy Sisto
1985	Jessie Royce Landis
1986	Clarence Williams III
1987	Roberta Maxwell
1988	Dougray Scott
1989	Robert J. Wilke
1990	Robert Vaughn
1991	Gerrit Graham
1992	Pamela Segall
1993	Cliff Gorman
1994	Jack Gilpin
1995	Jesse Bradford
1996	Miki Manojlovic
1997	Ione Skye
1998	Julieta Serrano
1999	Kenneth More
2000	Barry Fitzgerald
2001	Kaige Chen
2002	Ken Hughes (I)
2003	Anne Baxter
2004	Ken Leung
2005	Ken Stott
2006	Kenneth Johnson (I)
2007	Ken Sagoes
2008	Henry Silva
2009	Errol Flynn
2010	Anne Parillaud
2011	Juzo Itami
2012	Henry Travers
2013	Ilene Woods
2014	Ernst Lubitsch
2015	Fernando Trueba
2016	Floyd Mutrux
2017	Andrew Morahan
2018	Irwin Allen
2019	Edward Asner
2020	Andrew Niccol
2021	Andrew Sipes
2022	Irene Grazioli
2023	Andrzej Bartkowiak
2024	Andy Wachowski
2025	Julie Taymor
2026	Andy Wilson (IV)
2027	Edward Dmytryk
2028	Julien Temple
2029	Henry Koster
2030	Fernanda Montenegro
2031	Fax Bahr
2032	Kevin Conroy
2033	Anita Mui
2034	Henry Bergman
2035	F.W. Murnau
2036	Ann Reinking
2037	Kerry Fox
2038	Edward D. Wood Jr.
2039	Anthony Drazan
2040	Henry Hathaway
2041	Ernie Reyes Jr.
2042	Irene Cara
2043	Ash Brannon
2044	Honor Blackman
2045	Katsuhiro &#212;tomo
2046	Ate de Jong
2047	Antony Sher
2048	Arlene Sanford
2049	Arletty
2050	Elise Neal
2051	Arne Glimcher
2052	Ashley Laurence
2053	Kathryn Erbe
2054	Ken Finkleman
2055	Arnold Alfredsson
2056	Ian Charleson
2057	Kate Reid
2058	Elizabeth Hoffman
2059	Arthur Penn
2060	Emmanuelle B&#233;art
2061	Howard Franklin
2062	Emily Bergl
2063	Howard Stern
2064	Art Garfunkel
2065	Arthur Hill (I)
2066	Hugh Jackman
2067	Ellen Greene
2068	Kate Maberly
2069	Kelly LeBrock
2070	Kamatari Fujiwara
2071	Ken Howard (I)
2072	Eric Darnell
2073	Erick Zonca
2074	Katherine Heigl
2075	Efrem Zimbalist Jr.
2076	Erich von Stroheim
2077	Kelly Rowan
2078	Hermione Baddeley
2079	Anthony Lucero (I)
2080	Kelly Makin
2081	Eli Wallach
2082	Anthony Quayle
2083	Antonella Attili
2084	Hettie MacDonald
2085	Bajram Severdzan
2086	Anthony Waller
2087	Ian Michael Smith
2088	Hill Harper
2089	Eric Radomski
2090	Eric Leighton
2091	Antoine Fuqua
2092	Austin Stoker
2093	Eleanor Audley
2094	Ernest R. Dickerson
2095	Barry Bostwick
2096	Leon Lai
2097	Adrienne Shelly
2098	Adrienne King
2099	Leo McKern
2100	Gene Lockhart
2101	Geoffrey Wright (I)
2102	Francesca Annis
2103	George Armitage
2104	Gaspard Manesse
2105	Gregory Widen
2106	Gregory Walcott
2107	George Coe
2108	Adriana Caselotti
2109	George Dunning (II)
2110	Adam Resnick
2111	Leon Gast
2112	Gary Sinyor
2113	Alastair Sim
2114	Gary Fleder
2115	Alan Shapiro
2116	Lee David Zlotoff
2117	Gary Nelson
2118	Gary Ross
2119	Ajay Naidu
2120	Lee Grant (I)
2121	Gene Barry
2122	Alan Myerson
2123	Lee Remick
2124	Alan Ladd
2125	Alan Cohn
2126	Gary Trousdale
2127	George Huang
2128	Grigori Aleksandrov
2129	Gil Junger
2130	George Harrison
2131	Liam Cunningham
2132	Gore Verbinski
2133	Abel Ferrara
2134	Gordon Parks
2135	Gian Maria Volont&#233;
2136	Adam Arkin
2137	Giancarlo Giannini
2138	Lewis Milestone
2139	Glenn Gordon Caron
2140	Gillian Armstrong
2141	Gladys Cooper
2142	Giuseppe Tornatore
2143	&#201;lodie Bouchez
2144	Linda Henry (I)
2145	Lilia Skala
2146	Adam Bernstein
2147	Gary Cooper
2148	George Lazenby
2149	George Pal
2150	Gregg Edelman
2151	Lesli Linka Glatter
2152	Gregg Araki
2153	Liam Aiken
2154	Leslie Cheung
2155	Gregory Nava
2156	Gerald Potterton
2157	Adam Beach
2158	Gert Fr&#246;be
2159	Gr&#233;goire Colin
2160	Gore Vidal
2161	Ghita N&#248;rby
2162	George Sluizer
2163	Allison Anders
2164	Hark Tsui
2165	Amy Locane
2166	Kirk Jones (III)
2167	Kirk Wong
2168	Harry Elfont
2169	Francis Veber
2170	Kimberly Williams (I)
2171	Frank Overton
2172	Kimberly Peirce
2173	Harpo Marx
2174	Frankie Muniz
2175	Fraser Clarke Heston
2176	Kris Isacsson
2177	Kristina Adolphson
2178	Guillermo del Toro
2179	Kitty Winn
2180	Amy Smart
2181	Fran Rubel Kuzui
2182	Heather Donahue
2183	Kieu Chinh
2184	Fran&#231;ois Girard
2185	Haviland Morris
2186	Anand Tucker
2187	Kinka Usher
2188	Amy Steel
2189	Allan Corduner
2190	Harve Foster
2191	Harry Winer
2192	Basil Rathbone
2193	Kimberly Deauna Adams
2194	Douglas McGrath (I)
2195	Harry Hamlin
2196	Franc Roddam
2197	Lauren Graham
2198	Fred Clark (I)
2199	Alexander Payne
2200	Alex Winter
2201	Alex Karras
2202	Gabriele Ferzetti
2203	Alex D&#233;sert
2204	G&#233;rard Pir&#232;s
2205	Guy Ritchie
2206	Fritz Kiersch
2207	Aleksander Bardini
2208	Alek Keshishian
2209	Gabrielle Anwar
2210	Gustav Botz
2211	Albert Magnoli
2212	Kevin Williamson
2213	Laura San Giacomo
2214	Lance Guest
2215	Allan Arkush
2216	Hardie Albright
2217	Fred M. Wilcox
2218	Kyle T. Heffner
2219	Kylie Minogue
2220	Alison Crosbie
2221	Gabriel Axel
2222	Lainie Kazan
2223	Gary Farmer
2224	Hamilton Luske
2225	Haley Joel Osment
2226	Alfonso Cuar&#243;n
2227	Fredric March
2228	Alexandra Paul
2229	Alexandra Dahlstr&#246;m
2230	Alicia Witt
2231	Darren Stein
2232	Carl Schultz
2233	Jean-Paul Rappeneau
2234	Jean-Pierre Cassel
2235	Jean-Pierre Jeunet
2236	John Fortenberry
2237	Carmen Maura
2238	Carole Lombard
2239	Carroll Ballard (I)
2240	John Diehl
2241	John Denver
2242	John De Bello
2243	Dave Thomas (I)
2244	Catherine McCormack
2245	Ben Sharpsteen
2246	Cecilia Roth
2247	Charles Crichton
2248	Daniel Myrick
2249	John Call (I)
2250	Daniel Petrie
2251	Charles Berling
2252	John Cornell
2253	Daniel Petrie Jr.
2254	Cathy Tyson
2255	Cecil Kellaway
2256	John Cassavetes
2257	Jeff Kanew
2258	Daphne Zuniga
2259	Dario Argento
2260	Byron Haskin
2261	Jeffrey John Davis
2262	Bronwen Hughes
2263	David Arkin
2264	David Hogan
2265	John Irvin
2266	David Huddleston
2267	Jay Levey
2268	Jean Gabin
2269	David Kellogg
2270	David Gulpilil
2271	David Koepp
2272	Jason James Richter
2273	David M. Evans (I)
2274	David Marshall Grant
2275	Jason Bloom
2276	Jason Biggs
2277	Jason Schwartzman
2278	John Gray (I)
2279	Damon Santostefano
2280	Jean-Marie Poir&#233;
2281	Burl Ives
2282	David Carson (I)
2283	David Dobkin
2284	Jay Russell
2285	Jean-Claude Dreyfus
2286	Cantinflas
2287	John Guillermin
2288	David Emge
2289	John Haycraft
2290	Bruce Lee
2291	Jean Seberg
2292	Jean Renoir
2293	Buddy Van Horn
2294	Christopher Daniel Barnes
2295	Jerome Robbins
2296	Claude Sautet
2297	Jesse Ventura
2298	Christopher Leitch
2299	Jocelyn Moorhouse
2300	Joanna Pacula
2301	Jodi Lyn O'Keefe
2302	Jet Li
2303	Joe Alves
2304	Joe Belcher
2305	Christopher Cain (I)
2306	Christopher Ashley
2307	Clint Howard
2308	Dan Monahan (I)
2309	Jerry Reed (I)
2310	Jim True
2311	Fred Dekker
2312	Giuseppe Andrews
2313	Claire Trevor
2314	Jim Fall
2315	Jim McBride
2316	Joanne Whalley
2317	Jim Drake (II)
2318	Clu Gulager
2319	Cindy Williams (I)
2320	Claude Berri
2321	Joan Fontaine
2322	Chuck Pfarrer
2323	Christopher Monger
2324	Christopher McQuarrie
2325	Jim Sharman
2326	Cyril O'Reilly
2327	Clive Barker
2328	Joey Travolta
2329	Chico Marx
2330	John Ales
2331	Jennifer O'Neill (I)
2332	Joey Cramer
2333	Jennifer Lien
2334	Chris Buck (II)
2335	John Baddeley
2336	Dale Midkiff
2337	Damien O'Donnell
2338	John Beck (II)
2339	Jennifer Chambers Lynch
2340	Jared Rushton
2341	Cy Endfield
2342	Chris Smith (II)
2343	Clyde Bruckman
2344	Christine Cavanaugh
2345	Christian Nyby
2346	Christian Duguay (I)
2347	Christian Duguay
2348	Courtney Gains
2349	Chris Young (I)
2350	Jeni Courtney
2351	Joe Pytka
2352	Chris Roberts (II)
2353	Chris Noonan
2354	Chris Kattan
2355	Chris Eyre
2356	Jeremy Leven
2357	Christian Clavier
2358	Joseph McGinty Nichol
2359	Don McKellar
2360	Dolph Lundgren
2361	Bill Thompson (I)
2362	Dominic Sena
2363	Jacob Sewell
2364	Joseph Fiennes
2365	Bill Condon
2366	Jake Gyllenhaal
2367	Joseph Melito
2368	Jackie Mason
2369	Bill Bernstein
2370	Biff McGuire
2371	Betty Buckley
2372	Dian Bachar
2373	Don Coscarelli
2374	James Bond
2375	Jason Bateman
2376	Boaz Yakin
2377	Diane Baker
2378	Jonathan Darby
2379	Bo Derek
2380	Jacqueline McKenzie (I)
2381	Bj&#246;rk
2382	Don Roos
2383	Bing Crosby
2384	Dolly Parton
2385	Jake Scott (II)
2386	Jonathan Silverman
2387	Jordana Brewster
2388	Josef Rusnak
2389	James Bridges (I)
2390	Julian Schnabel
2391	Don Gordon (I)
2392	Judy Parfitt
2393	Jack Carson (I)
2394	Jace Alexander (I)
2395	Duane Jones (I)
2396	Jack Kruschen
2397	Eamonn Owens
2398	Drew Desmarais
2399	Beeban Kidron
2400	Ivo Caprino
2401	Isao Takahata
2402	Julie Carmen
2403	Isabelle Huppert
2404	Beau Bridges
2405	J.L. Reate
2406	Benny Chan
2407	Josh Evans
2408	Donald Adeosun Faison
2409	Jack Thibeau
2410	Donna Murphy
2411	Bess Armstrong
2412	Judy Garland
2413	Beno&#238;t Poelvoorde
2414	Dharmendra
2415	Donna Reed
2416	Dorian Harewood
2417	Dorsey Wright
2418	Douglas Aarniokoski
2419	Ben Younger
2420	Jim Gillespie (I)
2421	Bernie Worrell
2422	Brian Glover (I)
2423	John Schultz (I)
2424	John R. Leonetti
2425	David S. Ward
2426	James Wong (IV)
2427	Brian Helgeland
2428	Brian Kerwin
2429	James Toback
2430	Jamie Blanks
2431	Brian Gilbert
2432	Brian G. Hutton
2433	David Swift (II)
2434	Brian Desmond Hurst
2435	David Wayne (I)
2436	Bob Geldof
2437	James Van Der Beek
2438	Jane Curtin
2439	Eduardo Noriega (II)
2440	Brigitte Lin
2441	Janni Brenn-Lowen
2442	David Miller (II)
2443	Jane Powell (III)
2444	John Patrick Shanley
2445	David Mirkin (I)
2446	James Robinson (II)
2447	David Nutter
2448	John N. Smith
2449	Brian Narelle
2450	Jane Birkin
2451	Jan Kounen
2452	John Pasquin
2453	Brian Robbins (I)
2454	Denys Arcand
2455	Brett Leonard
2456	Jojo Marr
2457	James Farentino
2458	Bodil J&#248;rgensen
2459	Bobby Farrelly
2460	James Franciscus
2461	Bob Spiers
2462	James Frawley
2463	Deran Sarafian
2464	Bob Saget
2465	James Donald (I)
2466	Des McAnuff
2467	Bob Rafelson
2468	Desmond Davis (I)
2469	James Eckhouse
2470	James Olson
2471	Debbie Harry
2472	Brenda Chapman
2473	John Sturges
2474	John Swanbeck
2475	Debbie Reynolds
2476	Dennis Dun
2477	Bradford Dillman
2478	David McNally (II)
2479	James Merendino
2480	Brad Bird
2481	Deborah Theaker
2482	Dennis Boutsikaris
2483	Boris Sagal
2484	Boris Karloff
2485	Brandon Lee
2486	Olivia de Havilland
2487	Linda Kozlowski
2488	Orlando Jones
2489	Sally Potter
2490	Ono Fleischer
2491	Robert Iscove
2492	Marshall Herskovitz
2493	Robert Harmon (I)
2494	T&#233;a Leoni
2495	Sam Bottoms
2496	Oliver Robins
2497	Victoria Jackson (I)
2498	Marlon Wayans
2499	Oleg Menshikov
2500	Vincent Ward
2501	Marleen Gorris
2502	Robert Kurtzman
2503	Nigel Cole
2504	Paige Turco
2505	Vincent Gardenia
2506	Mark McKinney (I)
2507	Mark Patton
2508	Paige O'Hara
2509	Sean S. Cunningham
2510	Mark S. Waters
2511	Mark Watson (II)
2512	Mark Steven Johnson
2513	Richard Franklin
2514	Mark Stewart (I)
2515	Mark Tarlov
2516	Robert Joy (I)
2517	Robert Greenwald
2518	Mark Rydell
2519	Nigel Terry
2520	Marvin Chatinover
2521	Robert Donat
2522	Nikolaj Coster-Waldau
2523	Mary Costa
2524	Tanya Roberts
2525	Victoria Abril
2526	Richard Loncraine
2527	Vernon Wells
2528	Tarsem Singh
2529	Robert Crumb
2530	Nigel Havers
2531	Mary Harron
2532	Sam Wood
2533	Rena Owen
2534	Nikolai Grinko
2535	Norbert Auerbach
2536	Takeshi Kaneshiro
2537	Talisa Soto
2538	Victor Sj&#246;str&#246;m
2539	Martin Campbell
2540	Victor Salva
2541	Victor Nunez
2542	Sam Mendes
2543	Tamara Jenkins
2544	Marv Newland
2545	Nomadlozi Kubheka
2546	Vicki Lewis
2547	Noah Hathaway
2548	Marty Feldman
2549	Vic Morrow
2550	Sal Mineo
2551	Martin Rosen (I)
2552	Paul Auster
2553	Robert Strauss (I)
2554	Maria Bello
2555	Walter Pidgeon
2556	Paul Brickman
2557	Rupert Wainwright
2558	W.D. Richter
2559	Walter Levine
2560	Walter Salles
2561	Stuart Gordon
2562	Patrick Wymark
2563	Selma Blair
2564	W.S. Van Dyke
2565	Marilyn Burns
2566	Pamela Anderson
2567	Paul Bogart
2568	Wenche Foss
2569	Shari Albert
2570	Marc Rocco
2571	Steve James (II)
2572	Marc Singer
2573	Marcel Carn&#233;
2574	Steve Rash
2575	Steven Lisberger
2576	Paul Freeman (I)
2577	Steven Kloves
2578	Steven Baigelman (II)
2579	Margaret Sheridan
2580	Margaret Whitton
2581	Steven E. De Souza
2582	Robert Towne
2583	Mario Adorf
2584	Marcia Strassman
2585	Vincenzo Natali
2586	Robert Mulligan
2587	Michelangelo Antonioni
2588	Robert Moore (I)
2589	S&#246;nke Wortmann
2590	Robert Longo
2591	Patrick Macnee
2592	Mark Christopher
2593	Pat Proft
2594	S&#248;ren Kragh-Jacobsen
2595	Susanne Lothar
2596	Mark Herman (I)
2597	Vincente Minnelli
2598	Mark Illsley
2599	Paris Barclay
2600	Pascal Benezech
2601	Patricia Birch
2602	Patricia Wettig
2603	Sebastian Rice-Edwards
2604	Marion Mack
2605	Robert Rossen
2606	Richard Brooks (I)
2607	Sebastian Cabot
2608	Robert Oliveri
2609	Viveca Lindfors
2610	Pat O'Connor (I)
2611	Marius Weyers
2612	Patrice Leconte
2613	Patrice Ch&#233;reau
2614	Mark A.Z. Dipp&#233;
2615	Susan Seidelman
2616	Robert Cornthwaite
2617	Vivian Wu
2618	Rick Rosenthal
2619	Todd Phillips (I)
2620	Mike Mitchell (VI)
2621	Michael Goldenberg
2622	Sarah Miles (I)
2623	Rob Minkoff
2624	Michael Hordern
2625	Michael Haigney
2626	Michael Corrente
2627	Tom Ewell
2628	Mike Hodges (I)
2629	Michael Haneke
2630	Mike Gabriel
2631	Mikael Salomon
2632	Mia Sara
2633	Tom Dey
2634	Scott Kalvert
2635	Vera Miles
2636	Tuesday Knight
2637	Tsutomu Yamazaki
2638	Mitsuo Iwata
2639	Michael Bowen
2640	Mitchell Lichtenstein
2641	Troy Duffy
2642	Tinto Brass
2643	Milcho Manchevski
2644	Tod Browning
2645	Michael Cimino
2646	Mili Avital
2647	Todd Haynes
2648	Michael Constantine
2649	Tom Helmore
2650	Tsutomu Tatsumi
2651	Tony Bancroft
2652	Michael Pressman
2653	Tony Richardson (I)
2654	Michael Rennie
2655	Tony Randel
2656	Tammy Lauren
2657	Michael Hitchcock
2658	Tony Lo Bianco
2659	Michele Soavi
2660	Ringo Starr
2661	Tony Bill
2662	Tony Curtis
2663	Tony Kaye (I)
2664	Risa Bramon Garcia
2665	Michael Winterbottom
2666	Michel Piccoli
2667	Michael Moriarty
2668	Miguel Sandoval (I)
2669	Michael Jordan
2670	Tom Mankiewicz
2671	Michael Kirby
2672	Mieko Harada
2673	Rob Bowman (I)
2674	Savage Steve Holland
2675	Tom Stoppard
2676	Michael Patrick Jann
2677	Trace Beaulieu
2678	Michael Nouri
2679	Michael Oliver (I)
2680	Tommy Lee Wallace
2681	Michael Pataki
2682	Timothy Balme
2683	Riz Abbasi
2684	Nelson Shin
2685	Matt McCoy
2686	Matt Reeves
2687	Terry Ballard
2688	Matt Williams (II)
2689	Newt Arnold
2690	Val Guest
2691	Terry Hughes
2692	Ted Post
2693	Matthew Robbins (I)
2694	Maud Adams
2695	Terry Potter
2696	Terry Zwigoff
2697	Sean Chapman
2698	Michael Anderson (I)
2699	Matthew Bright
2700	Vanessa L. Williams
2701	Mary Lambert
2702	Taye Diggs
2703	Nick Metropolis
2704	Nick Gomez
2705	Mary Tyler Moore
2706	Robert Clouse
2707	Robert Butler (I)
2708	Robert Carradine
2709	Nicholas Rowe
2710	Masatoshi Nagase
2711	Sean Gullette
2712	Masayuki Suo
2713	Nicholas Webster
2714	Ted Neeley
2715	Neal Israel
2716	Nick Castle (I)
2717	Melvin Frank
2718	Tilda Swinton
2719	Melanie Brown (I)
2720	Muhammad Ali
2721	Tim Hill (III)
2722	Melissa Joan Hart
2723	Maureen O'Sullivan
2724	Montgomery Clift
2725	Scott Silver (I)
2726	Menahem Golan
2727	Tim Pope (I)
2728	Tyrone Power
2729	Rick Friedberg
2730	Sara Gilbert (I)
2731	Tushka Bergen
2732	Morris Day
2733	Scott Weinger
2734	Ulu Grosbard
2735	Ulrich Edel
2736	Natasha Richardson
2737	Max Pomeranc
2738	Samy Naceri
2739	Maxine Bahns
2740	Mel Stuart
2741	Natalya Bondarchuk
2742	Mekhi Phifer
2743	Thomas Carter (II)
2744	Thomas Jay Ryan
2745	Thomas Schlamme
2746	Naomi Watts
2747	Nancy Meyers
2748	Robert Morley (I)
2749	Robert Arkins
2750	Poppy Montgomery
2751	Wilhelmenia Fernandez
2752	Roger Vadim
2753	Youki Kudoh
2754	Peter Bonerz
2755	Shekhar Kapur
2756	Roger Miller
2757	Peter Cattaneo
2758	Rod Daniel
2759	Ronald Neame
2760	Roger Michell
2761	Ronald F. Maxwell
2762	Peter Collinson
2763	William Malone
2764	Rossy de Palma
2765	Roger Kumble
2766	Polly Bergen
2767	Lynn Whitfield
2768	Rod Lurie
2769	Ross Malinger
2770	Peter Chelsom
2771	Percy Adlon
2772	Liz Gilles
2773	Magali No&#235;l
2774	Sinbad
2775	Stephen Kessler
2776	Roy Ward Baker
2777	Willard Carroll
2778	Lochlyn Munro
2779	Willard Huyck
2780	Prince
2781	Yves Montand
2782	Lothaire Bluteau
2783	R&#233;my Belvaux
2784	Stephen Daldry
2785	R&#233;gis Wargnier
2786	Lonny Chapman
2787	Randa Haines
2788	Stephen Barker Turner
2789	William Finley (I)
2790	Lori Cardille
2791	Willeke van Ammelrooy
2792	Peter Lorre
2793	Peter Hewitt (I)
2794	Stacy Peralta
2795	Luis Mandoki
2796	Luis Barzaga
2797	Rodman Flender
2798	Rory Cochrane
2799	Ray Milland
2800	Y&#244;ji Matsuda
2801	Lynn Redgrave
2802	Peter Lord (I)
2803	Lukas Moodysson
2804	Peter MacDonald
2805	Spiros Foc&#225;s
2806	Roger Christian
2807	Phil Joanou
2808	Peyton Reed
2809	Peter R. Hunt (I)
2810	Peter O'Fallon
2811	Sophia Loren
2812	Luigi Pistilli
2813	Lou Reed
2814	William Gates
2815	Solomon Perel
2816	Rebecca Pidgeon
2817	Stanley Swerdlow
2818	Ronee Blakley
2819	Lou Adler
2820	Sondra Locke
2821	Pierre Batcheff
2822	Peter H. Hunt
2823	Peter Faiman
2824	Ronny Yu
2825	Peter Farrelly
2826	Peter Firth
2827	Roddy Piper
2828	Philippe Noiret
2829	Stan Dragoti
2830	Yimou Zhang
2831	Peter Friedman (I)
2832	Raymond Massey (I)
2833	Stefan Schwartz
2834	Shelley Winters
2835	Zbigniew Zamachowski
2836	Zack Norman
2837	Lisanne Falk
2838	Sidney J. Furie
2839	Lisa Blount
2840	Ram&#243;n Men&#233;ndez (I)
2841	Rachel Weisz
2842	Stephen Surjik
2843	Zachary David Cope
2844	Lisa Banes
2845	Yvette Mimieux
2846	Ron Fricke
2847	Steve Gordon (I)
2848	Ramesh Sippy
2849	Ralph Bakshi
2850	Yvonne Furneaux
2851	Ron Moody
2852	Reginald Hudlin
2853	Steve Carr (III)
2854	Zakes Mokae
2855	Paul McCartney
2856	Ralph Macchio
2857	Whit Stillman
2858	Siem Vroom
2859	Paul Weitz
2860	Paul Weiland
2861	Stephen Norrington
2862	Paul Williams (III)
2863	Robin Hardy
2864	Lisa Gay Hamilton
2865	Linden Ashby
2866	Rachel True
2867	Lisa Cholodenko
2868	Rand Ravich
2869	Lisa Boyle
2870	Lindsay Lohan
2871	Mar&#237;a Barranco
2872	Walter Gotell
2873	Dana Ivey
2874	Mark Margolis
2875	Larry Hankin
2876	Kevin Tighe
2877	Mark Boone Junior
2878	Robert Picardo
2879	Richard Portnow
2880	Norman Burton
2881	Kenny Baker (I)
2882	Jason Flemyng
2883	Ian Wolfe
2884	Dennis Burkley
2885	Danielle Harris
2886	Robin Bartlett
2887	Jonathan Banks
2888	Vincent Schiavelli
2889	Don Calfa
2890	J.C. Quinn
2891	Richard Bright
2892	Scott Paulin
2893	Troy Evans
2894	Scatman Crothers
2895	Conchata Ferrell
2896	John Capodice
2897	Beatrice Winde
2898	Brian Tarantina
2899	Andy Romano
2900	Amy Wright
2901	Ron Dean
2902	Connie Ray
2903	Linda Harrison
2904	Phyllida Law
2905	Brock Peters
2906	Lyle Lovett
2907	Gene Canfield
2908	Steven Hill (I)
2909	James Saito
2910	Matt Malloy (I)
2911	Jay O. Sanders
2912	Geoffrey Palmer
2913	Fred Willard
2914	Lee Tergesen
2915	Philip Stone (I)
2916	Elizabeth Lawrence
2917	Jared Harris
2918	Graham Stark
2919	Victor Garber
2920	Buck Henry
2921	Bruce Mahler
2922	Robert Miranda
2923	Lin Shaye
2924	Tony Plana
2925	Martin Ferrero
2926	Dick Van Patten
2927	Steve Kahan
2928	Earl Boen
2929	Clive Merrison
2930	Debra Monk
2931	Tzi Ma
2932	Mercedes Ruehl
2933	Kathleen Freeman (I)
2934	Stephanie Faracy
2935	Ewen Bremner
2936	Bo Hopkins
2937	Alfred Molina
2938	Patrick Van Horn
2939	Leonard Rossiter
2940	Stephen Spinella
2941	Catherine Keener
2942	John Finn
2943	Michael Kitchen
2944	George Wyner
2945	Diane Ladd
2946	Tsai Chin (I)
2947	Stephen Root
2948	Daniel Baldwin
2949	Gerry Becker
2950	Sheb Wooley
2951	Susan Barnes
2952	Gerry Bamman
2953	Mena Suvari
2954	Robin Thomas (I)
2955	Chick Ortega
2956	Dinah Manoff
2957	John Fiedler (I)
2958	Michael Richards
2959	Ciar&#225;n Hinds
2960	Matt Ross (I)
2961	Dick O'Neill
2962	Jerry Levine
2963	Janet Carroll
2964	Terry Alexander (I)
2965	Jennifer Esposito
2966	Dominic West
2967	Jenny Wright
2968	Leonardo Cimino
2969	Valri Bromfield
2970	R.G. Armstrong
2971	Ralph Brown (I)
2972	George DiCenzo
2973	Leopoldo Trieste
2974	Blair Brown
2975	Rick Overton
2976	Scarlett Johansson
2977	Ray McAnally
2978	Matt Adler
2979	Jim Breuer
2980	Michael A. Goorjian
2981	David Andrews (I)
2982	Esther Rolle
2983	Barbara Barrie
2984	John Lynch
2985	Michael Murphy (I)
2986	Clifton James
2987	Don Lake
2988	Michael Lombard
2989	Graham Beckel
2990	Joe Viterelli
2991	Siobhan Fallon
2992	Claire Forlani
2993	Bill McCutcheon
2994	Tom Wood (II)
2995	John Michael Higgins
2996	Bill Paterson (I)
2997	Polly Holliday
2998	Philippe Morier-Genoud
2999	Evelyn Keyes
3000	George Grizzard
3001	Danny Mann (I)
3002	Soon-Tek Oh
3003	Meat Loaf
3004	Janet Margolin
3005	Arthur O'Connell
3006	John Ratzenberger
3007	Randall Batinkoff
3008	Lolita Davidovich
3009	Tim Kazurinsky
3010	Morris Chestnut
3011	Aeryk Egan
3012	Portia de Rossi
3013	Barbara Harris
3014	Robert A. Silverman
3015	Jason Bernard (I)
3016	Barret Oliver
3017	Harve Presnell
3018	Peter Greene (I)
3019	Gary Riley (I)
3020	Harold Gould
3021	Marilyn Sokol
3022	Frank Welker
3023	Dwier Brown
3024	Dan Bell
3025	Marley Shelton
3026	Allan Rich (I)
3027	Robert Stanton (II)
3028	Renoly Santiago
3029	Gabrielle Union
3030	Kevin Dillon
3031	L.Q. Jones
3032	Paprika Steen
3033	Byron Mann
3034	Martin Mull
3035	Robert Goulet
3036	Harley Jane Kozak
3037	Denise Y. Dowse
3038	Richard Bradford (I)
3039	Henry Daniell
3040	Eddie Izzard
3041	Christian Clemenson
3042	Doug McGrath (I)
3043	Jada Pinkett
3044	Ingeborga Dapkunaite
3045	Alexander Godunov
3046	Gary Lewis (III)
3047	Peter Arne
3048	Henry Goodman
3049	Mark Lenard
3050	Daniel Benzali
3051	Malik Yoba
3052	Patrick Godfrey (I)
3053	Pat Roach
3054	Andrew Lowery
3055	Dan Shor
3056	Patti LuPone
3057	Rodney Eastman
3058	Susanna Thompson
3059	Dylan Bruno
3060	Ray McKinnon
3061	Stacy Edwards
3062	Amanda Wyss
3063	Maddie Corman
3064	Seann William Scott
3065	Alan North
3066	Heidi Schanz
3067	Paul McCrane
3068	Larry Joshua
3069	Chris Haywood
3070	Spencer Treat Clark
3071	Charles Fleischer
3072	Tamara Tunie
3073	Brooke Langton
3074	Lucas Black (II)
3075	Mark Holton
3076	Mary Mara
3077	Mare Winningham
3078	Jack Riley (II)
3079	Derrick O'Connor
3080	Nora Dunn
3081	Marc Duret
3082	Stephen Furst
3083	Jenny McCarthy
3084	Billy Green Bush
3085	Eugene Roche (I)
3086	Regina Taylor
3087	Mindy Sterling
3088	Patrick Labyorteaux
3089	Susan May Pratt
3090	Carrie Snodgress
3091	Pauly Shore
3092	Richard Brooks (II)
3093	J. Pat O'Malley
3094	Patricia Quinn (I)
3095	Ramon Bieri
3096	Stephen Lack
3097	Jack Angel (I)
3098	Susan Blakely
3099	Richard Chamberlain
3100	Carroll Baker
3101	Patric Knowles
3102	Chris Barnes (II)
3103	Jack Albertson
3104	Dan Hicks (I)
3105	Clive Russell
3106	Ian Richardson
3107	Hugh Marlowe
3108	Rae Dawn Chong
3109	Hilary Gordon
3110	Hugh Griffith (I)
3111	Paul Henreid
3112	Steve Rackman
3113	Ralph Strait
3114	Rik Mayall
3115	Hugh Quarshie
3116	Tone Loc
3117	Michelle Forbes
3118	G&#233;rard Darmon
3119	Jim Varney
3120	Hoagy Carmichael
3121	Renato Scarpa
3122	Ernie Dingo
3123	Ralph Carlsson
3124	Charley Grapewin
3125	Shannen Doherty
3126	Ralph Meeker
3127	Howard St. John
3128	Estelle Parsons
3129	Geraldine Fitzgerald
3130	Rachael Leigh Cook
3131	Scott Brady (I)
3132	Richard Basehart
3133	Clifton Collins Jr.
3134	Miguel Bos&#233;
3135	Jessica Alba
3136	Rhys Ifans
3137	Paulette Goddard
3138	Stephen Young (I)
3139	Paula Kelly (I)
3140	Mike Henry
3141	Sig Ruman
3142	Henry Rollins
3143	Henry Thomas
3144	Ian Abercrombie
3145	Estelle Getty
3146	Frederique Van Der Wal
3147	Jim Carter (I)
3148	Steven Bauer
3149	Scott Bakula
3150	Chad Everett
3151	Burt Kwouk
3152	Buzz Kilman
3153	Fernando Fern&#225;n G&#243;mez
3154	Gates McFadden
3155	Cindy Morgan
3156	Richard Roxburgh
3157	Stanislas Carr&#233; de Malberg
3158	Harcourt Williams
3159	Terry-Thomas
3160	Buddy Hackett
3161	James Gleason (I)
3162	Oded Fehr
3163	Daniel Gerroll
3164	Scott Wolf (I)
3165	Theodore Bikel
3166	Scott Wilson (I)
3167	Sean Pertwee
3168	Naveen Andrews
3169	Nathaniel Parker
3170	Gordon Clapp (I)
3171	T.K. Carter
3172	Harold Perrineau Jr.
3173	Perry Lopez
3174	Taliesin Jaffe
3175	Finlay Currie
3176	Sophie Lee
3177	Chuck Connors (I)
3178	Peter Mayhew (II)
3179	Nicol Williamson
3180	Daniel Wyllie
3181	Nigel Bruce
3182	Sheryl Lee Ralph
3183	Philip Davis (I)
3184	Fiona Lewis
3185	Noel Coward
3186	Jane Kaczmarek
3187	Natalie Trundy
3188	Stacey Dash
3189	Terrence Dashon Howard
3190	Raymond Burr
3191	Tantoo Cardinal
3192	Daniel Olbrychski
3193	Fran&#231;ois Chau
3194	Fernando Rey
3195	Richard Jaeckel
3196	Brian McNamara
3197	James Karen
3198	Srdjan Todorovic
3199	Queen Latifah
3200	Gloria Reuben
3201	Pamela Gidley
3202	Carla Gugino
3203	Suzanna Hamilton
3204	Paolo Bonacelli
3205	George Chakiris
3206	Randall 'Tex' Cobb
3207	Monica Evans
3208	Gary Dourdan
3209	Jackie Earle Haley
3210	Jack O'Halloran
3211	Jackie Gayle
3212	Timothy Dalton
3213	Hattie McDaniel
3214	Chris Owen (I)
3215	Carol Cleveland
3216	Heather Angel
3217	Susan Tyrrell
3218	Joan Chen
3219	Chris Klein
3220	R.D. Call
3221	Jennifer Elise Cox
3222	Park Overall
3223	Nancy Marchand
3224	Frances Fisher
3225	Peter Dobson
3226	Thomas Gibson (I)
3227	Brendan Gleeson
3228	Jean Hagen
3229	Stefania Casini
3230	Colin Friels
3231	Jean Louisa Kelly
3232	Richard T. Jones
3233	Moroni Olsen
3234	Peter Cushing
3235	Heather O'Rourke
3236	Clarence Felder
3237	Randy Brooks (I)
3238	Bradley Pierce
3239	Candy Clark
3240	Brad Sullivan
3241	Sofie Gr&#229;b&#248;l
3242	Jacqueline Obradors
3243	Dana Elcar
3244	Peter Bull (I)
3245	Suzanne Snyder
3246	Jake Lloyd (I)
3247	Marlene Dietrich
3248	Elizabeth Ashley
3249	Anna Quayle
3250	David Sheiner
3251	Vincent Spano
3252	Julian Glover
3253	David Schofield
3254	Sa&#239;d Taghmaoui
3255	Vince Vieluf
3256	Mark Feuerstein
3257	Joshua Rudoy
3258	Anthony Dawson (I)
3259	Martha Gehman
3260	Josephine Hull
3261	Anthony Higgins
3262	Marina Sirtis
3263	John de Lancie
3264	Marita Geraghty
3265	Justin Lazard
3266	Kate Mulgrew
3267	Melinda McGraw
3268	Ruth White (II)
3269	Robert Rusler
3270	Marisa Berenson
3271	Julie Bovasso
3272	Kari Wuhrer
3273	Sam Jaffe (I)
3274	David Yip
3275	Sarah Douglas (I)
3276	Robert Peters (I)
3277	John Castle (II)
3278	Mark Blankfield
3279	Julie Warner
3280	Andy Devine (I)
3281	John Mills (I)
3282	Victor Buono
3283	Matt Frewer
3284	Sammy Davis Jr.
3285	John Stockwell
3286	John Harkins
3287	Barbara Sukowa
3288	Arsin&#233;e Khanjian
3289	Arye Gross
3290	Robbie Coltrane
3291	B.B. King
3292	David Hunt (II)
3293	John McGiver (I)
3294	John Marshall Jones
3295	Meg Tilly
3296	Megan Cavanagh
3297	Valerie Chow
3298	Arliss Howard
3299	Anton Diffring
3300	David Moscow
3301	Barry Nelson (I)
3302	David Morrissey
3303	Michael Byrne
3304	Jonathan Stark
3305	Art Evans
3306	Jonathan Lipnicki
3307	Tracy Reed (I)
3308	Jon Bon Jovi
3309	Emmanuelle Seigner
3310	Jon Abrahams
3311	Mason Adams
3312	Michael Angarano
3313	Van Heflin
3314	Jonathan Rhys-Meyers
3315	Larry Drake
3316	Laurence Luckinbill
3317	Don Steele (I)
3318	Rosalind Cash
3319	Benny Hill
3320	Donald F. Muhich
3321	Larry Gilliard Jr.
3322	David Clennon
3323	Winston Chao
3324	Yancy Butler
3325	Larry B. Scott
3326	Donald O'Connor
3327	Lance Kinsey
3328	Rosario Dawson
3329	Luke Perry
3330	Kate Hudson
3331	Michael Patrick Carter
3332	Erik King
3333	Lisa Eilbacher
3334	Adam LaVorgna
3335	Joan Severance
3336	Yvonne De Carlo
3337	Roland Bertin
3338	Leo Rossi (II)
3339	Ritch Brinkley
3340	Joanna Going
3341	Laurence Mason
3342	Leo Burmester
3343	Lenore Banks
3344	Lee Strasberg
3345	Louis Calhern
3346	Lawrence Dane
3347	Rita Moreno
3348	William Sage
3349	Adrian Zmed
3350	John Amos (I)
3351	Debbi Morgan
3352	Kent Williams
3353	Amanda Peet
3354	Marcus Gilbert
3355	Eric Mabius
3356	Wayne Newton
3357	Michael Massee
3358	Eartha Kitt
3359	Wendy Hiller
3360	Margarita Lozano
3361	Ebbe Roe Smith
3362	Maria de Medeiros
3363	Maria Grazia Cucinotta
3364	Russell Wong
3365	Marian Seldes
3366	Margaret Dumont
3367	Alix Koromzay
3368	Roscoe Karns
3369	Roseanne
3370	Dorothy Malone
3371	Roxanne Hart
3372	Kirk Baltz
3373	William Devane
3374	Alyssa Milano
3375	Mae Questel
3376	Wendy Makkena
3377	Dwight Yoakam
3378	Allen Payne (I)
3379	Joe Turkel
3380	Dyan Cannon
3381	Kim Greist
3382	Jack Kehler
3383	Nicole Ari Parker
3384	Sy Richardson
3385	James Handy
3386	Scott Thomson (I)
3387	Kathleen Wilhoite
3388	Robert Ridgely
3389	Anna Levine (I)
3390	John Qualen
3391	Sab Shimono
3392	Lee Garlington
3393	George 'Buck' Flower
3394	Jos&#233; Z&#250;&#241;iga
3395	Leslie Stefanson
3396	Kurt Fuller
3397	Rudy Bond
3398	Barton Heyman
3399	Carmen Argenziano
3400	Raymond Cruz
3401	Nancy Fish
3402	Rosanna DeSoto
3403	Lynne Thigpen
3404	Courtney Love
3405	Holt McCallany
3406	Martin Clunes
3407	Jacob Vargas
3408	Michael Gaston
3409	Max Perlich
3410	Pepe Serna
3411	Gregory Sporleder
3412	Woodrow Parfrey
3413	Michael Higgins (I)
3414	Timothy Carhart
3415	Geoffrey Blake
3416	Jonathan Winters
3417	Edie Adams
3418	Sam McMurray
3419	Peter Brocco
3420	Alexa Vega
3421	Norman Reedus
3422	Reg E. Cathey
3423	Sheila Kelley (I)
3424	James Tolkan
3425	Sophie Marceau
3426	Alan Oppenheimer
3427	Ellen Albertini Dow
3428	Tommy Flanagan (I)
3429	Jamie Farr
3430	Jon Stewart
3431	Ben Wright (I)
3432	Bruce A. Young
3433	Archie Hahn
3434	Eve Arden
3435	Mary Kay Bergman
3436	Raynor Scheine
3437	Robert Costanzo
3438	Alida Valli
3439	Peter Dvorsky (I)
3440	Kimberly Scott
3441	Laraine Newman
3442	Steven Wright (I)
3443	Mink Stole
3444	Jack Murdock
3445	Todd Louiso
3446	Susan Traylor
3447	Rick Zumwalt
3448	Carolyn Jones (I)
3449	Paul Calderon
3450	Paul Herman
3451	J.K. Simmons
3452	Anna Deavere Smith
3453	Tom Heaton
3454	Richard C. Sarafian
3455	Andy Dick
3456	Vivica A. Fox
3457	Emily Mortimer
3458	Fred Asparagus
3459	Richard Boes
3460	Kate McGregor-Stewart
3461	John Beasley
3462	Milton Berle
3463	Denise Crosby
3464	Kim Robillard
3465	Chris Ellis (I)
3466	Art LaFleur
3467	Helen Shaver
3468	Stephen Pearlman
3469	Tobin Bell
3470	Charles Gray (I)
3471	Malcolm Danare
3472	O-Lan Jones
3473	Cherry Jones
3474	Anne Haney
3475	Wendy Schaal
3476	Chauncey Leopardi
3477	Gabriel Mann
3478	Anna Maria Horsford
3479	Charles Napier
3480	Charles McKeown
3481	Dub Taylor
3482	Claire Skinner (I)
3483	Arthur Malet
3484	Time Winters
3485	Jay Patterson (I)
3486	Gregg Berger
3487	Liam Dunn
3488	Maureen Teefy
3489	Simon MacCorkindale
3490	Lauren Tom
3491	Joanna Merlin
3492	Aida Turturro
3493	Lawrence Pressman
3494	Bernie Casey
3495	Thomas Kopache
3496	Lee McCain
3497	Beth Grant
3498	David Hemmings (I)
3499	John Putch
3500	Robert Beatty (I)
3501	Dimitra Arliss
3502	Ralph Waite
3503	Tyra Ferrell
3504	Leigh French
3505	George P. Wilbur
3506	Ron Jeremy
3507	Mandy Patinkin
3508	Deirdre O'Connell
3509	Kenneth Tobey
3510	Amanda Bearse
3511	Les Tremayne
3512	Amanda De Cadenet
3513	Howard Erskine
3514	Henry Victor
3515	Joey Slotnick
3516	Tom O'Brien (II)
3517	Ron Vawter
3518	Kevin O'Morrison
3519	David Bowe
3520	Dody Goodman
3521	Priscilla Pointer
3522	Marcel Iures
3523	Jihmi Kennedy
3524	Roger Wilson (I)
3525	Adrian Dunbar
3526	Tom Riis Farrell
3527	Curt Bois
3528	Gia Carides
3529	Loles Le&#243;n
3530	Estelle Harris
3531	Paul Geoffrey
3532	Cress Williams
3533	Horst Buchholz
3534	Estelle Winwood
3535	Roger Yuan
3536	Michael Williams (I)
3537	Deems Taylor
3538	Traci Lind
3539	Kenneth Welsh
3540	Claudia Christian
3541	Kerry Walker
3542	Michael McShane (I)
3543	Mickey Cottrell
3544	Deborah Harmon
3545	Rufus Thomas
3546	Paul Benjamin
3547	Ed Nelson (I)
3548	Maria Pitillo
3549	Zelda Rubinstein
3550	Paul Ben-Victor
3551	Raf Vallone
3552	George Raft
3553	Carole Shelley
3554	Linda Bassett
3555	Simon Jones (I)
3556	Dina Merrill
3557	Tracy Brooks Swope
3558	Linda Hart
3559	Patti D'Arbanville
3560	Ingrid Pitt
3561	George Macready
3562	Sully Boyar
3563	Patrick Malahide
3564	Robert Ryan
3565	Rob Campbell
3566	Irving Metzman
3567	Patrick Kilpatrick
3568	Ricardo Montalban
3569	Hugo Stanger
3570	Cynthia Rhodes
3571	Gerald R. Molen
3572	Paul Greco
3573	Gina Hecht
3574	Zack Duhame
3575	Wilfrid Hyde-White
3576	Amrish Puri
3577	Wendell Pierce
3578	Traci Lords
3579	Eric Lloyd
3580	Ron O'Neal
3581	Eszter Balint
3582	R.M. Haley
3583	Wayne Grace
3584	Lewis Fitz-Gerald
3585	Paul Dillon (I)
3586	Lewis Martin (I)
3587	Sarita Choudhury
3588	Kel Mitchell
3589	Anders Hove
3590	Maria Aitken
3591	Clifton Powell
3592	Daisuke Kat&#244; (I)
3593	Lisa Lu
3594	Greg Collins (II)
3595	Don Pedro Colley
3596	Willie Garson
3597	Gaylen Ross
3598	Sasha Jenson
3599	Michelle Meyrink
3600	Laila Robins
3601	Lacey Kohl
3602	Geoffrey Keen
3603	Stanley Brock
3604	Rod Mullinar
3605	Corey Burton
3606	Michel Galabru
3607	Akosua Busia
3608	Lupe Ontiveros
3609	Ricky Dean Logan
3610	Devin Ratray
3611	Bill Erwin (I)
3612	Lea Salonga
3613	Philippe Volter
3614	Leah Ayres
3615	Donovan Scott (I)
3616	Alison Doody
3617	Lumi Cavazos
3618	Michael Taliferro
3619	Ray Collins (I)
3620	Roger Ashton-Griffiths
3621	Michael Talbott
3622	Ray Charles (I)
3623	Laurel Cronin
3624	Rosalind Chao
3625	Jodi Long
3626	Christopher Meloni
3627	Gregory Smith (I)
3628	Donald Gibb
3629	Saveli Kramarov
3630	Guy Boyd
3631	Rodger Bumpass
3632	Lucille Bliss
3633	Derek de Lint
3634	Michael Reid MacKay
3635	Michelle Burke (I)
3636	Tony Sirico
3637	Larry Brandenburg
3638	Joe Flaherty (I)
3639	Michelan Sisti
3640	Rodney A. Grant
3641	Tomas Milian
3642	Peter Maloney (I)
3643	Ruben Santiago-Hudson
3644	Leelee Sobieski
3645	Alfie Bass
3646	Leib Lensky
3647	Diana Kent (I)
3648	Heidi Kling
3649	Joe Spinell
3650	Jill Clayburgh
3651	Kim Coates
3652	Lenny von Dohlen
3653	Corin Nemec
3654	Chip Zien
3655	Ernest Thesiger
3656	Garcelle Beauvais
3657	Skipp Sudduth
3658	Kieran Mulroney
3659	Gale Hansen
3660	William Katt
3661	Betty Lou Gerson
3662	Keye Luke
3663	Alison Folland
3664	Chester Conklin
3665	Kevin West
3666	Colin Blakely
3667	Red Buttons
3668	Kris Kristofferson
3669	Stuart Charno
3670	Phyllis Applegate
3671	Phyllis Logan
3672	Peter Capaldi
3673	Alex Rocco (I)
3674	Cory Buck
3675	Dexter Fletcher
3676	Mabel King
3677	Don Keefer
3678	Lee Ving
3679	Alexander Goodwin
3680	Lorraine Toussaint
3681	Macdonald Carey
3682	Douglas Spencer
3683	William Frankfather
3684	Bill Kerr (I)
3685	Roy Cooper
3686	Rockets Redglare
3687	Shirley Knight
3688	Ritchie Singer
3689	Chris Mulkey
3690	Jimmy Yuill
3691	Stephanie Roth
3692	James Nesbitt
3693	Thomas G. Waites
3694	Jacques Mathou
3695	Robert J. Steinmiller Jr.
3696	Jay Brazeau
3697	Sam Robards
3698	Bob Peck (I)
3699	Timothy Daly
3700	Dana Wynter
3701	Toby Huss
3702	Ellie Raab
3703	Brian Bedford
3704	Matt Winston
3705	Orson Bean
3706	Elizabeth Moody
3707	David Prowse
3708	Mark Webber (II)
3709	Elpidia Carrillo
3710	Anne Ramsey
3711	Robert Hy Gorman
3712	Taral Hicks
3713	Carl Anderson (II)
3714	Dana Wheeler-Nicholson
3715	Vincent Laresca
3716	Barry Otto
3717	John Dall
3718	Jacob Reynolds
3719	Arija Bareikis
3720	Jay Villiers
3721	B&#233;atrice Dalle
3722	Judy Greer
3723	John Trudell
3724	Matthew Faber
3725	Mark Phelan
3726	Dann Florek
3727	Jonathan Ke Quan
3728	Carel Struycken
3729	Cara Seymour
3730	Vincent Beck
3731	Brian Backer
3732	Richard Foronjy
3733	Sean Sullivan (I)
3734	John Doe (I)
3735	Bud Cort
3736	Tamala Jones
3737	Norman Fell
3738	Victor Jory (I)
3739	John Shrapnel
3740	Elisha Cook Jr.
3741	Jason Beghe
3742	Bryan Larkin
3743	T.E. Russell
3744	Tippi Hedren
3745	Bob Elliott (I)
3746	John Rothman
3747	Joseph Bologna
3748	Valente Rodriguez
3749	Fern Persons
3750	Mischa Barton
3751	Darwin Joston
3752	Daniel Hugh Kelly
3753	Valeri Nikolayev
3754	Robert Gossett
3755	Elisabeth Moss
3756	Jens Albinus
3757	Jason Lively
3758	Elina L&#246;wensohn
3759	Busta Rhymes
3760	Oliver Smith (I)
3761	Thelma Ritter
3762	Barry Primus
3763	Neva Patterson
3764	Brian McConnachie
3765	Mitchell Whitfield
3766	Victor Slezak
3767	John Ridgely
3768	Victor Spinetti
3769	James Madio
3770	Kathy Griffin
3771	Martin Benson
3772	Neil Patrick Harris
3773	Val&#233;rie Lemercier
3774	Minna Gombell
3775	Theresa Merritt
3776	Elizabeth Mitchell
3777	Mike Nussbaum
3778	Brenda Bakke
3779	Mary Louise Wilson
3780	Dean Jones (I)
3781	Jeep Swenson
3782	Richard Marcus
3783	J. Smith-Cameron
3784	Brownie McGhee
3785	Brandon Smith (I)
3786	Vanessa Williams (I)
3787	Marisol Nichols
3788	Barbara Baxley
3789	Fanny Ardant
3790	Nick Searcy
3791	Richard Tyson
3792	Edward Brophy
3793	John MacKay (I)
3794	James Sloyan
3795	Jeff Anderson (I)
3796	Michael Berryman
3797	Marisa Paredes
3798	Tim Blake Nelson
3799	Susan Anspach
3800	Isaach De Bankol&#233;
3801	John Benjamin Hickey
3802	Rick Aviles
3803	Patrick Fontana
3804	Patrick Field
3805	Darren Dalton
3806	Musetta Vander
3807	Jamie Foreman
3808	Jan Hooks
3809	Fortunio Bonanova
3810	Mel Winkler
3811	Johnny Williams (I)
3812	Richard Widmark
3813	Tristine Skyler
3814	Johnny Whitworth
3815	Timothy Olyphant
3816	Ted Ross (II)
3817	Susan Fleetwood
3818	Barbara Crampton
3819	Edwina Moore
3820	Jeremy Howard
3821	Richard Davalos
3822	Eileen Heckart
3823	Thomas Haden Church
3824	Monica Bellucci
3825	Frank Bruynbroek
3826	Pat Morita
3827	John Clive
3828	James Urbaniak
3829	Sage Stallone
3830	Dave Duffy
3831	Art Metrano
3832	Jeff Conaway
3833	Brad Beyer
3834	Ellen Hamilton Latzen
3835	Todd Field
3836	Kai Wulff
3837	Ryan Hurst
3838	Brent Briscoe
3839	Jackie Burroughs
3840	Emmanuel Xuereb
3841	Jean Simmons
3842	Robert Phalen
3843	Caroline Hunt
3844	Tim Holt
3845	K. Todd Freeman
3846	Vinnie Jones
3847	Barbara Babcock (I)
3848	Suzanne Krull
3849	Julie Brown (I)
3850	Michael Durrell
3851	Nickolas Grace
3852	Jean Marsh
3853	Balthazar Getty
3854	Thomas Rosales Jr.
3855	Sanjeev Kumar (I)
3856	Samm-Art Williams
3857	Conrad Veidt
3858	Scott Schwartz
3859	Constance Collier
3860	Daniel York
3861	Daniel Zacapa
3862	Desmond Askew
3863	Derrick Branche
3864	Constance Marie
3865	Connie Booth
3866	Connie Britton
3867	Daniela Bianchi
3868	Samia Shoaib
3869	Sandra Milo
3870	Diane Cilento
3871	Coleen Gray
3872	Diane Franklin
3873	Ronald Allen
3874	Danny Rosen (I)
3875	Cole Sprouse
3876	Shon Greenblatt
3877	Saverio Guerra
3878	Diane Salinger
3879	Sidney Blackmer
3880	Scott Sowers
3881	David Kelly (I)
3882	David Brisbin (I)
3883	Sandy Dennis
3884	Daragh Donnelly
3885	Ron Smerczak
3886	Darby Dougherty
3887	Daria Kalinina
3888	Dick Anthony Williams
3889	Sandra Prinsloo
3890	Dick Crockett
3891	Dario D'Ambrosi
3892	David Herman (I)
3893	Darlene Cates
3894	Ron Lester
3895	Dara Tomanovich
3896	Ronald Squire
3897	David Harris (I)
3898	Samuel Le Bihan
3899	Ronnie Corbett
3900	Shirley Eaton
3901	David Blair (V)
3902	Collin Wilcox Paxton
3903	Screamin' Jay Hawkins
3904	Danny Denzongpa
3905	Colleen Rennison
3906	Colleen Fitzpatrick (I)
3907	Colleen Dewhurst
3908	David Huffman (I)
3909	Samuele Amighetti
3910	Danny Lloyd
3911	Danny Elfman
3912	Scott Williamson
3913	Colin Firth
3914	Colin Clive
3915	Sandra Bernhard
3916	Sandy Nelson (II)
3917	David Johansen
3918	Diana Pe&#241;alver
3919	Diana Rigg
3920	Sandra Hess
3921	Danny Lee (I)
3922	Shirley Douglas
3923	Shirley Jones (I)
3924	David Buck
3925	Da Ying
3926	Declan Croghan
3927	Shani Wallis
3928	Dan O'Bannon
3929	Dan Moran (I)
3930	Declan Hannigan
3931	David Crawford (I)
3932	Dee McCaffrey
3933	Shane (II)
3934	David Bennent
3935	Seth Smith
3936	Debra Feuer
3937	Dan Marino
3938	Sharon Taylor (I)
3939	David Warrilow
3940	Shari Hall
3941	Daniel Okrent
3942	Cristi Conaway
3943	Sharon Tate
3944	Curd J&#252;rgens
3945	Sharon Farrell
3946	Cynthia Gibb
3947	Curtis Gates
3948	Seth Gilliam
3949	Dana Ashbrook
3950	David Forman (I)
3951	Sarah Berry (I)
3952	Dana Andrews
3953	Rufus Beck
3954	Shann Johnson
3955	David Gale (I)
3956	Seiji Miyaguchi
3957	Dan Lauria
3958	Damian Young
3959	Ruth Brown
3960	Ry Cooder
3961	Debby Bishop
3962	Sergio Castellitto
3963	Sarah Peirse
3964	Scott H. Reiniger
3965	Damon D'Oliveira
3966	Ruth Hussey
3967	David Della Rocco
3968	Sarah York
3969	Ruth Nelson
3970	Ruth Roman
3971	Sergio Bini Bustric
3972	Dale Grand
3973	David Dukes
3974	Rya Kihlstedt
3975	Rumer Willis
3976	Dawn Didawick
3977	Deborah Shelton
3978	Deborah Foreman (I)
3979	Dale Dye
3980	Shawn Andrews
3981	De'voreaux White
3982	Dean Jagger
3983	Dave Finnegan
3984	Scott Foley
3985	Sessue Hayakawa
3986	Dame May Whitty
3987	Daisuke Ryu
3988	Rosemary Murphy
3989	Dennis Akayama
3990	Dennis Rodman
3991	Sean Lawlor
3992	Corey Parker
3993	David Mendenhall
3994	Dennis Storh&#248;i
3995	Scott Neal
3996	Roscoe Ates
3997	David Conrad (I)
3998	Rossella Falk
3999	Corinne Clery
4000	Seizabur&#244; Kawazu
4001	Daniel London
4002	Sally Ann Howes
4003	Rosemary Clooney
4004	Daniel Richter (I)
4005	Sami Bouajila
4006	Sean Daniel
4007	Daniel Southern
4008	Daniel Shalikar
4009	Samantha Lavigne
4010	Daniel Pollock
4011	Sean Kearns
4012	Sara Kestelman
4013	Scott Benjaminson
4014	Denys Hawthorne
4015	Daniel Pr&#233;vost (I)
4016	Coral Browne
4017	Corbett Monica
4018	David McKnight
4019	Consuelo De Haviland
4020	Daniel Ades
4021	Roy Chiao
4022	Salvador Dal&#237;
4023	Sally Yeh (I)
4024	Sally Struthers
4025	Sally Kellerman
4026	Daniel Boulanger
4027	Craig Smith (I)
4028	Demian Slade
4029	Shea Fowler
4030	Rudy Basquez
4031	Delphine French
4032	Dana Stubblefield
4033	Del Henney
4034	Dana Hill (I)
4035	Sally Anne Newton
4036	Roy Dupuis
4037	Courtney Chase
4038	Scott Mosier
4039	David Naughton
4040	Sheila Agee
4041	Daniel Faraldo
4042	Craig Reay
4043	Courtney Thorne-Smith
4044	Rosalind Hammond
4045	Courtney White
4046	Denis Arndt
4047	Dave Austin
4048	Shecky Greene
4049	Craig Ferguson
4050	Sam Huntington
4051	Daniel Emilfork
4052	Vin&#237;cius de Oliveira
4053	Vincent Castellanos
4054	Victoria Sus
4055	Annie McEnroe
4056	Annie Golden
4057	Annie Corley
4058	Victoria Tennant
4059	Anny Nelsen
4060	Anne Reid
4061	Anthony Bushell
4062	Anne Marie McEvoy
4063	Anne Louise Hassing
4064	Anne Gaybis
4065	Anne Francis (I)
4066	Anne Brochet
4067	Andrew Knott
4068	Viggo Bentzon
4069	Antoine Basler
4070	Antonio Sabato Jr.
4071	Antonio Mendoza (II)
4072	Vernon Campbell
4073	Antonia San Juan
4074	Antonia Franceschi
4075	Antone DiLeo
4076	Annie Wu
4077	Vicellous Reon Shannon
4078	Anna-Maria Gherardi
4079	Victor Banerjee
4080	Victor Colicchio
4081	Anthony Portillo
4082	Victor McLaglen
4083	Victor Stiles
4084	Victoria Beckham
4085	Anton Rodgers
4086	Vivian Smallwood
4087	Anne Bartoletti
4088	Virginia Paris
4089	Virginie Ledoyen
4090	Virna Lisi
4091	Vivean Gray
4092	Ang&#233;lica Arag&#243;n
4093	Virginia Mayo
4094	Vivian Pickles
4095	Angeline Ball
4096	Vladimir Kulich
4097	Andrew Schofield
4098	Vladislav Dvorzhetsky
4099	Andrew Pang
4100	Vondie Curtis-Hall
4101	Tammy Grimes
4102	Viveca Dahl&#233;n
4103	Vinny Argiro
4104	Anna Gee Byrd
4105	Anna Friel
4106	Anna Falchi
4107	Anna Chlumsky
4108	Ann Suzuki
4109	Ann Robinson (I)
4110	Angela Winkler (I)
4111	Anita Pallenberg
4112	Arabella Field
4113	Anita Morris
4114	Anita Laurenzi
4115	Anita Ekberg
4116	Anita Bryant
4117	Angus MacInnes
4118	Virginia Christine
4119	Ann Doran
4120	Tung Thanh Tran
4121	Vera-Ellen
4122	Troels Lyby
4123	Basil Sydney
4124	Barton MacLane
4125	Barry Watson
4126	Truman Capote
4127	Beatrice Straight
4128	Barry Foster
4129	Trini Alvarado
4130	Barry Corbin
4131	Tyra Banks
4132	Barbara Stuart
4133	Barbara Stanwyck
4134	Barbara Magnolfi
4135	Barbara Luddy
4136	Barry Pearl
4137	Ben Hammer (I)
4138	Beno&#238;t R&#233;gent
4139	Benjamin Weir
4140	Toshie Negishi
4141	Bengt Ekerot
4142	Tracey Cherelle Jones
4143	Ben Shenkman (II)
4144	Beatie Edney
4145	Ben Miles
4146	Barbara Eda-Young
4147	Tracy Arnold
4148	Ben Duncan
4149	Ben Davidson
4150	Tracy Nelson
4151	Bembol Roco
4152	Traylor Howard
4153	Ben Piazza
4154	Armando Brancia
4155	Arthur Burghardt
4156	Arthur Agee
4157	Van Johnson
4158	Vance Johnson
4159	Arnold Lucy
4160	Arno Frisch
4161	Barbara Leigh-Hunt
4162	Vanna Urbino
4163	Ashleigh Aston Moore
4164	Veerle van Overloop
4165	Vera Farmiga
4166	Arlene Francis
4167	Ariana Richards
4168	Archie Panjabi
4169	Andrew Kevin Walker
4170	Armin Rohde
4171	Ayano Shiraishi
4172	Apollonia Kotero
4173	Barbara Carrera
4174	Barbara Bel Geddes
4175	Barbara Bach
4176	Ulf Pilgaard
4177	Ulla Jacobsson
4178	Valerie Hobson
4179	Azura Skye
4180	Valerie Harper
4181	Avner Eisenberg
4182	Avery Brooks
4183	Ulrich M&#252;he
4184	August Schellenberg
4185	Uta Hagen
4186	Asta Esper Andersen
4187	Barbara Gordon (II)
4188	B&#246;rje Ahlstedt
4189	Yasmine Bleeth
4190	Yoshiko Shinohara
4191	Wyatt Knight
4192	Alan Boyle (II)
4193	Alan Bates
4194	Alan Badel
4195	Y&#251;ko Tanaka
4196	Alan Hale
4197	Al Checco
4198	Alan Howard (I)
4199	Akim Tamiroff
4200	Akiko Wakabayashi
4201	Akihiro Miwa
4202	Akemi Yamaguchi
4203	Yoshi Oida
4204	Andrew Lauer
4205	Al Fann
4206	Wilt Chamberlain
4207	Albert R&#233;my
4208	William Snape
4209	William Sylvester
4210	William Vail
4211	Alan Young (I)
4212	Alan Vint
4213	Alan Cox
4214	Willie Nelson
4215	Ahna Capri
4216	Alan Randolph Scott
4217	Wladyslaw Kowalski
4218	Wolfgang Heinz
4219	Wolfgang Lukschy
4220	Wolfgang Preiss
4221	Wood Harris
4222	Alan Stock
4223	Aaron Michael Metchik
4224	Aitana S&#225;nchez-Gij&#243;n
4225	Adam LeFevre
4226	Adam Garcia
4227	Adam Bryant
4228	Zara Turner
4229	Ada Carrasco
4230	Adam Storke
4231	Abdel Ahmed Ghili
4232	Addison Powell
4233	Zeppo Marx
4234	Aaliyah
4235	A.J. Langer
4236	Zhang Ziyi
4237	Zitto Kazann
4238	&#201;lisabeth Bourgine
4239	Abraham Benrubi
4240	Adrian Rawlins
4241	Yoshio Inaba
4242	Agnes Moorehead
4243	Agga Olsen
4244	Agatha Hurle
4245	Yu Tokui
4246	Yu-Wen Wang
4247	Yvonne Elliman
4248	Yuriko Ishida
4249	Alec Cawthorne
4250	Yusaku Matsuda
4251	Adrian Lester
4252	Adrian Grenier
4253	Adolphe Menjou
4254	Adolfo Celi
4255	Adewale Akinnuoye-Agbaje
4256	Yuri Petrov
4257	Wendie Jo Sperber
4258	Aldo Giuffr&#232;
4259	Wayne Morris (I)
4260	Wendell Corey
4261	Amy Brooks
4262	Amitabh Bachchan
4263	Amie Carey
4264	Warren Stevens (I)
4265	Amber Benson
4266	Anatoli Davydov
4267	Amanda Peterson
4268	Wendy Benson
4269	Wendy Gazelle
4270	Allison Gompf
4271	Wendy Nottingham
4272	Allen Joseph
4273	Ami Almendral
4274	Walter Huston
4275	Andrew Fullerton
4276	Wah Yuen
4277	Wallace Wood
4278	Walter Catlett
4279	Andrew Cassese
4280	Andrew Broder
4281	Warwick Davis
4282	Andres Aybar
4283	Allan Jones
4284	Andrea Eckert
4285	Andras Jones
4286	Andr&#233;as Voutsinas
4287	Andr&#233; Oumansky
4288	Andr&#233; Dussollier
4289	Anders W. Berthelsen
4290	Walter Connolly
4291	William Prince
4292	Alex Rafalowicz
4293	William Hope
4294	Alex Jennings
4295	Alex Datcher
4296	William McNamara
4297	William O'Leary (I)
4298	Allen Danziger
4299	Aleksandr Baluyev
4300	Alex Weir
4301	William R. Moses
4302	Alejandro Rey
4303	William Ragsdale
4304	William Redfield
4305	William Richert
4306	Tony Leung Chiu Wai
4307	Alessandro Nivola
4308	Alicia Goranson
4309	Aldo Silvani (I)
4310	Whitney Houston
4311	Whittni Wright
4312	Alison Whelan
4313	Alison Price
4314	Wilfrid Brambell
4315	Alex Scott (II)
4316	Will Lyman
4317	Alex Vincent
4318	Willard E. Pugh
4319	William B. Davis (I)
4320	Alexis Cruz
4321	Alexandra Wilson
4322	Alexandra Vandernoot
4323	Alexander Granach
4324	Wes Bentley
4325	Aline Kominsky
4326	Steve Huison
4327	Steve O'Donnell (I)
4328	Chazz Domingueza
4329	Steve Forrest
4330	Charlotte V&#233;ry
4331	Steve Gevedon
4332	Charlotte Lewis
4333	Stephi Lineburg
4334	Charlie Yeung
4335	Chen Chang
4336	Charlie Hofheimer
4337	Charles Vanel
4338	Charles Tyner
4339	Charles Smith (V)
4340	Charles Ruggles
4341	Bernard Giraudeau
4342	Steve Harris (I)
4343	Chien-lien Wu
4344	Stephen Boyd
4345	Stephen D. Newman
4346	Chris Lemmon
4347	Stephen Dorff
4348	Stephen Elliott (I)
4349	Stephen Garlick
4350	Steve Brown (IX)
4351	Chintara Sukapatana
4352	Charles Kay
4353	Chief Dan George
4354	Chiara Mastroianni
4355	Chete Lera
4356	Cheryl Pollak
4357	Cheryl Ladd
4358	Stephen Tompkinson
4359	Stephen Geoffreys
4360	Catherine Mary Stewart
4361	Charles Powell
4362	Cathy O'Donnell (I)
4363	Su Cruickshank
4364	Cathleen Nesbitt
4365	Sukie Smith
4366	Catherine Wilkening
4367	Catlin Adams
4368	Suli McCullough
4369	Stuart Townsend
4370	Sunny Johnson
4371	Catharine Bolz
4372	Cate Bauer
4373	Casey Boersma
4374	Susan Blu
4375	Susan Burgess
4376	Catherine Schell
4377	Charles 'Bud' Tingwell
4378	Charles Haid
4379	Steve Van Wormer
4380	Charles Drake
4381	Charles Does
4382	Steven Ford
4383	Charles Crumb
4384	Stubby Kaye
4385	Steven Scales
4386	Chris Spencer
4387	Chaim Jeraffi
4388	Chad Donella
4389	Celeste Holm
4390	Cecillia Stark
4391	Sting
4392	Cecil Parker (I)
4393	Charles Champlin
4394	Claire Benedict
4395	Stephanie Simon
4396	Soia Lira
4397	Solo
4398	Claire Rushbrook
4399	Claire Maurier
4400	Claire Du Brey
4401	Clarence Kolb
4402	Sonia Braga
4403	Slim Summerville
4404	Cl&#233;mentine C&#233;lari&#233;
4405	Cinqu&#233; Lee
4406	Sonia Todd
4407	Cindy Crawford
4408	Ciccio Ingrassia
4409	Ciaran Owens
4410	Claire Cox
4411	Cleavant Derricks
4412	Simon Oakland
4413	Cliff Potts
4414	Simon Shepherd
4415	Cliff Edwards
4416	Simone Griffeth
4417	Simone Mareuil
4418	Clare Kramer
4419	Sin&#233;ad Cusack
4420	Chuck Pfeiffer
4421	Clayton Rohner
4422	Claudine Longet
4423	Claudine Auger
4424	Claudette Colbert
4425	Skinny Puppy
4426	Slavko Stimac
4427	Clelia Matania
4428	Stefan H&#246;rberg
4429	Christine Kaufmann
4430	Christine Hargreaves
4431	Christine Dunford
4432	Stanley DeSantis
4433	Stanley Holloway
4434	Stanley Lawrence
4435	Chus Lampreave
4436	Stefan Clapczynski
4437	Stan Alexander
4438	Stella Keitel
4439	Christian Campbell (I)
4440	Christian Bujeau
4441	Stephan Hockey
4442	Stephanie Farrow
4443	Susan Lynch
4444	Christina Carlwind
4445	Christopher Rozycki
4446	Stephanie Sawyer
4447	Sonny Landham
4448	Chuck Montgomery (I)
4449	Chuck Bush
4450	Chu Kong
4451	Sonny Tufts
4452	Christopher Atkins
4453	Christopher St. John
4454	Christopher Bauer
4455	Sophie Ward
4456	Christopher J. Keene
4457	Christopher Hewett
4458	Christopher Eigeman
4459	Stacy Nelkin
4460	Christopher Castile
4461	Sonja Smits
4462	Christopher Villiers
4463	Bobby Joe McFadden
4464	Thaao Penghlis
4465	Bradley Gregg
4466	Thuy An Luu
4467	Tim Davis
4468	Brad Johnson (II)
4469	Brad Greenquist
4470	Brandon De Wilde
4471	Bonnie Bartlett
4472	Brandon Hammond
4473	Bobby Di Cicco
4474	Timothy Jerome
4475	Tina Caspary
4476	Bob Newhart
4477	Tina Majorino
4478	Bob Griffin (II)
4479	Tim Robertson
4480	Brenda De Banzie
4481	Susan George
4482	Brian Cesak
4483	Thomas Antoni
4484	Thomas Bo Larsen
4485	Brett Harrelson
4486	Thomas Ian Griffith
4487	Thor Bishopric
4488	Brenda Kendall
4489	Bob Bingham
4490	Breffni McKenna
4491	Brawley Nolte
4492	Branka Katic
4493	Brandy Norwood
4494	Brandon Merrill
4495	Thomas Wilson Brown
4496	Brendan Deary
4497	Tony Britton
4498	Tommy Bone
4499	Tommy Luske
4500	Bill Barretta
4501	Tommy Rall
4502	Beulah Garrick
4503	Beulah Bondi
4504	Tiny Sandford
4505	Betty Kennedy (I)
4506	Tomislav Maretic
4507	Betsy Baker
4508	Beth Ehlers
4509	Tony Haygarth
4510	Bert Lahr
4511	Bernie Coulson
4512	Sieghardt Rupp
4513	Tony Beckley
4514	Tom Keene
4515	Tetsuro Tamba
4516	Todd Graff
4517	Birthe Neumann
4518	Tom Aldredge
4519	Tom Davis (I)
4520	Billy Gray (I)
4521	Bill Cosby
4522	Billy Burke (I)
4523	Tommaso Puntelli
4524	Billy Bletcher
4525	Bille Brown
4526	Tom Murray (I)
4527	Bill Smitrovich
4528	Bill Shirley
4529	Tom Towles
4530	Bob Dishy
4531	Tom Felton
4532	Calista Flockhart
4533	Theresa Russell
4534	Candice Bergen
4535	Candela Pe&#241;a
4536	Sylvia Chang
4537	Cameron Dye
4538	Sylvia Miles
4539	Capucine
4540	Calvin Green
4541	Carey Lowell
4542	Cal Kuniholm
4543	Cab Calloway
4544	T.J. Cross
4545	T.J. Lowther
4546	T.P. McKenna
4547	Buddy Ebsen
4548	Calvin Levels
4549	Susan Ursitti
4550	Tony Llewellyn-Jones
4551	Carrie Nye
4552	Carrie Henn
4553	Carolyn McCormick
4554	Carolyn Choa
4555	Caroline Munro
4556	Syed Alwi
4557	Carole Bouquet
4558	Tami Stronach
4559	Carol Lynley
4560	Susie Bright
4561	Carlos Montalb&#225;n (I)
4562	Suzanne Pleshette
4563	Sy Kramer
4564	Carl Anthony
4565	Caroline Kava
4566	Terry Camilleri
4567	Britt Ekland
4568	Terence Alexander (I)
4569	Brigitte Catillon
4570	Teresa Ann Savoy
4571	Teri McMinn
4572	Brid Brennan
4573	Bryna Weiss
4574	Brian Tochi
4575	Taylor Negron
4576	Brian Murray (I)
4577	Brian McElroy (I)
4578	Terry Kiser
4579	Terry O'Neill
4580	Teru Shimada
4581	Tessh&#244; Genda
4582	Brian Tyler (II)
4583	Bruce Boxleitner
4584	Carroll O'Connor
4585	Tamiyo Kusakari
4586	Bruce Ramsay
4587	Richard Grove
4588	Bruce Payne (I)
4589	Tania Mallet
4590	Bronson Dudley
4591	Taungaroa Emile
4592	Ted Knight
4593	Tawny Kitaen
4594	Bruce Bennett
4595	Bruce Altman
4596	Bruce Abbott
4597	Brother Paul Bagget
4598	Taylor Momsen
4599	Bryan Batt
4600	Tara Morice
4601	Jinpachi Nezu
4602	Michael Wren
4603	Michel Auclair
4604	Joan Crawford
4605	Michel Blanc
4606	Joachim Kr&#243;l
4607	Joachim Cooder
4608	Jo Van Fleet
4609	Jim King (IV)
4610	Jo Ann Havrilla
4611	Joanna Pettet
4612	Jimmy Somerville
4613	Jimmy Ortega
4614	Jimmy Nail
4615	Jimmy Dean
4616	Jimmy Blanche
4617	Jim Robinson (I)
4618	Jeremy Foley
4619	Jo Prestia
4620	Joe Dorsey
4621	Johann Carlo
4622	Michael Learned
4623	Michael Legge (II)
4624	Joely Fisher
4625	Joe Saunders
4626	Joe Piscopo
4627	Joe Nipote
4628	Joan Shawlee
4629	Michael Ontkean
4630	Joanna Lumley
4631	Joe Breen (I)
4632	Michael Rees Davis
4633	Michael Schoeffling
4634	Michael T. Weiss
4635	Michael Thys
4636	Joanne Dru
4637	Joanne DiMauro
4638	Jim Kelly (II)
4639	Michael O'Keefe
4640	Jerry Colonna
4641	Jesper Asholt
4642	Jerzy Stuhr
4643	Jerzy Kosinski
4644	Mike Epps
4645	Mike Minett
4646	Jerry Mathers
4647	Jerry Lewis
4648	Michele Abrams
4649	Jerry Grayson
4650	Jesse Vint
4651	Jeremy Spenser
4652	Jeremy Slate
4653	Mike Vitar
4654	Miki Lee
4655	Mildred Dunnock
4656	Jeremy Kemp
4657	Mathias Rust (I)
4658	Jerry Lacy
4659	Jill St. John
4660	Michelle Ferre
4661	Jim Gallagher (I)
4662	Jim Farley (I)
4663	Michelle Kennedy
4664	Michelle Reis
4665	Michelle Trachtenberg
4666	Mick Jagger
4667	Jesse Howell
4668	Mick Lally
4669	Jesse Lee
4670	Jill Eikenberry
4671	Mickey Knox
4672	Jessie Robins
4673	Jessie Keosian
4674	Mie Hama
4675	Jessica Brooks Grant
4676	Jessica Biel
4677	John Alderton
4678	Jim Backus
4679	Meg Foster
4680	John Omirah Miluwi
4681	Maxon Crumb
4682	May Chin
4683	Maynard Eziashi
4684	John Megna
4685	Meagan Good
4686	John McLiam
4687	Johanna ter Steege
4688	Meera Syal
4689	John Payne (I)
4690	Megan Dodds
4691	John Louie
4692	John Lone
4693	Mel Gorham
4694	John Le Mesurier
4695	John Larch
4696	Melanie Chisholm
4697	John Matthews (II)
4698	Matthew Marsh
4699	P.J. Johnson
4700	Mathilda May
4701	John Waters (III)
4702	Matt Mulhern
4703	John Tormey
4704	John Thaw
4705	John Terry (I)
4706	Maurice Woods (I)
4707	Matthew Glave
4708	John Paul Pitoc
4709	Matthew Pidgeon
4710	John Russell (I)
4711	Maureen Lipman
4712	Maurice Page
4713	John Posey
4714	John Polson
4715	John Phillip Law
4716	John Ireland
4717	John Steiner (I)
4718	John Buckwalter
4719	Melanie Mayron
4720	Michael Chance (I)
4721	Michael Chekhov
4722	John Cullum (I)
4723	Michael Clark (I)
4724	Michael Dean Jacobs
4725	Michael DeLuise
4726	John Doolittle
4727	Michael Graham Cox
4728	Michael C. Williams
4729	Michael Gross (I)
4730	John Brady (II)
4731	John Bott
4732	John Bennett Perry
4733	John Bennett (I)
4734	John Bedford Lloyd
4735	Michael J. Nelson
4736	Millard Mitchell
4737	Michael Forest
4738	Mervyn Johns
4739	Johanne-Marie Tremblay
4740	Melody Anderson
4741	Melville Cooper
4742	John Howard (II)
4743	John Howard (I)
4744	Melvyn Douglas
4745	John Haymes Newton
4746	Michael Carmine (II)
4747	Merritt Nelson
4748	John Kani
4749	John Gottowt
4750	Mia Cottet
4751	Michael Aherne
4752	John Furey
4753	John Fraser (I)
4754	Michael Bell (I)
4755	John Farley
4756	John Emery (I)
4757	Merritt Butrick
4758	Nick Stahl
4759	Jamie Ren&#233;e Smith
4760	Nick Corri
4761	Jamie Draven
4762	Jamie Bell
4763	Jamie Alexis
4764	Jami Gertz
4765	Jameson Thomas
4766	James McCaffrey
4767	Nick Stabile
4768	Jan Hockey
4769	Nick Sutton
4770	Nigel Davenport
4771	James Robertson Justice
4772	Nigel Ivy
4773	James Read (II)
4774	James R. Young
4775	Miles Dougal
4776	Jameson Parker
4777	Nicholas Campbell
4778	Janusz Gajos
4779	Janine Turner
4780	Janet Jackson
4781	Jane Withers
4782	Jane Seymour
4783	Jane March
4784	Jane Leeves
4785	Nick Apollo Forte
4786	Jane Hallaren
4787	Nicholle Tom
4788	Jane Darwell
4789	Nicholas Clay (I)
4790	Nicholas Colasanto (I)
4791	Jane Alexander
4792	Nicholas Turturro
4793	Jan Rubes
4794	Jan Munroe
4795	Nikolaj Lie Kaas
4796	Jane Horrocks
4797	Jadrien Steele
4798	James Bolam
4799	Omri Katz
4800	James Baskett
4801	Jamal Mixon
4802	Ornella Muti
4803	Jake Sandvig
4804	Oscar Levant
4805	Nikolai Sergeyev
4806	Jaimz Woolvett
4807	Olivia d'Abo
4808	Jacques Weber
4809	Jacques Villeret
4810	Jacques Fabbri
4811	Jacques Boudet
4812	Jacquelyn Hyde
4813	Jacqueline Poelvoorde-Pappaert
4814	Otto Sander
4815	Othon Bastos
4816	Nye Heron
4817	Nils Poppe
4818	Nina Van Pallandt
4819	James Laurenson
4820	Nobu McCarthy
4821	Nobuko Miyamoto (I)
4822	Nobuo Kaneko
4823	Norma Crane
4824	Olivia Hack
4825	Nozomu Sasaki
4826	James Booth
4827	James Dreyfus
4828	James DeBello
4829	Odile Le Clezio
4830	James Coco
4831	Olga Baclanova
4832	Olga Karlatos
4833	Olivia Barash
4834	Nelson Mashita
4835	Norman Bartold
4836	Myron McCormick
4837	Jeffrey Commanor
4838	Monica Mikala
4839	Jeff Richards (I)
4840	Jeff Kober
4841	Monique Gabrielle
4842	Jeff Cohen (I)
4843	Jeff Chamberlain
4844	Jarlath Conroy
4845	Jeannine Taylor
4846	Monica Calhoun
4847	Jeanne Kuo Chang
4848	Jeanne Bates
4849	Jeananne Crowley
4850	Jean-Pierre Melville
4851	Jean-Pierre Lorit
4852	N!xau
4853	N'Bushe Wright
4854	Jed Brophy
4855	Mitsuko Baisho
4856	Jenny Howe
4857	Jenny Drye
4858	Jennifer Warren
4859	Jennifer Salt
4860	Mirai Yamamoto
4861	Miriam D&#237;az Aroca
4862	Miriam Shor
4863	Jeffrey Donovan
4864	Jennifer Ehle
4865	Jeffrey Hunter
4866	Mitsunori Isaki
4867	Jenna Elfman
4868	Moishe Rosenfeld
4869	Molly Picon
4870	Molly Regan
4871	Mona McKinnon
4872	Mona Powell
4873	Najwa Nimri
4874	Mirjana Jokovic
4875	Ned Dowd
4876	Nadezhda Mikhalkova
4877	Jayne Atkinson
4878	Jaya Bhaduri
4879	Jay Thomas
4880	Nathan Bexton
4881	Jay Fiondella
4882	Natividad Abascal
4883	Natalie Canerday
4884	Ned Bellamy
4885	Jean Bouise
4886	Ned Glass
4887	Neil Maffin
4888	Jason Gould (I)
4889	Jason Edwards (I)
4890	Jason Dixie
4891	Nell Campbell
4892	Nelly Pappaert
4893	Massimo Troisi
4894	Jason Priestley
4895	Nat Pendleton
4896	Jascha Washington
4897	Nancy Kwan
4898	Jean-Louis Trintignant
4899	Jean-Louis Barrault
4900	Nancy Olson
4901	Nando Orfei
4902	Naoto Takenaka
4903	Jayne Brook
4904	Jean Sorel
4905	Jean-Pierre Bacri
4906	Jean Rochefort
4907	Natacha Lindinger
4908	Natacha R&#233;gnier
4909	Jean Heywood
4910	Jean Heather
4911	Natalie B. Kikkenborg
4912	Jean Carson
4913	Jean Caffeine
4914	Jean Stapleton
4915	M&#228;dchen Amick
4916	Kristina Kennedy
4917	Lynn-Holly Johnson
4918	Kristin Rudr&#252;d
4919	Kristian Almgren
4920	Kristen Wilson (I)
4921	Kristen Cloke
4922	Lynne Griffin
4923	Machiko Ky&#244;
4924	Klaus Wennemann
4925	Krystia Mova
4926	Klaus Abramowsky
4927	Kitty Carlisle
4928	Kitt Brophy
4929	Kirsty Child
4930	Mac Mashourian
4931	Kirsten Sheridan
4932	Marcel Bozzuffi
4933	Kresimir Novakovic
4934	Lung Ti
4935	Larenz Tate
4936	Lara Tosh
4937	Lukas Haas
4938	Lane Cassidy
4939	Landry Allbright
4940	Luke Edwards
4941	Lana Wood
4942	Kristina Wayborn
4943	L. Scott Caldwell
4944	Kristine Sutherland
4945	Luther Adler
4946	Ky&#244;ko Seki
4947	Lynn 'Red' Williams
4948	Lynn Ferguson
4949	Kumeko Urabe
4950	Kuei-Mei Yang
4951	Lynn Mabry
4952	Mack Swain
4953	Labina Mitevska
4954	Kevin Corrigan (I)
4955	Mamaengaroa Kerr-Bell
4956	Mami Koyama
4957	Kevin P. Farley
4958	Kevin Murphy (II)
4959	Kevin McKidd
4960	Kevin McKeon
4961	Manner Washington
4962	Kirsten Baker
4963	Manuela Gourary
4964	Kien Shih
4965	Kevin Conway (I)
4966	Mar&#237;lia P&#234;ra
4967	Mara Krup
4968	Marc Akerstream
4969	Marc de Jonge
4970	Kerri Green
4971	John Wray (I)
4972	Manny Jacobs
4973	Madison Eginton
4974	King Donovan
4975	Madeleine Carroll
4976	Kimberly Stringer
4977	Madeleine LeBeau
4978	Kimberly Elise
4979	Madeline Balmaceda
4980	Kim Walker
4981	Makoto Kobori
4982	Kim Myers (I)
4983	Mair&#233;ad N&#237; Ghallch&#243;ir
4984	Kim Director
4985	Madison Lanc
4986	Kim Bodnia
4987	Maggie Cheung
4988	Kika Markham
4989	Maggie McOmie
4990	Maia Brewton
4991	Larry Hagman
4992	Kim Novak
4993	Lloyd Avery II
4994	Leslie Caron
4995	Little Richard
4996	Leslie Bibb
4997	Leslie Ash
4998	Liv Ullmann
4999	Lesley-Anne Down
5000	Livio Badurina
5001	Larisa Oleynik
5002	Leopoldine Konstantin
5003	Leslie Howard
5004	Lois Hall
5005	Leonard Hicks
5006	Leonard Harris (II)
5007	Leonard Frey
5008	Loren Nelson
5009	Lori Martin (I)
5010	Leo Gullotta
5011	Ljubica Adzovic
5012	Lisa Ann Walter
5013	Linda Larkin
5014	Linda Manz
5015	Linda Moretti
5016	Linda Faye Farkas
5017	Lionel Atwill
5018	Lionel Barrymore
5019	Lillian Gish
5020	Lisa Zane
5021	Lionel Jeffries
5022	Leslie Hope (I)
5023	Liesel Matthews
5024	Li Gong
5025	Lezlie Deane
5026	Lisa Daniels
5027	Lisa Jolliff-andoh
5028	Lisa Spoonhauer
5029	Lisa Wilcox
5030	Lena Cardwell
5031	Lilli Palmer
5032	Laura Harris (II)
5033	Lori Singer
5034	Louis Wolheim
5035	Louw Verwey
5036	Lauren Hutton
5037	Luana Patten
5038	Luc Roeg
5039	Luca Bercovici
5040	Louis Prima
5041	Luciana Paluzzi
5042	Laurie Zimmer
5043	Lucie Mannheim
5044	Laura Dean (I)
5045	Laura Crossley
5046	Laura Cheron
5047	Laura Betti
5048	Lucile Watson
5049	Lucille La Verne
5050	Marcel Hillaire
5051	Lauren Ambrose
5052	Lotte Lenya
5053	Lucy Gutteridge
5054	Leland Palmer
5055	Lorraine Pilkington
5056	Leila Hyams
5057	Leigh Taylor-Young
5058	Leigh Russell
5059	Leif Tilden
5060	Laurent Spielvogel
5061	Lotte Andersen
5062	Lorna Luft
5063	Lee Hinton (I)
5064	Lou Antonio
5065	Lee Curreri
5066	Louis Eppolito
5067	Lazar Ristovski (I)
5068	Lawrence T. Wrentz
5069	Louis Jourdan
5070	Lawrence A. Bonney
5071	Leif Juster
5072	Josh Milrad
5073	Mark-Paul Gosselaar
5074	Marlee Matlin
5075	Judd Omen
5076	Joy Boushel
5077	Joshua Tilden
5078	Joshua Shalikar
5079	Joshua Leonard
5080	Martin Kove
5081	Marlies van Alcmaer
5082	Judith Anna Roberts
5083	Josh Lucas
5084	Marshall R. Teague
5085	Martha Vickers
5086	Joseph Wiseman
5087	Joseph Whipp
5088	Joseph Thiaka
5089	Kerr Smith
5090	Joshua Keaton
5091	Julia Campbell
5092	Mark Kiely
5093	Julie Benz
5094	Mark Lee (I)
5095	Julie Allred
5096	Julianne Phillips
5097	Julianna Margulies
5098	Mark Lester (I)
5099	Judi Bowker
5100	Julia Nickson-Soul
5101	Mark Wingett
5102	Judy Kuhn
5103	Judy Holliday
5104	Judith Vittet
5105	Judith O'Dea
5106	Judith Malina
5107	Judith Ivey (I)
5108	Judith Godr&#232;che
5109	Joseph Mascolo
5110	Julian Arahanga
5111	Mary Lynette Braxton
5112	Mary Demas
5113	Mary Gregory
5114	Jonathan Jackson
5115	Jonathan Freeman (I)
5116	Mary Jo Catlett
5117	Mary Kate Schellhardt
5118	Jonathan Brandis
5119	Joseph Pilato
5120	Jonah Blechman
5121	Jonathan Vega
5122	Mary Stein (I)
5123	Jon Kassir
5124	Mary Ure
5125	Mary Woronov
5126	Masayuki Mori (I)
5127	Johnny Ray McGhee
5128	Massimo Serato
5129	Jonas Abry
5130	Marty Belafsky
5131	Martin Rosenblatt
5132	Martin Semmelrogge
5133	Martin Walsh (III)
5134	Joseph Egger
5135	Martin West (I)
5136	Joseph Calleia
5137	Joseph Cali
5138	Jonathan Sagall
5139	Zooey Deschanel
5140	Jonathan Scott-Taylor
5141	&#193;ngela Molina
5142	Jorge de Juan
5143	Marty York
5144	Jordan Routledge
5145	Jordan Christopher
5146	Jonn Cherico
5147	Jonkit Lee
5148	Julie Dawn Cole
5149	Joseph Bottoms
5150	Marianne Koch
5151	Maria Mayenzet
5152	Maria Michi
5153	Katja Riemann
5154	Katie Schlossberg
5155	Maria Porter
5156	Maria Schneider
5157	Kathryn Harrold
5158	Mark Joy
5159	Marianne Hagan
5160	Maria Casar&#232;s
5161	Marie-Anne Chazel
5162	Marie-Laure Dougnac
5163	Kathleen Harrison
5164	Katharine Towne
5165	Marilyn Eastman
5166	Katharine Houghton
5167	Marilyn Ghigliotti
5168	Marianna Hill
5169	Margaret Avery
5170	Kenn Scott
5171	Ken Takakura
5172	Marcel Marceau
5173	Marcella Rovere
5174	Ken Page (I)
5175	Ken Ogata
5176	Ken Jenkins (I)
5177	Katy Jurado
5178	Ken Foree
5179	Maria Doyle Kennedy
5180	Margaret Langrick
5181	Margaretha Krook
5182	Keith Wayne
5183	Keith Szarabajka
5184	Keith Stuart Thayer
5185	Marge Champion
5186	Keith Allen (I)
5187	Mario Iv&#225;n Mart&#237;nez
5188	Marcie Leeds
5189	Julietta Novis
5190	Katharina Thalbach
5191	Justin Henry
5192	Justin Braine
5193	Mark Addy
5194	June Whitfield
5195	Jullan Kindahl
5196	Julio Alberto Fern&#225;ndez
5197	K.C. Martel
5198	Mark Beech
5199	k.d. lang
5200	Juliet Neil
5201	Julien Carette
5202	Mark Eliot
5203	Julie Hayden
5204	Mark Herrier
5205	Julie Hamilton (I)
5206	Julie Follansbhee
5207	James Larkin (I)
5208	Mark Arnold (I)
5209	Karen McLymont
5210	Julie Cobb
5211	Marion Cotillard
5212	Kassie DePaiva
5213	Karl Hardman
5214	Karl Etlinger
5215	Karl Bruckschwaiger
5216	Karin Viard
5217	Mark Acheson
5218	Karen Mok
5219	Mario Abe
5220	Karen Lynn Gorney
5221	Karen Finley
5222	Karen Edgely
5223	Kaoru Kobayashi
5224	Kalina Jedrusik
5225	Kali Rocha
5226	Kadeem Hardison
5227	Kabir Bedi
5228	Marisa Coughlan
5229	Fran&#231;ois Cluzet
5230	Floyd 'Red Crow' Westerman
5231	Richard Grieco
5232	Frances O'Connor (II)
5233	Joseph Bennett (III)
5234	France Nuyen
5235	Richard Hunt (I)
5236	Fran&#231;oise Yip
5237	Francesco Quinn
5238	Fran&#231;ois Hadji-Lazaro
5239	Francine Racette
5240	Richard Lewis (II)
5241	Fran Brill
5242	Fr&#233;d&#233;rique Feder
5243	Fr&#233;d&#233;ric Diefenthal
5244	Fr&#233;d&#233;ric Andr&#233;i
5245	Forrest Tucker
5246	Richard Beymer
5247	Richard Ingram
5248	Richard D. Fisher Jr.
5249	Ethan Erickson
5250	Richard Boone
5251	Frankie Acciarito
5252	Richard Brooker
5253	Frank Sinatra
5254	Frank Morgan (I)
5255	Richard Coca
5256	Francesca Bertini
5257	Frank Finlay
5258	Florijan Ajdini
5259	Frank Coughlan
5260	Richard Denning (I)
5261	Richard Easton (II)
5262	Franco Nero
5263	Francis Huster
5264	Francis De Wolff
5265	Francis Capra
5266	Frank Giering
5267	Evan C. Kim
5268	Richard McCabe
5269	Fabiana Formica
5270	Richard White (I)
5271	F. William Parker
5272	Richmond Arquette
5273	Evelyn Varden
5274	Evelyn Guerrero
5275	Faith Prince
5276	Evan Handler
5277	Fannie Flagg
5278	Evan Adams
5279	Eva Marie Saint
5280	Eunice Gayson
5281	Eugene Pallette
5282	Eugene Collier
5283	Ethel Merman
5284	R.J. Parnell
5285	Eve Channing
5286	Felix Wong
5287	Florence Pernel
5288	Flavio Bucci
5289	Richard Norton (I)
5290	Fionnula Flanagan
5291	Finn Carter
5292	Richard Romanus
5293	Feodor Chaliapin Jr.
5294	Richard Ward (I)
5295	Felton Perry
5296	Fred Astaire
5297	Felix Bressart
5298	Felicity Huffman
5299	Fele Mart&#237;nez
5300	Richard S. Castellano
5301	Feather
5302	Faye Wong
5303	Farrah Fawcett
5304	Fengyi Zhang
5305	Rawle D. Lewis
5306	Gary Taggart
5307	George Burns (I)
5308	George Baker (I)
5309	Randy Pearlstein
5310	Raoul Trujillo
5311	George 'Red' Schwartz
5312	Raphael Fejt&#246;
5313	George De La Pena
5314	Geoffrey Holder
5315	George Foreman
5316	Genevi&#232;ve Page
5317	Ray Allen (V)
5318	Ray Bolger
5319	Gene Ruffini
5320	Ray Iannicelli
5321	Gary Werntz
5322	Franklin Cover
5323	Raquel Welch
5324	George Wilson (II)
5325	Geri Halliwell
5326	Gerard Butler
5327	Geraldine O'Rawe
5328	Geraldine Muir
5329	Georgina Cates
5330	Georgia Hale
5331	Georges Gu&#233;tary
5332	Randy Gornel
5333	Georges Corraface
5334	Jacqueline Brookes
5335	Rachel Blanchard
5336	Rachel Howard
5337	Rachel Ward
5338	George Peppard
5339	Ralph Ineson
5340	George Hearn
5341	George Hamilton
5342	Georges Flamant
5343	Rex Harrison
5344	Raymond Serra
5345	Ren&#233; Hofschneider
5346	G&#233;rard Klein (I)
5347	G&#233;rard Isma&#235;l
5348	G&#233;raldine Pailhas
5349	Fritz Wepper
5350	Rene Ceballos
5351	Remy Ryan
5352	Frederick Koehler
5353	Gabriel Casseus
5354	Rhea Perlman
5355	Rhoda Williams
5356	Rhonda Britton
5357	Fred Norris (I)
5358	Richard Allen (I)
5359	Richard Anderson (I)
5360	Richard B. Shull
5361	Rene Medvesek
5362	Garry Shandling
5363	Rebecca Gordon
5364	Gary Merrill
5365	Gary Lockwood
5366	Gary Kemp
5367	Gary Hershberger
5368	Rebel Russell
5369	Reeve Carney
5370	Gabino Diego
5371	Gary Beach
5372	Esther Vriessendorp
5373	Regina Hall (I)
5374	Gail Cronauer
5375	Regina Torn&#233;
5376	Gabrielle Rose
5377	Gabrielle Fitzpatrick
5378	Reginald Gardiner
5379	Gabriel Damon
5380	Gary Bullock
5381	Rocky Carroll
5382	Dorris Bowdon
5383	Robin Givens
5384	Dwight Ewell
5385	Robin Quivers
5386	Duke Moore
5387	Robin Weisman
5388	Robyn Lynne Raab
5389	Dylan Sprouse
5390	Dre Pahich
5391	Roberta Collins
5392	Douglas Rain
5393	Rod Culbertson
5394	Douglas Forsythe Rye
5395	Douglas Bisset
5396	Doug McKeon
5397	Rod Loomis
5398	Edward Albert
5399	Rock Hudson
5400	Robert Sampson
5401	Rick Yune
5402	Ednah Holt
5403	Edmond O'Brien
5404	Edie Falco
5405	Eddy Mitchell
5406	Eddie Griffin
5407	Eddie Albert
5408	Dylan Kussman
5409	Ed Ramey
5410	Dorothy Comingore
5411	Robert Small (I)
5412	Ed Gale
5413	Ed Begley
5414	Earl Hindman
5415	Eanna MacLiam
5416	Robert Walker (I)
5417	Robert Weems
5418	Ed Wynn
5419	Dolores Moran
5420	Doug E. Doug
5421	Roger Smith (I)
5422	Don 'D.C.' Curry
5423	Dominique Virton
5424	Dominique Sanda
5425	Dominique Dunne
5426	Dominique Bettenfeld
5427	Roger Heathcott
5428	Rolf Hoppe
5429	Don Johnson
5430	DMX
5431	Djiby Soumare
5432	DJ Qualls
5433	Divine
5434	Diva Gray
5435	Dita Parlo
5436	Dick York (I)
5437	Domingo Landicho
5438	Donald Madden
5439	Dora van der Groen
5440	Donny Osmond
5441	Donnie Wahlberg
5442	Donnie Dunagan
5443	Roddy Maude-Roxby
5444	Donna Hanover
5445	Donna Frenzel
5446	Don Creech (I)
5447	Donatas Banionis
5448	Edward Arnold
5449	Rodney Harvey
5450	Don Stroud (I)
5451	Roger Bart
5452	Roger Daltrey
5453	Don Pardo
5454	Don Murray
5455	Don King (I)
5456	Donna Anderson (I)
5457	Emma Bunton
5458	Emil Tarding
5459	Eric Braeden
5460	Robbi Morgan
5461	Enzo Turrin
5462	Enzo Cannavale
5463	Enrico Colantoni
5464	Robby Benson
5465	Eric Clapton
5466	Emma Gates
5467	Eric Gordon
5468	Robby Kiger
5469	Emily Woof
5470	Emily Lloyd
5471	Emily Cline
5472	Robert Apel
5473	Robert Apisa
5474	Robert Romanus
5475	Emma Sj&#246;berg
5476	Erik M&#248;rk
5477	Ernst-Hugo J&#228;reg&#229;rd
5478	Ernst St&#246;tzner
5479	Ricky Nelson
5480	Rik Van Nutter
5481	Ernie Banks
5482	Ernest Liu
5483	Rita Karin
5484	Rob Morrow
5485	Erik van 't Wout
5486	Emil Marwa
5487	Erica Yohn
5488	Erica Leerhsen
5489	Erica Carlson (II)
5490	Eric Weinstein
5491	Rob Brownstein
5492	Eric Laneuville
5493	Eric Hull
5494	Eriko Watanabe
5495	Elaine Banham
5496	Robert Ari
5497	Eli Marienthal
5498	Elgin Marlow
5499	Eleanor Parker (I)
5500	Eleanor David
5501	Eleanor Coppola
5502	Elaine Stritch
5503	Elie Chaib
5504	Elaine Cassidy
5505	Elisa Donovan
5506	Eileen Atkins
5507	Eijir&#244; Tono
5508	Robert Littman
5509	Robert MacNaughton
5510	Robert McDarra
5511	Edward Everett Horton
5512	Robert Pugh
5513	Robert Lepage (I)
5514	Elke Sommer
5515	Robert Ayres (I)
5516	Elva Josephson
5517	Elton John
5518	Els Dottermans
5519	Robert Blake
5520	Ellie Gottwald
5521	Ellen Sandweiss
5522	Robert Hughes (I)
5523	Robert Conrad
5524	Reba McEntire
5525	Robert Cummings
5526	Robert DoQui
5527	Robert Drivas
5528	Robert Foxworth
5529	Elizabeth Berridge
5530	Robert Francis (I)
5531	Elisabeth Depardieu
5532	Ellen DeGeneres
5533	Paul Roebling
5534	Hiroshi &#212;take
5535	Paul Perri (I)
5536	Paul Rhys
5537	Hilary Mason
5538	Hideko Yoshida
5539	Heydon Prowse
5540	Harriet Andersson
5541	Hermione Gingold
5542	Holter Graham
5543	Herman Bing
5544	Paul Sand (I)
5545	Paul Simon (I)
5546	Herbert Gr&#246;nemeyer
5547	Herb Edelman
5548	Paul Sutera
5549	Paulo Costanzo
5550	Paul Richards (I)
5551	Paul J. Lombardi
5552	Hugh Douglas (II)
5553	Hudhail Al-Amir
5554	Hubertus Bengsch
5555	Hubert Kound&#233;
5556	Paul H&#246;rbiger
5557	Howard Storm
5558	Howard Morris
5559	Paul Pape
5560	Howard Hesseman
5561	Hollis McLaren
5562	Paul Koslo
5563	Howard Duff
5564	Paul Le Mat
5565	Howard Da Silva
5566	Paul Lukas
5567	Paul Mann
5568	Peewee Wilson
5569	Howard Keel
5570	Peter Billingsley
5571	Henry Dinhofer
5572	Pernilla Allwin
5573	Pernilla August
5574	Haya Harareet
5575	Perry Lang
5576	Harvey Stephens (II)
5577	Harvey Lembeck
5578	Per Theodor Haugen
5579	Peter Behn
5580	Pep Munn&#233;
5581	Hartley Power
5582	Peter Boyden
5583	Harry Stockwell
5584	Harry Secombe
5585	Harry Guardino
5586	Harry Carey Jr.
5587	Harriet Walter
5588	Pete O'Herne
5589	Peggy Dow
5590	Paul Ford (I)
5591	Henri-Jacques Huet
5592	Rebecka Liljeberg
5593	Henning Moritzen
5594	Gerry Skilton
5595	Hema Malini
5596	Helmut Qualtinger
5597	Percy Edwards
5598	Peggy Ashcroft
5599	Pedro Armend&#225;riz
5600	Helen Morse
5601	Peggy Gormley
5602	Helen Miller (I)
5603	Peggy Wood
5604	Heidi von Palleske
5605	Hector Pappaert
5606	Heather-Jay Jones
5607	Helmut Griem
5608	Patricia Hitchcock
5609	Patrick Bauchau
5610	Jack Elam
5611	Jack Creley
5612	Pat Thompson (II)
5613	Patcharawan Patarakijjanon
5614	Jack Benny
5615	J.D. Cannon
5616	Jack Ging
5617	J. Stephen Peace
5618	Jack Haley (I)
5619	J&#252;ri J&#228;rvet
5620	Patricia Kalember
5621	Izabella Scorupco
5622	Patricia Richardson
5623	Ivan Lapikov
5624	Itzhak Perlman
5625	Paul Fox (II)
5626	Patricia Collinge
5627	Jack Starrett
5628	Jacqueline Barba
5629	Jacobo Morales
5630	Jackson Lou
5631	Jackie Sawris
5632	Jackie Gleason
5633	Pamela Hart
5634	Pamela Stephenson
5635	Pat Slowey
5636	Jack Taylor (II)
5637	Isabelle Pasco
5638	Jack Oakie
5639	Pat Boone
5640	Pat Corley
5641	Pat Henning
5642	Jack Lord
5643	Pat O'Brien
5644	Jack Kelly (I)
5645	Pamela Tiffin
5646	Ian Fried
5647	Isao Hashizume
5648	Ibrahim Ferrer
5649	Paul Benedict
5650	Ian Watkin
5651	Ian Petrella
5652	Ian Ogilvy
5653	Paul Burke
5654	Ilan Mitchell-Smith
5655	Paul Chen
5656	Paul A. Partain
5657	Paul Cicero
5658	Paul Collins (I)
5659	Paul Dawson (II)
5660	Iain Robertson
5661	Iain Cuthbertson
5662	Paul Drake (I)
5663	Henki Kolstad
5664	Ian Hendry (I)
5665	Ingrid Thulin
5666	Patrick Breen
5667	Isabel Glasser
5668	Patrick Fugit
5669	Isa Danieli
5670	Irma Raush
5671	Irene Miracle
5672	Patrick McGaw
5673	Paul Barber (I)
5674	Patrick Renna
5675	Hugh O'Brian
5676	Ingrid Rogers
5677	Ing-Marie Carlsson
5678	Imogene Coca
5679	Imogen Stubbs
5680	Imogen Boorman
5681	Iman
5682	Ilse Steppat
5683	Patrick Mercado
5684	Giulietta Masina
5685	Giuliana Lojodice
5686	Gus Mercurio
5687	Peter McDonald
5688	Hanno P&#246;schl
5689	Glen Berry
5690	Guillaume Canet
5691	Hanna R. Hall
5692	Giustino Durano
5693	Peter Gowen
5694	Peter Outerbridge
5695	Godfrey Tearle
5696	Pierre Cl&#233;menti
5697	Pietro Falcone
5698	Peter Sarsgaard
5699	Hal Delrich
5700	Pierre Brasseur
5701	Peter Ostrum
5702	Gwenn Mitchell
5703	Peter Jurasik
5704	Phil Buckman
5705	Philip Ober
5706	Peter Krantz
5707	H&#233;l&#232;ne Vincent
5708	Haley Miller (I)
5709	Guy Decomble
5710	Pierre Renoir
5711	Hans Matheson
5712	Gloria Charles
5713	Halina Gryglaszewska
5714	Gloria Swanson
5715	Glen Cavender
5716	Glen Campbell
5717	Guy Kibbee
5718	Pierre Fresnay
5719	Piotr Kozlowski
5720	Peter Donaldson
5721	Gordon Warnecke
5722	Giovanna Galletti
5723	Goran Visnjic
5724	Harold Hopkins
5725	Phil Spector
5726	Gregor Fisher
5727	Priscilla Lane
5728	Harold Oblong
5729	Phil Reeves
5730	Harold Sylvester
5731	Philip Gordon
5732	Philip King
5733	Quincy Jones
5734	R&#233;my Girard
5735	Greg Grunberg
5736	Gert Bastian
5737	Quentin Crisp
5738	Hans von Borsody
5739	Greta Lind
5740	Gitt Magrini
5741	Henri Serre
5742	Qi Lu
5743	Phyllis Diller (I)
5744	Harold Fong
5745	Phoebe Augustine
5746	Harald Heide-Steen Jr.
5747	Hardy Kr&#252;ger
5748	Peter Finch
5749	Harold Baigent
5750	Drew Snyder
5751	Max Wright
5752	Eddie Jones (I)
5753	Robert Lesser
5754	Mary Ellen Trainor
5755	Michael Milhoan
5756	Celia Weston
5757	Roy Brocksmith
5758	Geoffrey Lewis (I)
5759	William Hootkins
5760	J. Kenneth Campbell
5761	Gregory Sierra
5762	Vyto Ruginis
5763	John Carroll Lynch
5764	Julio Oscar Mechoso
5765	Frances Conroy
5766	Stanley Anderson
5767	Harry Shearer
5768	Tom Noonan
5769	George Cheung
5770	Frank Adonis
5771	Andrew Bryniarski
5772	Leslie Phillips (I)
5773	Rene Auberjonois
5774	Gregory Jbara
5775	Sean Whalen
5776	Jack Walsh (I)
5777	Jude Ciccolella
5778	Shane Rimmer
5779	Norbert Weisser
5780	Bradford English
5781	Sean Stone
5782	Alice Drummond
5783	John Hawkes (I)
5784	George Wallace (I)
5785	I.M. Hobson
5786	MacIntyre Dixon
5787	Raye Birk
5788	Jack Purvis
5789	Roger Guenveur Smith
5790	William Smith (I)
5791	James Keane (I)
5792	Henry Gibson
5793	Thomas Jefferson Byrd
5794	Tim Guinee
5795	John Bluthal
5796	Margo Martindale
5797	Richard Hamilton
5798	Eric Edwards (I)
5799	George Furth
5800	Edward Bunker
5801	Ann Cusack
5802	Matt Clark (I)
5803	David Wohl
5804	Dirk Blocker
5805	Ed Williams (II)
5806	John Ventimiglia
5807	Gerard Horan
5808	Michael Champion
5809	Philip Tan
5810	Graham Jarvis (I)
5811	Benito Stefanelli
5812	Patty Hearst
5813	Eddra Gale
5814	James Lally
5815	Camryn Manheim
5816	Britt Leach
5817	Calvin Lockhart
5818	Roger Aaron Brown
5819	Lela Rochon
5820	Badja Djola
5821	J. Patrick McNamara
5822	George Buck
5823	Norman Lloyd
5824	Lee Wallace
5825	Dick Warlock
5826	George Aguilar
5827	Michael Jace
5828	Obba Babatund&#233;
5829	Octavia Spencer
5830	Donald Hotton
5831	Duane Martin
5832	Catherine Kellner
5833	Claude Akins
5834	Basil Hoffman
5835	John Roselius
5836	Gene Hartline
5837	Ed Crowley
5838	Tracey Ellis
5839	Susan Blommaert
5840	Una O'Connor
5841	Beau Billingslea
5842	Godfrey Quigley
5843	Burton Gilliam
5844	Ralph Seymour
5845	Don Yesso
5846	Duncan Fraser (II)
5847	Russi Taylor
5848	Alan Fudge
5849	Chi McBride
5850	Joanna Barnes
5851	Mariel Hemingway
5852	Bodhi Elfman
5853	Annie Ross
5854	Dash Mihok
5855	Tom Wright (I)
5856	Christopher Adamson
5857	Tim McInnerny
5858	Scott Coffey
5859	Joyce Van Patten
5860	Frank McCarthy (I)
5861	Darrell Zwerling
5862	Henry Brandon
5863	Andr&#233; Morell
5864	Andr&#233; Maranne
5865	Brad Garrett
5866	Frank Sivero
5867	Walter Sparrow
5868	Henry O
5869	Hal Landon Jr.
5870	Kelly Bishop
5871	Peter Jeffrey (I)
5872	Andre Gregory
5873	Ferdy Mayne
5874	Sean McCann
5875	Sean O'Bryan
5876	Jerry Tondo
5877	Mark L. Taylor
5878	Harry J. Lennix
5879	Daniel Lapaine
5880	Flea
5881	Anita Gillette
5882	Blake Clark
5883	Joyce Jameson
5884	Billy Barty
5885	Ken Hudson Campbell
5886	Micole Mercurio
5887	Penny Bae Bridges
5888	Tiny Ron
5889	Danny Nucci
5890	Richard Stahl
5891	Jessie Lawrence Ferguson
5892	Penn Jillette
5893	Richard Venture
5894	Jennifer Coolidge
5895	Frank Baker (III)
5896	Richard Herd
5897	Garette Ratliff Henson
5898	Ellen Foley
5899	Tony Jay
5900	Neal McDonough
5901	Samantha Eggar
5902	Tom Green (III)
5903	Elizabeth Whitcraft
5904	Paul Fix
5905	Elizabeth Franz
5906	Elizabeth Bracco
5907	Erick Avari
5908	David Neidorf
5909	Gretchen Palmer
5910	Jon Kasdan
5911	Garry Cooper
5912	Nestor Serrano
5913	Steven Randazzo
5914	Niall Buggy
5915	Red West
5916	Nicholas Bell
5917	Jane Morris
5918	S. Epatha Merkerson
5919	Celia Imrie
5920	Michael Tucker (I)
5921	Rex Everhart
5922	Philip Moon
5923	Christopher Hart
5924	H.B. Warner
5925	Bibi Besch
5926	Christopher John Fields
5927	Kenneth Colley
5928	Dakin Matthews
5929	Kenneth McMillan
5930	Marc Lawrence (I)
5931	Nancy Stephens
5932	Peter Van Norden
5933	Peter MacNeill (I)
5934	Regis Toomey
5935	Steve Hytner
5936	Manning Redwood
5937	Peter McRobbie
5938	Tony Genaro
5939	David Jensen (I)
5940	Majel Barrett
5941	Ren Woods
5942	Jonathan Loughran
5943	David Knell
5944	Ken Curtis (I)
5945	Gwen Verdon
\.

COPY albums (asin, title, artist, price, rdate, label, rank) FROM stdin;
B0000009VO	The Very Best Of Elvis Costello And The Attraction	Elvis Costello	\N	1994-10-25	Ryko	1465
B000000OU0	Hell Freezes Over	Eagles	13.99	1994-11-08	\N	513
B000000WA4	Mellon Collie and the Infinite Sadness	Smashing Pumpkins	21.99	1995-10-24	\N	2332
B000000WDA	Blur	Blur	11.98	1997-03-11	\N	17154
B000000WF0	Urban Hymns	The Verve	13.99	1997-09-30	\N	1855
B0000013G5	Toni Braxton	Toni Braxton	13.98	1993-07-13	La Face	6677
B00000161Y	Romanza (Italian/Spanish Language Edition)	Andrea Bocelli	14.99	1997-12-09	\N	7090
B000001DQI	Goodbye Yellow Brick Road [ORIGINAL RECORDING REMA	Elton John	13.99	\N	\N	673
B000001DTM	Achtung Baby	U2	13.99	1991-11-19	\N	396
B000001DVP	Elton John - Greatest Hits	Elton John	11.98	\N	\N	427
B000001DZO	GoldGreatest Hits	Abba	13.49	1993-08-09	\N	97
B000001E8P	Different Class	Pulp	14.99	1995-10-30	\N	6389
B000001EW3	Come on Over	Shania Twain	13.99	1997-11-04	\N	440
B000001FDV	Saturday Night FeverThe Original Movie Sound Track	Bee Gees	14.99	\N	\N	162
B000001FGW	Cake	Trash Can Sinatras	14.98	1990-11-06	\N	11634
B000001FLC	The Phantom Of The Opera (1986 Original London Cas	The Phantom Of The Opera (Related Recordings)	\N	1987-07-07	Uni/Mercury	557
B000001FS3	Joshua Tree	U2	13.49	\N	\N	601
B000001FY9	Legend	Bob Marley	13.99	1984-05-08	\N	1799
B000001GHL	Ludwig van BeethovenSymphonies Nos. 3 & 9/Overture	Ludwig van Beethoven	16.49	\N	\N	2150
B000001GPX	BeethovenSymphonien Nos. 5 & 7 / Kleiber, Vienna P	Ludwig van Beethoven	11.98	\N	\N	375
B000001Y5Z	The Downward Spiral [EXPLICIT LYRICS]	Nine Inch Nails	14.99	1994-03-08	\N	4511
B0000024RJ	I Left My Heart in San Francisco	Tony Bennett	9.98	\N	Sony	10664
B0000024SI	Highway 61 Revisited	Bob Dylan	11.98	\N	Sony	887
B0000024SQ	The Movie Song Album	Tony Bennett	9.98	\N	Sony	35565
B0000024V3	Barbra Streisand - Greatest Hits	Barbara Streisand	14.99	\N	Sony	22247
B00000253N	Blood on the Tracks	Bob Dylan	11.98	1975-01-17	Sony	582
B00000255F	Born to Run	Bruce Springsteen	13.98	1975-08-25	Sony	521
B000002564	Silk Degrees	Boz Scaggs	\N	\N	Sony/Columbia	2035
B0000025BL	Bat Out of Hell	Meat Loaf	\N	\N	Sony/Epic	1251
B0000025FN	Live at Budokan [LIVE]	Cheap Trick	\N	\N	Sony	21487
B0000025HO	ELO's Greatest Hits	E.L.O.	11.98	\N	Sony	3198
B0000025HU	London Calling	The Clash	\N	1979-12-14	Sony	4626
B0000025RI	Thriller	Michael Jackson	\N	\N	Sony/Columbia	708
B0000025UW	Born in the U.S.A.	Bruce Springsteen	13.49	1984-06-04	Sony	780
B0000025VL	ClassicsThe Early Years	Neil Diamond	11.98	\N	Sony	9451
B00000265P	16 Most Requested Songs	Johnny Mathis	11.98	\N	Sony	2152
B0000026CH	Faith	George Michael	13.98	1987-01-01	Sony	1449
B0000026V1	BasherThe Best of Nick Lowe	Nick Lowe	11.98	\N	Sony	10201
B0000026W1	Greatest Hits...and More	Barbara Streisand	14.99	1989-10-03	Sony	4446
B0000027RL	Ten	Pearl Jam	13.98	1991-08-27	Sony	811
B0000028TU	Gloria Estefan - Greatest Hits	Gloria Estefan	14.99	1992-11-03	Sony	3956
B00000294L	Suede	London Suede	11.98	1993-04-06	Sony	16523
B0000029LG	HIStoryPast, Present and Future, Book 1	Michael Jackson	29.49	1995-06-20	Sony	1447
B0000029YC	TitanicMusic from the Motion Picture (1997) [SOUND	Celine Dion	13.98	1997-11-18	Sony	4899
B000002ADT	Kind of Blue	Wynton Kelly	11.98	\N	Sony	180
B000002AL7	Forty Years-Artistry of Tony B	Tony Bennett	35.99	\N	Sony	10749
B000002BBY	(What's The Story) Morning Glory?	Oasis	13.98	1995-10-03	Sony	777
B000002BHE	Falling into You	Celine Dion	13.98	1996-03-12	Sony	1503
B000002BQK	Butterfly	Mariah Carey	13.28	1997-09-16	Sony	18210
B000002BZ0	Wide Open Spaces	Dixie Chicks	13.98	1998-01-27	Sony	88
B000002C4J	Let's Talk About Love [ENHANCED CD]	Celine Dion	13.98	1997-11-18	Sony	5097
B000002G3U	Every Breath You TakeThe Classics	The Police	13.99	1995-09-12	\N	1058
B000002GE7	Singles 45's and Under	Squeeze	11.98	\N	\N	4042
B000002GVO	Hotel California	Eagles	13.99	\N	\N	1500
B000002GVS	Eagles - Their Greatest Hits 1971-1975	Eagles	13.49	\N	\N	1443
B000002H33	Master of Puppets	Metallica	13.99	\N	\N	744
B000002H97	Metallica	Metallica	13.99	1991-08-12	\N	836
B000002I25	The Doors	The Doors	14.99	\N	\N	2702
B000002I4U	The Genius of Ray Charles	Ray Charles	11.98	\N	Atlantic	14200
B000002IKH	50 by Bobby Short	Bobby Short and his Orchestra	\N	\N	Atlantic	23573
B000002IT2	Little Earthquakes	Tori Amos	13.99	1992-02-25	Atlantic	1352
B000002IVS	Greatest Hits-Experience the Divine	Bette Midler	14.99	1993-06-22	Atlantic	2181
B000002IZ1	Amplified Heart	Everything But the Girl	13.98	1994-07-19	Atlantic	3329
B000002J09	Led Zeppelin IV [ORIGINAL RECORDING REMASTERED]	Led Zeppelin	13.49	1971-11-08	Atlantic	430
B000002JOT	Mack the Knife	Bobby Darin	11.98	1991-11-12	Atlantic	5329
B000002KBX	Sail Away	Randy Newman	\N	\N	\N	2890
B000002KGT	Rumours	Fleetwood Mac	13.99	1977-02-04	\N	631
B000002KHF	Moondance	Van Morrison	11.98	\N	\N	582
B000002L68	"Music from the Motion Picture ""Purple Rain"""	Prince	11.98	\N	\N	2273
B000002L9J	The Queen is Dead	The Smiths	14.99	\N	\N	1437
B000002LD7	The Singles	The Pretenders	14.99	1987-11-17	\N	5998
B000002LND	The Immaculate Collection	Madonna	13.49	1990-11-13	\N	1204
B000002LRR	Watermark	Enya	13.49	\N	\N	263
B000002LSP	Ing..nue	K. D. Lang	13.98	1992-03-17	\N	3566
B000002MFE	Unplugged [LIVE]	Eric Clapton	13.99	1992-08-25	\N	953
B000002MG1	Automatic for the People	R.E.M.	13.99	1992-10-06	\N	1205
B000002MH7	San Francisco Days	Chris Isaak	11.98	1993-04-13	\N	2990
B000002MY3	Jagged Little Pill	Alanis Morissette	13.99	1995-06-13	\N	870
B000002NBY	Graceland	Paul Simon	13.49	\N	\N	314
B000002NJS	Ray of Light	Madonna	14.99	1998-03-03	\N	2566
B000002O72	Cloudcuckooland	Lightning Seeds	11.98	1990-04-03	Mca	21189
B000002OPK	Bing! His Legendary Years, 1931 to 1957 [BOX SET]	Bing Crosby	59.98	1993-09-28	Mca	28372
B000002OX5	The Who Sell Out [ORIGINAL RECORDING REMASTERED] [	The Who	11.98	\N	Mca	4874
B000002P5Y	Are You Experienced?	Jimi Hendrix	13.99	\N	Mca	756
B000002PEF	The Greatest Hits [MCA]	Ink Spots	\N	1989-11-21	Uni/Mca	6695
B000002TRT	The Greatest Hits [Capitol]	Nat King Cole	13.99	1994-10-18	Capitol	1055
B000002TU5	The Best...So Far	Anne Murray	13.99	1994-11-29	Capitol	1295
B000002U82	Dark Side of the Moon	Pink Floyd	13.49	1973-03-24	Capitol	194
B000002U98	Greatest Hits 1974-1978	Steve Miller Band	11.98	\N	Capitol	1751
B000002UAO	Rubber Soul [UK]	The Beatles	13.49	1965-12-03	Capitol	343
B000002UAR	Revolver [UK]	The Beatles	13.49	1966-08-05	Capitol	242
B000002UAU	Sgt. Pepper's Lonely Hearts Club Band	The Beatles	13.49	1967-06-01	Capitol	218
B000002UAX	The Beatles (The White Album)	The Beatles	27.99	\N	Capitol	409
B000002UB3	Abbey Road	The Beatles	13.49	1969-09-26	Capitol	158
B000002UB6	Let It Be [SOUNDTRACK]	The Beatles	13.99	1970-05-08	Capitol	1157
B000002UJO	In It for the Money	Supergrass	16.98	1997-05-06	Capitol	30220
B000002UJQ	OK Computer	Radiohead	13.49	1997-07-01	Capitol	755
B000002ULQ	Sevens	Garth Brooks	14.99	1997-11-25	Capitol	20529
B000002USX	Judy at Carnegie Hall [LIVE]	Judy Garland	\N	\N	Emd/Capitol	3561
B000002UWM	The Capitol Years	Frank Sinatra	34.99	1990-12-18	Capitol	2649
B000002VI0	Eurythmics - Greatest Hits	Eurythmics	14.99	1991-05-24	Arista	2318
B000002VN7	Fumbling Towards Ecstasy	Sarah McLachlan	13.98	1994-02-15	Arista	853
B000002VT6	Surfacing [ENHANCED CD]	Sarah McLachlan	13.49	1997-07-15	Arista	183
B000002W6Q	Nilsson Schmilsson	Harry Nilsson	14.99	\N	Rca	3480
B000002WC1	Stardust & Much More	Hoagy Carmichael	\N	\N	Bmg/Rca	8277
B000002WD4	All-Time Greatest Hits	Harry Nilsson	14.99	1989-07-18	Rca	2306
B000002WFX	Top Ten Hits	Elvis Presley	\N	\N	Rca	25121
B000002WFY	50 Worldwide Gold HitsVolume 1, Parts 1 & 2	Elvis Presley	\N	\N	Rca	8710
B000002WQS	Under the Table & Dreaming	Dave Matthews Band	13.49	1994-09-27	Rca	486
B000002WYT	Crash	Dave Matthews Band	13.49	1996-04-30	Rca	286
B000002ZDA	Glen Campbell Collection (1962-1989)Gentle on My M	Glen Campbell	24.99	1997-02-18	\N	10858
B0000032AP	Greatest Hits, Vol. 1	The Kinks	\N	1989-03-28	Rhino Records	2762
B0000032WJ	The Dionne Warwick CollectionHer All-Time Greatest	Dionne Warwick	16.99	\N	Rhino Records	2211
B0000032WL	Something/Anything?	Todd Rundgren	16.99	\N	Rhino Records	3886
B00000334M	For The Lonely18 Greatest Hits	Roy Orbison	17.98	\N	Rhino Records	34687
B00000337M	The Mel TormCollection [BOX SET]	Mel Torme	53.99	1996-06-04	Rhino Records	28091
B000003G8E	Star Wars, A New HopeThe Original Motion Picture S	The Star Wars Trilogy (1997 Release)	34.98	\N	Rca	19685
B000003N7G	A Love Supreme	John Coltrane	13.99	1964-12-09	Grp Records	442
B000003TA4	Nevermind	Nirvana	13.49	1991-09-24	\N	775
B000003TAP	August and Everything After	Counting Crows	13.99	1993-09-14	\N	552
B0000041XX	Carreras Domingo Pavarotti ~ the three tenor	Francesco Cilea	16.49	\N	\N	1889
B0000042H4	Wagner - Der Ring des Nibelungen (Ring Cycle) / Si	Richard Wagner	163.99	\N	\N	10982
B0000046NK	First Issue-Dinah Washington S	Dinah Washington	22.98	1993-06-22	\N	31853
B00000470C	Irving Berlin Songbook	Fred Astaire	11.98	\N	\N	27155
B0000047EG	Ella Fitzgerald Sings The Cole Porter Songbook	Cole Porter (Tribute)	30.49	\N	\N	729
B000004CXU	Handel - Messiah / Nelson Kirkby Watkinson	George Frideric Handel	30.99	\N	\N	13310
B000005J56	Buena Vista Social Club	Ry Cooder	13.49	1997-09-16	Wea/Atlantic/Nonesuch	285
B000005YZM	Odessey & Oracle30th Anniversary Edition [IMPORT]	The Zombies	14.99	\N	Big Beat UK	1970
B0000060NA	Songs in the Key of Life	Stevie Wonder	\N	1976-09-28	Uni/Motown	2047
B00000638D	N Sync	'N Sync	14.99	1998-03-24	Rca	6590
B000006NZV	Version 2.0	Garbage	14.99	1998-05-12	Almo Sounds	2482
B000006OBP	September of My Years [ORIGINAL RECORDING REMASTER	Frank Sinatra	11.98	\N	\N	4457
B000006OHD	In the Wee Small Hours [ORIGINAL RECORDING REMASTE	Frank Sinatra	13.99	\N	Capitol	723
B000006OHF	Frank Sinatra Sings for Only the Lonely [ORIGINAL 	Frank Sinatra	14.99	\N	Capitol	1963
B000006OHJ	Greatest HitsKing of Cool	Dean Martin	13.49	1998-06-02	Capitol	445
B000006OJ7	Endlessly--The Best Of Brook Benton	Brook Benton	14.99	1998-07-14	Rhino Records	15408
B000006ONF	Les MiserablesOriginal London Cast Recording [CAST	Alain Boublil	31.49	\N	Loud Records	1749
B000007OWW	The Best of Tom Jones [Polygram]	Tom Jones	13.99	1998-06-16	\N	1337
B000007Q8H	The Best Of James	James	14.99	1998-06-30	\N	9372
B0000087QO	Parallel Lines	Blondie	\N	\N	Chrys	7421
B000008O4G	The Hits	Garth Brooks	\N	\N	Emd/Capitol	1151
B00000ADG2	The Miseducation Of Lauryn Hill	Lauryn Hill	13.98	1998-08-25	Sony	1834
B00000AEV0	A Swingin' Affair! [ORIGINAL RECORDING REMASTERED]	Frank Sinatra	14.99	\N	Capitol	4428
B00000AF99	Best Of	House Of Love (London)	14.99	1998-09-01	\N	20646
B00000AFEZ	Sarah Vaughan Sings George Gershwin	Sarah Vaughan	33.98	\N	\N	34922
B00000AFFF	Painted from Memory [US]	Elvis Costello	14.99	1998-09-29	\N	2264
B00000AFQT	MozartRequiem / Davis (Penguin Music Classics Seri	Wolfgang Amadeus Mozart	11.98	\N	\N	6243
B00000AG8K	Dizzy up the Girl	Goo Goo Dolls	13.99	1998-09-22	\N	1575
B00000DCHF	Nylon Curtain [ORIGINAL RECORDING REMASTERED]	Billy Joel	9.98	\N	Sony	14090
B00000DCHI	Greatest Hits Vol. 1-2 [ORIGINAL RECORDING REMASTE	Billy Joel	25.49	\N	Sony	784
B00000DCI5	The Best of Miss Peggy Lee	Peggy Lee	14.99	1998-10-20	Capitol	3380
B00000DFTD	FanMail [EXPLICIT LYRICS]	TLC	14.99	1999-02-23	La Face	10660
B00000DMJG	Double Live [LIVE] [BOX SET]	Garth Brooks	24.49	1998-11-17	Capitol	3073
B00000F1D3	Believe	Cher	13.99	1998-11-10	\N	1573
B00000G1IL	Baby One More Time [ENHANCED CD]	Britney Spears	14.99	1999-01-12	Jive	3735
B00000HZEQ	Dusty in Memphis [Deluxe Edition] [EXTRA TRACKS]	Dusty Springfield	14.99	\N	Rhino Records	1054
B00000IOOE	Millennium	Backstreet Boys	14.99	1999-05-18	Jive	3612
B00000IOSU	Mirrorball [LIVE]	Sarah McLachlan	13.99	1999-06-15	Arista	300
B00000IQMT	Star Wars Episode IThe Phantom Menace - Original M	John Williams	13.98	1999-05-04	Sony	6974
B00000IWQV	Darlings of Wapping Wharf Launderette	The Small Faces	14.99	\N	\N	13095
B00000IX6H	Ricky Martin [US 1999]	Ricky Martin	13.98	1999-05-11	Sony	4520
B00000J2PH	Tapestry [ORIGINAL RECORDING REMASTERED] [EXTRA TR	Carole King	11.98	\N	Sony	157
B00000J7J4	Supernatural	Santana	13.28	1999-06-15	Bmg/Arista	336
B00000JJQK	Pet Sounds [IMPORT] [ORIGINAL RECORDING REMASTERED	The Beach Boys	\N	\N	Emi O	628
B00000K4ES	Yellow Submarine [ORIGINAL RECORDING REMASTERED]	The Beatles	14.99	1999-09-14	Capitol	2025
B00001R3GI	Exile On Main Street [Limited Edition] [ORIGINAL R	The Rolling Stones	\N	\N	Emd/Virgin	4745
B00001R3O9	Fox Sports Presents Game Time	Various Artists - Pop	\N	1999-09-28	Emd/Priority	12603
B00002MZ41	The Best of Simon & Garfunkel	Simon & Garfunkel	13.49	1999-11-16	Sony	236
B00004NRTD	Equally Cursed & Blessed	Catatonia	17.98	2000-03-28	Atlantic	13646
B00004R84V	The Greatest Hits	Whitney Houston	22.99	2000-05-16	Arista	869
B00004SBGD	The Man Who [EXTRA TRACKS]	Travis	11.98	2000-04-04	Sony	1598
\.

COPY castings (movie_id, actor_id, ord) FROM stdin;
972	588	1
849	588	2
1575	588	3
1835	588	1
47	590	4
334	590	5
368	590	2
549	590	4
886	591	5
882	591	4
1391	591	4
1409	591	6
14	591	6
625	591	2
513	591	2
244	592	1
639	592	1
560	592	1
1087	594	3
868	594	2
1340	594	2
82	594	3
621	594	2
669	594	2
788	596	6
1112	596	8
1463	596	5
1557	596	4
1665	596	4
262	596	2
533	596	3
209	601	3
349	601	3
472	601	3
402	601	3
438	601	2
410	601	3
1633	602	1
204	602	1
244	602	2
137	602	4
1652	603	2
126	603	2
202	603	2
79	603	5
658	603	4
548	603	3
1015	605	2
1030	605	3
1007	605	2
1210	605	5
569	605	3
657	605	7
642	605	8
1361	608	1
1291	608	4
1639	608	3
1697	608	1
891	609	2
1201	609	6
1408	609	2
190	609	5
79	609	7
81	609	4
730	609	2
814	610	2
1322	610	1
1734	610	1
1755	610	3
740	611	5
1781	611	1
214	611	8
284	611	2
370	611	2
503	611	8
1085	613	2
784	613	2
1596	613	1
343	613	2
525	613	4
742	622	3
752	622	2
1437	622	5
1375	622	4
1335	622	3
452	622	3
822	623	3
1434	623	9
1663	623	2
323	623	6
717	623	1
444	623	5
905	625	1
165	625	1
383	625	1
1222	626	3
1483	626	1
1650	626	2
222	626	1
851	629	6
894	629	2
1197	629	5
270	629	4
149	629	6
207	629	3
1237	634	1
49	634	1
422	634	1
898	635	5
1355	635	4
1203	635	7
1678	635	8
352	635	2
567	635	3
640	635	3
956	637	9
1458	637	5
1431	637	5
1573	637	3
312	637	9
571	637	4
688	637	5
1377	638	2
1188	638	3
1843	638	1
691	638	4
662	638	4
1472	640	1
236	640	4
4	640	2
381	640	2
1820	643	7
1663	643	3
257	643	5
35	643	3
333	643	8
493	643	5
1036	644	1
1106	644	4
1550	644	4
837	645	4
1806	645	2
1618	645	2
658	645	3
616	645	5
462	645	4
1128	646	8
220	646	4
119	646	3
550	646	6
669	646	5
611	646	1
802	647	4
1324	647	4
1284	647	5
1421	647	4
1239	647	5
287	647	9
497	647	9
1075	648	6
945	648	5
1424	648	4
1182	648	8
1727	648	1
362	648	2
826	649	1
1164	649	1
1116	649	1
792	650	1
884	650	6
1664	650	1
119	650	7
328	650	4
853	656	7
944	656	6
1221	656	2
1253	656	2
1370	656	6
124	656	8
151	656	7
632	656	6
592	656	3
1045	659	2
1346	659	2
1342	659	3
1421	659	3
135	659	1
1073	1	1
921	1	1
1169	1	1
1244	1	1
1121	1	1
1210	1	2
1318	1	1
1173	1	7
1812	1	2
1648	1	1
1544	1	1
1578	1	1
1770	1	1
1559	1	1
208	1	1
254	1	1
705	1	9
642	1	1
724	1	8
1027	2	1
1061	2	2
1098	2	1
769	2	1
812	2	1
1440	2	1
1111	2	1
1433	2	1
1362	2	1
1332	2	1
1282	2	1
1779	2	1
1518	2	1
298	2	1
118	2	1
249	2	1
626	2	1
651	2	1
657	2	1
680	2	2
733	3	1
794	3	1
1054	3	1
881	3	1
1268	3	1
1486	3	5
1610	3	1
1742	3	1
155	3	1
343	3	3
43	3	1
247	3	2
253	3	3
61	3	4
149	3	1
65	3	1
312	3	1
202	3	1
342	3	1
196	3	1
80	3	2
89	3	2
122	3	5
163	3	1
372	3	1
684	3	2
495	3	1
428	3	4
645	3	6
880	4	1
747	4	1
1045	4	3
810	4	1
771	4	1
801	4	1
1232	4	1
1363	4	1
1185	4	9
1365	4	7
1644	4	1
1778	4	1
1622	4	1
260	4	1
96	4	1
37	4	2
167	4	4
51	4	1
199	4	1
122	4	2
393	4	1
501	4	2
380	4	3
423	4	1
479	4	1
643	4	1
579	4	1
806	5	1
789	5	1
762	5	1
1083	5	1
897	5	1
1031	5	1
736	5	1
995	5	1
828	5	1
903	5	1
1490	5	5
1634	5	3
1646	5	1
254	5	11
261	5	1
607	5	1
703	5	1
606	5	1
441	5	1
428	5	1
369	5	1
783	6	1
980	6	1
891	6	1
764	6	1
865	6	1
243	6	1
11	6	1
103	6	1
356	6	1
38	6	1
37	6	1
5	6	2
13	6	2
344	6	1
1	6	2
14	6	1
45	6	10
117	6	1
662	6	1
553	6	1
371	6	12
436	6	1
700	6	9
429	6	1
482	6	1
811	7	1
1018	7	1
902	7	1
908	7	6
926	7	1
1235	7	1
1642	7	1
1732	7	1
1621	7	1
265	7	2
259	7	1
302	7	3
183	7	2
297	7	1
48	7	1
29	7	1
347	7	1
368	7	1
382	7	1
372	7	2
520	7	9
574	7	15
842	8	1
849	8	1
1043	8	1
813	8	2
933	8	1
1310	8	1
53	8	1
224	8	1
57	8	1
16	8	1
320	8	6
219	8	1
181	8	1
8	8	1
73	8	1
269	8	1
116	8	1
513	8	1
1009	9	1
925	9	1
1390	9	1
1794	9	1
130	9	1
295	9	1
107	9	1
91	9	1
46	9	1
251	9	1
20	9	1
203	9	1
406	9	1
403	9	1
477	9	1
676	9	1
964	10	1
851	10	1
818	10	3
1204	10	1
1678	10	1
109	10	1
233	10	1
120	10	1
210	10	1
122	10	1
490	10	1
635	10	1
680	10	1
699	10	1
575	10	1
1037	12	1
1284	12	1
1276	12	1
1132	12	1
1765	12	1
136	12	2
80	12	1
266	12	1
268	12	1
364	12	1
12	12	2
186	12	1
350	12	1
61	12	1
437	12	1
543	12	1
547	12	1
567	12	4
498	12	2
1378	13	1
1188	13	1
1114	13	3
1337	13	2
1310	13	2
1115	13	1
1822	13	4
31	13	2
182	13	1
42	13	1
58	13	1
18	13	1
3	13	12
278	13	1
30	13	1
197	13	1
562	13	2
604	13	3
379	13	1
591	13	1
1002	14	3
1049	14	1
1190	14	1
1355	14	1
1212	14	1
1352	14	1
1523	14	1
1577	14	1
1494	14	1
359	14	1
670	14	1
609	14	1
625	14	1
506	14	9
466	14	1
577	14	6
640	14	1
516	14	4
885	15	1
1021	15	1
776	15	11
1008	15	2
1086	15	1
813	15	1
1313	15	7
1171	15	13
1167	15	1
1355	15	2
1219	15	1
1407	15	2
1464	15	1
1676	15	3
1756	15	4
1666	15	7
131	15	4
285	15	6
67	15	2
254	15	2
345	15	2
108	15	2
103	15	13
581	15	3
624	15	5
468	15	2
781	16	1
945	16	1
763	16	2
851	16	2
863	16	2
1185	16	11
1383	16	2
1184	16	2
1204	16	3
1604	16	4
1528	16	3
1611	16	2
174	16	2
279	16	2
118	16	2
347	16	2
258	16	2
270	16	2
254	16	6
319	16	3
521	16	1
526	16	4
657	16	2
665	16	1
648	16	1
700	16	1
770	17	2
844	17	2
1065	17	1
1146	17	2
1292	17	2
1285	17	7
1688	17	7
1736	17	2
1811	17	1
62	17	2
157	17	1
140	17	1
274	17	1
322	17	1
51	17	2
255	17	1
568	17	1
385	17	1
395	17	1
840	19	7
1618	19	5
79	19	1
83	19	1
60	19	2
99	19	1
134	19	1
88	19	1
319	19	1
612	19	1
450	19	1
559	19	1
666	19	1
630	19	1
637	19	2
1034	20	1
831	20	1
775	20	1
1160	20	3
1574	20	2
125	20	1
339	20	1
207	20	1
492	20	9
623	20	1
654	20	1
430	20	1
484	20	1
544	20	1
456	20	1
1082	21	6
1466	21	3
371	21	2
918	22	3
774	22	1
1047	22	1
947	22	1
1050	22	1
970	22	1
1419	22	1
1196	22	1
1753	22	1
235	22	3
289	22	1
191	22	1
173	22	1
311	22	1
835	24	1
967	24	1
874	24	4
978	24	9
1109	24	4
1689	24	1
1616	24	2
1627	24	2
1600	24	1
1802	24	2
205	24	2
279	24	4
28	24	10
406	24	2
654	24	3
576	24	2
456	24	3
930	25	1
1026	25	2
954	25	1
1131	25	5
1621	25	2
1740	25	1
234	25	8
2	25	1
305	25	2
83	25	10
304	25	2
361	25	1
246	25	1
575	25	3
663	25	3
861	26	1
1071	26	1
869	26	2
1272	26	1
1288	26	1
1539	26	1
1581	26	11
267	26	1
113	26	11
110	26	1
228	26	1
266	26	2
220	26	1
546	26	6
373	26	1
573	26	1
558	26	1
1077	27	1
1344	27	1
1778	27	2
1822	27	1
123	27	2
336	27	1
334	27	1
247	27	1
60	27	1
315	27	1
265	27	1
253	27	7
416	27	1
567	27	14
400	27	1
583	27	2
1801	28	6
946	29	1
1628	29	1
1521	29	5
1624	29	1
263	29	6
195	29	6
719	29	11
506	29	12
970	30	3
789	30	2
1075	30	2
1017	30	1
1810	30	1
1607	30	2
360	30	1
343	30	1
248	30	1
227	30	1
566	30	1
698	30	1
594	30	1
712	30	1
674	30	1
866	32	1
969	32	2
1016	32	2
767	32	1
1377	32	4
1131	32	1
1264	32	2
1132	32	2
1479	32	4
124	32	6
140	32	3
131	32	1
70	32	1
234	32	1
481	32	1
550	32	15
414	32	1
599	32	1
838	33	1
852	33	2
1315	33	1
1163	33	1
1123	33	1
1455	33	1
1775	33	1
1565	33	1
359	33	2
275	33	1
401	33	3
419	33	1
530	33	1
431	33	2
545	33	2
1548	34	1
3	34	1
279	34	1
273	34	1
300	34	1
141	34	1
62	34	1
722	34	1
634	34	1
600	34	1
529	34	5
462	34	1
537	34	1
1012	35	1
1011	35	1
864	35	1
1258	35	2
1278	35	1
1370	35	1
1296	35	1
1476	35	1
1701	35	3
304	35	1
90	35	1
302	35	1
578	35	1
917	36	1
760	36	2
779	36	1
1239	36	1
225	36	2
285	36	3
161	36	2
652	36	1
400	36	2
730	36	1
835	37	7
1115	37	7
1604	37	6
264	37	1
603	37	7
600	37	13
1624	38	12
892	39	1
934	39	1
937	39	1
786	39	1
846	39	3
1323	39	2
1313	39	6
1753	39	2
1479	39	1
1497	39	4
231	39	3
363	39	1
15	39	1
500	39	3
386	39	3
1100	40	1
882	40	6
756	40	1
929	40	2
1334	40	2
1706	40	2
1675	40	1
168	40	2
311	40	2
169	40	1
265	40	3
232	40	1
250	40	1
525	40	2
491	40	1
588	40	1
1260	41	1
1216	41	1
1300	41	1
1645	41	1
238	41	12
162	41	2
270	41	1
269	41	2
354	41	1
452	41	1
588	41	2
604	41	1
632	41	1
507	41	1
900	42	1
989	42	2
785	42	1
1159	42	2
1114	42	1
1842	42	1
1528	42	1
1506	42	1
361	42	3
225	42	1
161	42	1
377	42	1
637	42	1
1039	43	1
802	43	1
874	43	3
877	43	9
1448	43	9
1261	43	1
1802	43	1
1662	43	5
154	43	1
28	43	1
63	43	1
134	43	2
86	43	2
47	43	1
493	43	1
1099	44	5
1391	44	9
1238	44	1
1471	44	2
1801	44	10
1529	44	2
1675	44	3
1783	44	3
1631	44	5
12	44	4
300	44	4
139	44	1
322	44	12
121	44	12
45	44	2
143	44	8
61	44	2
430	44	2
634	44	2
652	44	2
668	44	4
630	44	2
802	45	2
748	45	1
1012	45	2
1024	45	2
970	45	2
894	45	1
1035	45	2
856	45	2
1284	45	2
1239	45	2
1115	45	2
1275	45	10
1845	45	11
1546	45	1
1644	45	2
281	45	3
350	45	3
205	45	3
493	45	4
506	45	3
429	45	2
1067	46	5
1048	46	2
904	46	1
1367	46	4
1176	46	12
1431	46	3
1668	46	1
1680	46	4
53	46	3
253	46	1
134	46	4
229	46	1
533	46	2
466	46	5
587	46	1
571	46	2
525	46	3
1030	48	2
881	48	2
1391	48	1
1480	48	5
310	48	3
313	48	5
467	48	2
520	48	1
751	49	1
1054	49	2
880	49	2
1294	49	1
1277	49	1
1191	49	1
1243	49	1
1585	49	1
1654	49	1
213	49	1
497	49	2
369	49	2
825	50	2
1161	50	1
1180	50	2
1479	50	3
1817	50	1
1481	50	2
1778	50	3
126	50	1
162	50	1
277	50	1
328	50	1
338	50	2
76	50	1
1045	51	8
1023	51	2
1097	51	1
1287	51	2
1204	51	2
1281	51	1
1532	51	1
1604	51	3
1675	51	2
364	51	4
333	51	4
465	51	1
661	51	1
394	51	1
986	52	1
1471	52	1
1133	52	1
1404	52	3
1774	52	1
1686	52	1
1491	52	1
1575	52	2
205	52	1
86	52	1
166	52	6
745	53	2
973	53	1
1184	53	1
1129	53	1
1666	53	10
1657	53	6
281	53	5
136	53	1
238	53	13
231	53	4
84	53	1
421	53	1
670	53	8
470	53	2
692	53	1
1196	54	2
1224	54	1
1295	54	1
1541	54	3
365	54	10
24	54	1
215	54	2
245	54	1
108	54	3
35	54	2
345	54	3
152	54	1
482	54	2
619	54	1
408	54	2
776	55	7
868	55	1
1297	55	7
1407	55	1
1340	55	1
1171	55	12
1630	55	1
1728	55	2
1553	55	1
337	55	1
621	55	1
577	55	5
669	55	1
596	55	1
1093	56	1
1283	56	1
1555	56	1
80	56	3
293	56	1
83	56	3
144	56	4
248	56	2
160	56	1
506	56	1
633	56	1
484	56	2
503	56	2
954	57	2
825	57	1
1016	57	1
1240	57	7
1342	57	2
1363	57	3
1413	57	1
1532	57	2
1826	57	5
255	57	2
224	57	2
83	57	14
181	57	7
104	57	2
503	57	9
452	57	2
658	57	1
661	57	3
739	58	1
1019	58	2
899	58	1
742	58	4
890	58	4
1264	58	10
1462	58	1
1820	58	1
1747	58	1
1761	58	1
113	58	3
76	58	9
492	58	1
532	58	1
1237	59	6
49	59	4
422	59	3
1117	60	1
1122	60	1
1662	60	1
567	60	1
499	60	9
526	60	1
901	61	3
1035	61	1
818	61	1
1002	61	2
1325	61	2
1313	61	10
1156	61	2
1657	61	1
365	61	1
100	61	3
330	61	1
310	61	2
658	61	2
731	61	5
408	61	1
760	63	1
1176	63	1
1410	63	1
1325	63	1
1450	63	1
1607	63	1
1738	63	1
1604	63	1
149	63	5
562	63	1
651	63	2
775	64	2
884	64	4
961	64	5
779	64	2
1270	64	2
1397	64	1
1407	64	4
1742	64	3
1709	64	5
1783	64	1
218	64	2
134	64	3
538	64	1
598	64	1
1088	70	1
773	70	1
1394	70	1
1279	70	1
1827	70	1
1576	70	2
148	70	1
26	70	1
339	70	4
192	70	1
508	70	1
831	71	4
1419	71	2
1106	71	5
1391	71	3
1209	71	3
1156	71	3
1201	71	4
1313	71	1
1793	71	1
1690	71	2
1840	71	1
1826	71	1
1684	71	2
359	71	10
142	71	3
531	71	14
611	71	7
497	71	3
735	72	1
759	72	9
1377	72	9
1562	72	1
337	72	5
315	72	6
194	72	2
108	72	1
78	72	1
345	72	1
229	72	8
228	72	8
679	72	1
399	72	4
593	72	1
999	73	8
880	73	3
1137	73	1
1472	73	2
1117	73	3
1475	73	1
65	73	4
346	73	3
201	73	3
3	73	4
292	73	2
39	73	1
114	73	1
443	73	4
428	73	2
534	73	6
750	74	1
1152	74	1
1429	74	1
1502	74	1
1807	74	1
1688	74	1
168	74	1
459	74	1
643	74	2
491	74	2
857	75	1
952	75	1
948	75	1
1293	75	1
1696	75	1
94	75	1
646	75	1
455	75	1
667	75	2
478	75	1
931	76	1
1007	76	3
1175	76	1
1240	76	2
1545	76	5
1616	76	1
1734	76	4
6	76	5
146	76	2
187	76	2
334	76	4
223	76	4
10	76	1
543	76	6
599	76	2
482	76	10
939	77	1
1138	77	3
1110	77	1
1627	77	1
1604	77	5
133	77	1
106	77	15
352	77	1
339	77	10
679	77	2
371	77	1
708	77	3
1721	78	11
1042	83	5
1120	83	2
1484	83	1
1789	83	1
1550	83	1
1519	83	2
1508	83	2
1709	83	1
287	83	5
640	83	2
705	83	3
816	84	2
992	84	1
743	84	1
1162	84	1
1476	84	4
223	84	2
242	84	1
318	84	1
84	84	3
506	84	4
407	84	1
369	84	3
869	85	1
1420	85	1
1180	85	1
1801	85	3
258	85	1
12	85	1
45	85	1
694	85	2
486	85	1
871	88	2
1048	88	1
1370	88	7
1445	88	1
1335	88	4
1701	88	5
1665	88	1
233	88	4
309	88	2
273	88	2
144	88	1
509	88	4
393	88	2
629	88	11
953	89	2
1317	89	3
1672	89	1
1510	89	4
278	89	2
182	89	3
336	89	3
187	89	1
144	89	9
356	89	7
223	89	3
3	89	2
308	89	3
527	89	1
1460	90	2
154	90	9
973	91	2
871	91	1
1095	91	1
1310	91	6
21	91	1
2	91	2
334	91	3
139	91	5
118	91	3
162	91	4
233	91	2
581	91	1
500	91	1
891	92	6
1210	92	4
315	92	7
246	92	11
88	92	5
634	92	15
1240	93	1
1169	93	7
1394	93	2
1529	93	1
1629	93	9
1618	93	4
1742	93	2
179	93	2
125	93	2
124	93	1
620	93	1
514	93	1
547	93	2
741	94	3
921	94	2
1352	94	2
1403	94	1
1413	94	2
1828	94	1
1662	94	2
1559	94	2
61	94	3
12	94	3
208	94	2
609	94	2
437	94	2
908	95	1
959	95	1
1366	95	1
1383	95	1
1244	95	8
1371	95	1
1408	95	1
1826	95	7
190	95	1
236	95	7
169	95	2
386	95	15
877	96	1
963	96	1
923	96	1
1450	96	3
1308	96	1
1353	96	6
1274	96	1
1685	96	1
1657	96	5
164	96	6
731	96	4
443	96	6
496	97	8
1048	98	3
1141	98	1
1701	98	2
1783	98	2
1495	98	1
1606	98	1
1516	98	7
117	98	2
231	98	1
30	98	2
144	98	5
708	98	1
737	99	3
1004	99	1
942	99	10
988	99	2
1272	99	4
1136	99	14
1221	99	1
1161	99	2
1516	99	8
1513	99	3
1725	99	1
1843	99	10
144	99	7
3	99	11
208	99	9
254	99	13
149	99	4
205	99	4
110	99	10
656	99	10
723	99	2
794	100	8
855	100	1
929	100	4
1058	100	1
761	100	1
749	100	2
1362	100	3
1753	100	8
7	100	1
276	100	11
17	100	1
353	100	1
1138	101	1
1206	101	1
1324	101	2
1376	101	1
1123	101	2
1706	101	1
1557	101	1
312	101	2
124	101	12
620	101	2
545	101	1
963	102	7
967	102	6
809	102	2
780	102	7
830	102	1
1204	102	11
1152	102	3
1437	102	3
1844	102	1
1808	102	1
242	102	2
195	102	1
181	102	8
19	102	2
653	102	2
1047	104	2
1006	104	3
811	104	3
1410	104	2
1471	104	3
1257	104	1
117	104	3
281	104	1
731	104	2
652	104	3
623	104	2
463	104	2
1081	106	1
886	106	1
1409	106	2
1208	106	4
1160	106	2
1676	106	1
1799	106	1
237	106	3
543	106	2
531	106	3
707	106	1
854	108	21
735	108	2
1828	108	3
108	108	4
345	108	4
756	112	2
1331	112	1
1377	112	11
1788	112	2
1608	112	3
1528	112	2
201	112	1
179	112	1
193	112	2
493	112	3
618	112	1
575	112	2
1027	113	4
897	113	3
934	113	12
978	113	1
1178	113	1
1109	113	5
1827	113	2
1477	113	4
1798	113	2
364	113	5
155	113	4
342	113	2
610	113	1
462	113	8
937	114	2
1354	114	1
1505	114	8
1754	114	5
1668	114	3
1798	114	1
1477	114	1
96	114	2
166	114	1
543	114	3
482	114	4
971	115	2
1298	115	1
1173	115	1
1343	115	8
1589	115	1
1692	115	1
1609	115	1
41	115	1
474	115	1
790	116	2
856	116	3
1030	116	10
1410	116	4
1421	116	1
1149	116	2
166	116	12
152	116	2
231	116	2
309	116	1
220	116	2
597	116	1
523	116	1
1069	117	10
981	117	1
1641	117	13
1591	117	1
1739	117	1
321	117	2
605	117	1
799	118	1
829	118	1
1466	118	4
1379	118	1
87	118	1
97	118	1
478	118	3
453	118	2
953	119	1
769	119	2
1278	119	2
142	119	4
38	119	2
160	119	2
572	119	1
405	119	1
497	119	1
618	119	2
949	120	1
1022	120	1
792	120	2
1148	120	1
1367	120	1
1744	120	6
1684	120	7
1605	120	6
1647	120	2
563	120	2
675	120	1
542	120	6
1079	121	1
1515	121	4
1538	121	1
1521	121	1
147	121	4
517	121	1
367	121	1
650	121	1
671	121	3
737	122	1
875	122	1
1187	122	1
1393	122	2
1442	122	1
1449	122	1
1474	122	2
115	122	1
417	122	2
804	123	15
776	123	14
1008	123	4
1484	123	5
1823	123	7
17	123	13
5	123	9
13	123	9
702	123	13
719	123	2
809	124	3
1451	124	3
1274	124	10
1636	124	1
1660	124	2
1748	124	2
66	124	5
44	124	11
160	124	8
185	124	2
358	124	1
399	124	2
701	124	2
585	124	1
781	125	3
1065	125	8
1285	125	4
1439	125	3
1395	125	8
1516	125	6
1801	125	14
1631	125	6
284	125	3
84	125	2
144	125	3
45	125	8
377	125	15
603	125	9
409	125	9
561	125	2
1102	126	3
846	126	1
1055	126	12
844	126	7
1362	126	15
240	126	1
160	126	3
25	126	1
338	126	1
184	126	1
415	126	1
1044	127	10
942	127	6
902	127	8
767	127	2
1423	127	3
1363	127	4
1122	127	4
1297	127	2
1184	127	6
1771	127	13
1810	127	2
1506	127	3
1601	127	2
1765	127	2
242	127	5
159	127	5
400	127	3
474	127	4
765	128	7
209	128	1
280	128	11
349	128	1
438	128	1
402	128	1
410	128	1
472	128	1
1156	129	8
585	129	11
1473	130	4
1597	130	3
1747	130	6
1839	130	9
1547	130	1
91	130	4
4	130	7
53	130	2
248	130	4
346	130	2
85	130	2
46	130	13
217	130	1
24	130	6
611	130	4
691	130	6
840	131	6
742	131	1
824	131	2
884	131	1
1335	131	1
1110	131	2
1497	131	1
1514	131	1
119	131	1
886	132	2
857	132	3
1081	132	2
954	132	3
1409	132	1
1345	132	2
1413	132	4
1598	132	1
1698	132	1
1795	132	1
1380	133	8
1016	134	4
942	134	2
782	134	5
1133	134	10
1686	134	2
1831	134	4
1598	134	4
1572	134	2
177	134	2
192	134	2
148	134	2
26	134	2
438	134	11
487	134	4
388	134	3
714	134	3
769	135	3
775	135	3
1085	135	3
837	135	1
896	135	12
822	135	2
1128	135	3
1803	135	2
223	135	8
343	135	4
334	135	6
632	135	3
763	136	1
949	136	6
784	136	1
897	136	2
1256	136	1
1540	136	1
1637	136	6
336	136	2
130	136	3
207	136	2
254	136	12
155	136	2
1033	137	1
919	137	1
1199	137	1
1254	137	1
1314	137	10
1681	137	1
1787	137	1
1694	137	1
748	138	2
111	138	11
188	138	1
107	138	2
112	138	1
180	138	1
114	138	2
124	138	5
706	138	1
627	138	1
807	139	14
947	142	2
901	142	2
1085	142	1
1135	142	1
1167	142	2
1527	142	2
1600	142	4
226	142	2
91	142	2
100	142	2
696	142	1
922	145	1
589	145	1
715	145	1
740	147	3
772	147	2
1839	147	3
1494	147	2
1763	147	1
108	147	5
195	147	3
345	147	5
670	147	5
608	147	1
956	151	1
1155	151	1
1819	151	3
1534	151	4
151	151	1
48	151	3
645	151	1
597	151	2
693	151	1
908	152	4
877	152	6
902	152	3
1077	152	4
1319	152	4
1377	152	3
1494	152	4
116	152	3
234	152	7
131	152	5
304	152	3
330	152	2
482	152	5
491	152	3
714	152	4
990	154	2
874	154	5
915	154	4
898	154	3
1385	154	1
1257	154	2
1304	154	1
138	154	2
184	154	2
84	154	5
622	154	1
1110	157	6
1116	157	14
1254	157	5
1278	157	5
113	157	4
297	157	2
300	157	3
443	157	12
528	157	4
537	157	3
677	157	1
425	157	1
514	157	12
835	158	2
1374	158	1
1509	158	1
1642	158	2
196	158	2
104	158	1
313	158	10
36	158	13
511	158	1
642	158	7
940	159	11
1057	159	1
816	159	1
1361	159	5
1153	159	1
1449	159	7
98	159	1
58	159	3
95	159	1
29	159	3
887	160	3
917	160	4
772	160	3
777	160	4
771	160	3
1468	160	9
1155	160	6
1299	160	13
1705	160	4
1693	160	1
135	160	2
403	160	3
368	160	4
705	160	8
1412	161	11
1422	161	1
1659	161	1
174	161	3
79	161	2
80	161	4
416	161	2
720	161	3
614	161	3
576	161	3
620	161	8
396	161	1
1416	162	1
1206	162	4
1516	162	9
1661	162	2
1839	162	5
1717	162	12
344	162	2
81	162	3
113	162	2
389	162	2
407	162	3
433	162	5
568	162	3
648	162	2
1011	163	5
858	163	11
1260	163	14
1377	163	13
1475	163	2
1774	163	5
1661	163	5
327	163	1
90	163	15
524	163	5
392	163	3
586	163	8
637	163	5
569	163	1
706	163	2
705	163	15
911	164	1
1267	164	2
1312	164	1
1744	164	1
1751	164	1
312	164	7
121	164	1
690	164	1
1396	165	14
1108	165	4
1189	165	1
1710	165	1
364	165	11
91	165	9
248	165	7
211	165	1
362	165	1
522	165	2
519	165	1
1289	166	1
1451	166	1
1156	166	6
1798	166	4
1546	166	3
1486	166	10
246	166	4
454	166	2
523	166	9
534	166	1
801	167	7
1135	167	2
1238	167	2
1716	167	4
1704	167	1
1812	167	14
1731	167	1
1766	167	1
226	167	1
271	167	6
594	167	4
856	168	1
910	168	1
803	168	1
1149	168	1
1682	168	1
1753	168	5
1816	168	3
355	168	5
556	168	11
1014	169	1
743	169	2
1814	169	1
1822	169	2
88	169	2
160	169	4
688	169	1
627	169	2
630	169	3
666	169	2
920	170	1
734	170	1
1103	170	2
1466	170	1
1631	170	1
1741	170	1
644	170	1
998	171	1
1637	171	1
1519	171	1
1785	171	1
674	171	2
590	171	1
1102	172	1
941	172	1
1077	172	2
963	172	3
1351	172	1
1562	172	4
315	172	9
166	172	2
201	172	2
596	172	9
496	172	2
1039	173	2
844	173	1
963	173	2
978	173	2
1041	173	1
923	173	2
1572	173	1
456	173	2
654	173	2
934	174	4
756	174	3
1515	174	8
1777	174	2
1693	174	2
53	174	5
51	174	3
333	174	3
319	174	7
128	174	1
657	174	3
543	174	5
1576	175	5
973	176	4
1282	176	5
1359	176	6
1780	176	1
1607	176	6
1545	176	1
1555	176	4
246	176	3
333	176	5
628	176	8
531	176	8
587	176	2
650	176	5
1092	177	1
1673	177	1
296	177	1
81	177	1
327	177	3
7	177	3
506	177	2
380	177	1
1015	178	5
1252	178	1
1707	178	1
1644	178	3
665	178	3
636	178	1
740	179	1
1037	179	3
936	179	12
939	179	4
845	179	15
1281	179	4
1486	179	9
90	179	2
157	179	4
706	179	5
569	179	2
632	179	2
622	179	3
395	179	3
862	180	5
885	180	15
854	180	5
906	180	1
735	180	6
1322	180	2
1464	180	2
1407	180	3
1718	180	1
195	180	4
466	180	2
513	180	4
669	180	13
809	181	1
1449	181	2
95	181	13
98	181	2
29	181	2
176	181	1
8	181	9
576	181	1
524	181	1
452	181	5
989	182	4
917	182	2
869	182	3
1396	182	13
1288	182	3
1639	182	1
1611	182	3
1764	182	2
301	182	9
154	182	2
526	182	2
668	182	1
989	183	3
982	183	1
1173	183	9
1713	183	1
189	183	1
483	183	1
442	183	1
668	183	2
780	184	1
773	184	8
999	184	1
1132	184	3
1223	184	1
1479	184	2
217	184	3
158	184	8
437	184	8
1030	185	4
928	185	1
763	185	4
1268	185	3
1748	185	9
129	185	1
4	185	1
267	185	2
469	185	1
880	186	11
942	186	7
1162	186	6
1250	186	3
1187	186	2
1822	186	6
58	186	6
294	186	5
90	186	4
140	186	7
22	186	2
39	186	5
569	186	8
392	186	11
698	186	3
413	186	14
961	187	1
832	187	2
1183	187	2
1153	187	15
1827	187	12
365	187	7
110	187	2
489	187	1
714	187	5
388	187	5
373	187	6
653	187	1
1219	188	11
1187	188	3
1567	188	2
185	188	1
316	188	1
291	188	1
413	188	1
615	188	1
147	189	10
1102	190	2
977	190	4
908	190	5
782	190	4
1259	190	14
1455	190	2
19	190	3
496	190	1
731	190	3
506	190	5
1073	191	2
990	191	1
1210	191	3
1639	191	4
1812	191	10
1648	191	2
1770	191	2
1771	191	5
1544	191	4
704	191	1
705	191	4
926	192	2
1014	192	2
1353	192	10
1371	192	3
1108	192	1
1826	192	2
292	192	3
256	192	2
96	192	4
730	192	3
732	193	28
349	193	2
209	193	2
472	193	2
438	193	12
410	193	2
402	193	2
746	194	3
903	194	3
908	194	2
916	194	5
1092	194	3
861	194	4
1006	194	2
1001	194	4
1717	194	15
38	194	4
90	194	3
127	194	3
531	194	5
881	195	8
875	195	10
818	195	9
901	195	1
1237	195	2
1740	195	6
1577	195	4
49	195	2
100	195	1
156	195	8
501	195	1
422	195	2
899	202	4
779	202	5
838	202	3
861	202	5
1055	202	4
926	202	4
1225	202	4
1359	202	3
1551	202	7
223	202	5
482	202	8
525	202	5
674	202	5
1030	203	5
961	203	8
1266	203	2
1114	203	4
1376	203	2
1404	203	1
1385	203	2
1310	203	3
1777	203	1
1843	203	6
482	203	3
1792	205	1
1320	206	7
586	206	6
1324	207	1
1258	207	1
1669	207	1
1759	211	2
1733	211	2
1510	211	3
21	211	5
348	211	1
52	211	4
176	211	2
685	211	1
544	211	2
645	211	2
1076	213	1
1246	213	1
299	213	1
27	213	1
584	213	1
565	213	1
942	214	1
1034	214	2
1077	214	3
1342	214	1
1491	214	2
122	214	4
437	214	4
520	214	2
1005	215	2
749	215	1
912	215	1
1152	215	2
1737	215	2
65	215	2
15	215	2
55	215	3
899	216	3
1006	216	5
1449	216	3
1456	216	1
1520	216	1
1611	216	1
160	216	5
268	216	2
107	216	3
934	217	11
1065	217	6
970	217	5
1147	217	5
1802	217	4
1693	217	5
1627	217	9
1644	217	7
138	217	5
343	217	9
143	217	3
187	217	6
297	217	7
134	217	8
712	217	2
705	217	14
618	217	5
674	217	14
773	218	4
751	218	2
779	218	3
1243	218	2
1590	218	1
124	218	7
247	218	11
351	218	1
142	218	1
603	218	4
1258	219	6
301	219	1
259	219	3
178	219	1
156	219	1
145	219	1
557	219	1
1016	220	5
1030	220	1
1377	220	1
1192	220	2
347	220	7
126	220	4
131	220	6
327	220	6
645	220	3
444	220	1
1049	221	3
1486	221	7
1377	222	5
1735	222	1
231	222	6
162	222	3
85	222	4
36	222	1
630	222	5
631	222	1
532	222	2
840	223	2
965	223	1
780	223	6
1285	223	1
330	223	3
229	223	2
56	223	2
616	223	1
688	223	2
742	224	2
899	224	2
1046	224	1
1335	224	2
1476	224	2
134	224	5
164	224	2
106	224	5
223	224	9
525	224	1
999	225	5
1421	225	2
1292	225	8
1481	225	1
1684	225	3
254	225	3
363	225	3
123	225	1
598	225	3
645	225	5
746	226	4
861	226	9
1048	226	5
994	226	11
1457	226	6
1458	226	3
1798	226	10
127	226	10
352	226	5
117	226	8
22	226	1
247	226	8
138	226	4
618	226	14
444	226	3
634	226	4
475	226	11
770	227	7
1264	227	7
1263	227	1
1378	227	8
1627	227	4
1644	227	5
254	227	8
298	227	7
361	227	5
597	227	12
414	227	3
569	227	5
459	227	4
986	228	2
884	228	9
870	228	2
1177	228	5
1400	228	3
1823	228	14
1844	228	2
78	228	2
190	228	8
531	228	1
709	228	2
591	228	3
859	229	3
996	229	1
1142	229	1
1140	229	5
1557	229	3
17	229	2
50	229	1
398	229	3
1101	230	3
893	230	7
1306	230	3
1672	230	2
1676	230	4
1843	230	7
239	230	4
219	230	4
588	230	4
385	230	3
372	230	5
554	230	5
1069	231	1
1029	231	1
1121	231	8
1192	231	4
1641	231	1
127	231	2
564	231	6
396	231	2
538	231	2
840	232	4
890	232	1
1294	232	2
1584	232	1
218	232	1
357	232	2
470	232	1
1075	233	1
1050	233	2
741	233	2
1165	233	1
1577	233	2
1523	233	2
1728	233	1
562	233	3
818	234	4
1002	234	1
1592	234	2
1831	234	1
243	234	7
254	234	5
506	234	6
454	234	1
691	234	2
271	235	3
313	235	2
1069	236	2
787	236	1
726	236	1
723	236	1
729	236	1
613	236	1
800	237	4
755	237	1
102	237	1
272	237	1
75	237	1
656	237	1
885	238	2
1006	238	8
943	238	3
1260	238	7
1259	238	3
1106	238	11
1281	238	3
1705	238	8
1755	238	5
258	238	4
668	238	6
521	238	3
400	238	9
396	238	3
881	239	6
753	239	14
1047	239	5
1015	239	3
1177	239	2
89	239	4
30	239	3
35	239	6
440	239	1
433	239	3
467	239	13
501	239	5
713	239	6
1451	240	4
1831	240	15
1819	240	1
55	240	9
223	240	1
346	240	1
500	240	5
603	240	1
752	241	1
928	241	6
1113	241	1
1172	241	1
1689	241	12
127	241	1
188	241	2
112	241	2
830	242	2
1112	242	1
1368	242	6
56	242	3
338	242	7
444	242	6
512	242	12
597	242	5
1058	243	3
1545	243	2
151	243	2
3	243	3
107	243	4
281	243	7
502	243	1
616	243	2
574	243	12
380	243	2
1204	244	9
1197	244	1
1376	244	4
1477	244	3
1524	244	5
266	244	3
39	244	3
201	244	4
652	244	15
528	244	2
503	244	4
1035	245	7
918	245	8
1251	245	2
1430	245	1
1142	245	3
1814	245	9
512	245	1
527	245	4
389	245	1
741	246	6
1046	246	10
861	246	7
828	246	4
1404	246	14
1174	246	3
1170	246	3
1608	246	6
152	246	8
6	246	10
200	246	9
388	246	7
634	246	13
475	246	12
527	246	6
688	246	7
676	246	3
601	246	3
507	246	7
877	247	2
1021	247	2
1400	247	2
1165	247	9
1426	247	1
65	247	3
934	248	5
1439	248	1
1720	248	1
1688	248	5
89	248	5
177	248	1
265	248	4
445	248	6
764	249	3
969	249	3
1464	249	4
1209	249	1
1201	249	2
1117	249	2
1604	249	9
339	249	2
10	249	2
604	249	2
959	250	2
1292	250	1
1384	250	3
1567	250	3
1504	250	1
295	250	2
12	250	6
447	250	1
1243	251	3
1815	251	1
254	251	7
180	251	3
614	251	1
446	251	1
620	251	3
763	252	9
977	252	3
1188	252	7
1314	252	4
1439	252	12
1473	252	3
1713	252	8
24	252	5
133	252	13
46	252	5
333	252	12
317	252	6
245	252	10
463	252	6
573	252	3
946	253	12
732	253	35
1412	253	12
1173	253	4
288	253	3
40	253	1
522	253	1
1101	254	2
781	254	2
1251	254	4
1733	254	11
1697	254	3
1627	254	3
1814	254	3
333	254	6
652	254	6
705	254	1
430	254	3
985	255	2
763	255	11
1534	255	5
191	255	4
53	255	4
16	255	3
305	255	1
385	255	2
802	256	3
898	256	9
843	256	5
930	256	15
1375	256	1
1828	256	7
227	256	2
709	256	1
592	256	1
943	257	1
1393	257	1
1769	257	1
262	257	1
452	257	13
499	257	3
654	257	5
962	258	4
1307	258	2
201	258	7
253	258	13
33	258	2
144	258	6
21	258	2
662	258	2
638	258	2
647	258	1
733	259	10
1474	259	1
163	259	3
43	259	3
239	259	2
342	259	7
155	259	3
554	259	2
449	259	1
903	260	2
1410	260	5
1186	260	2
1830	260	2
294	260	1
434	260	2
595	260	10
439	260	1
1054	261	4
809	261	4
1394	261	5
1294	261	3
1439	261	2
129	261	13
547	261	4
674	261	4
710	261	1
711	261	2
1647	262	10
1024	263	9
886	263	9
1235	263	3
1297	263	6
1157	263	5
1761	263	4
1743	263	5
1596	263	4
188	263	11
291	263	2
327	263	7
201	263	5
411	263	9
1101	265	1
741	265	1
967	265	2
1138	265	2
1212	265	4
1600	265	2
1824	265	1
1121	267	9
1734	267	2
1755	267	1
263	267	2
306	267	1
198	267	1
526	267	9
697	267	2
1068	270	1
1305	270	1
111	270	1
984	277	1
1016	277	7
808	277	7
978	277	3
1170	277	1
1372	277	1
247	277	7
860	278	1
1156	278	5
1590	278	2
1840	278	7
293	278	2
148	278	5
192	278	6
533	278	1
559	278	3
1099	279	1
989	279	1
1764	279	1
271	279	1
583	279	1
939	280	2
877	280	3
1684	280	1
157	280	2
292	280	1
319	280	8
592	280	2
619	280	2
706	280	7
1263	282	6
1666	282	4
56	282	1
70	282	2
364	282	2
232	282	3
399	282	1
509	282	3
373	282	8
906	284	4
1167	284	3
1776	284	1
1786	284	1
239	284	1
554	284	1
1177	289	4
1316	289	1
1593	289	1
167	289	1
673	289	1
423	289	3
252	294	1
280	294	1
92	294	2
276	294	14
68	294	1
311	294	3
506	294	7
631	294	12
890	295	10
1036	295	5
824	295	1
843	295	2
1165	295	8
1457	295	4
1629	295	4
1540	295	3
73	295	13
35	295	4
568	295	9
594	295	7
750	296	4
1039	296	3
1089	296	4
1455	296	4
1150	296	12
1706	296	5
1796	296	4
1646	296	2
19	296	6
219	296	3
350	296	5
1086	297	2
797	297	2
771	297	5
1337	297	1
1116	297	4
1307	297	6
1477	297	2
86	297	3
652	297	4
656	297	11
779	298	6
866	298	2
1519	298	7
217	298	2
58	298	2
143	298	1
620	298	7
664	298	18
600	298	3
863	299	1
994	299	1
814	299	1
1508	299	7
258	299	3
521	299	2
386	299	2
990	300	3
770	300	5
898	300	1
1132	300	4
342	300	8
586	300	1
591	300	2
1009	301	3
838	301	4
1290	301	9
1354	301	4
1292	301	9
1232	301	2
1686	301	3
242	301	4
198	301	2
65	301	6
1054	302	5
1011	302	6
962	302	1
931	302	4
1384	302	2
1513	302	2
1516	302	3
6	302	3
373	302	2
890	303	3
944	303	3
1784	303	2
1598	303	5
148	303	3
26	303	3
192	303	5
663	303	1
1127	304	8
1306	304	2
1291	304	1
1829	304	1
1707	304	8
1777	304	4
34	304	1
280	304	8
877	305	4
870	305	5
793	305	4
1036	305	4
1464	305	9
1783	305	6
1802	305	9
1611	305	4
179	305	3
259	305	9
652	305	7
666	305	4
915	306	2
1004	306	7
1226	306	1
1412	306	10
1635	306	2
1801	306	16
1660	306	5
45	306	3
339	306	3
283	306	7
711	306	3
492	306	13
961	307	10
891	307	4
1089	307	5
1690	307	3
1551	307	2
146	307	12
73	307	3
60	307	9
408	307	10
999	308	2
1150	308	6
1307	308	5
1844	308	3
251	308	2
6	308	2
174	308	14
276	308	8
432	308	2
392	308	1
573	308	12
871	309	3
834	309	6
1340	309	3
1471	309	5
1171	309	11
1562	309	5
1669	309	15
1486	309	4
19	309	7
630	309	4
669	309	4
621	309	3
858	310	2
1812	310	12
1576	310	14
1717	310	1
1573	310	1
434	310	1
567	310	5
595	310	4
1023	311	3
1367	311	2
1509	311	2
1494	311	10
1532	311	4
1707	311	4
1843	311	8
239	311	3
554	311	3
511	311	2
509	311	7
1173	312	11
154	312	3
851	313	4
893	313	11
858	313	8
1216	313	2
1346	313	4
1606	313	5
322	313	8
58	313	5
260	313	4
635	313	2
619	313	7
618	313	8
904	314	3
811	314	4
782	314	2
874	314	6
1560	314	1
1548	314	3
634	314	7
441	314	2
636	314	2
588	314	11
788	315	1
1283	315	2
1841	315	4
327	315	11
616	315	3
678	315	1
710	315	3
649	315	2
844	316	12
934	316	2
1370	316	2
1149	316	4
1701	316	1
365	316	2
138	316	3
62	316	3
475	316	3
743	317	3
741	317	7
1294	317	4
1128	317	1
1408	317	7
1319	317	3
1239	317	3
1528	317	5
141	317	3
443	317	13
850	318	2
1204	318	13
1191	318	3
1378	318	4
1840	318	5
1645	318	2
80	318	5
296	318	4
8	318	2
395	318	5
797	319	1
832	319	4
923	319	6
1367	319	3
1285	319	2
1787	319	3
576	319	9
684	319	1
1412	320	3
1211	320	2
642	320	5
1053	321	1
1256	321	4
307	321	1
316	321	2
4	321	4
447	321	2
600	321	5
857	322	2
939	322	5
1719	322	1
340	322	1
390	322	1
690	322	2
1032	323	1
1587	323	1
1583	323	4
244	323	4
560	323	2
418	323	1
763	324	3
1192	324	1
1386	324	1
1300	324	3
186	324	2
32	324	1
1486	325	1
1497	325	3
191	325	2
334	325	2
279	325	3
298	325	3
301	325	2
699	325	2
951	326	5
1015	327	1
782	327	1
867	327	3
1579	327	1
1582	327	1
286	327	1
800	328	3
1225	328	1
1600	328	3
137	328	2
229	328	3
317	328	2
44	328	2
458	328	3
953	329	9
1117	329	4
1224	329	2
7	329	2
283	329	1
528	329	1
408	329	6
475	329	4
1414	330	8
1668	330	10
291	330	10
670	330	10
1009	331	5
1285	331	9
1425	331	9
1356	331	10
1688	331	15
1801	331	11
45	331	7
256	331	1
475	331	5
549	331	1
893	332	1
1167	332	6
1275	332	12
327	332	14
548	332	8
702	332	3
871	333	4
1089	333	2
1001	333	2
753	333	7
1520	333	2
131	333	2
111	333	13
29	333	5
253	333	5
664	333	15
463	333	3
849	334	5
1030	334	8
1117	334	6
1239	334	4
1187	334	14
1147	334	2
1374	334	3
1717	334	3
1825	334	2
475	334	2
577	334	12
437	334	6
822	335	9
1187	335	12
1151	335	3
1823	335	13
137	335	1
317	335	1
44	335	1
585	335	4
1032	336	5
1108	336	2
1397	336	3
150	336	1
81	336	8
214	336	15
117	336	11
530	336	3
649	336	5
741	337	4
1453	337	6
1343	337	9
1373	337	4
1289	337	11
1438	337	4
1201	337	8
1771	337	12
265	337	5
534	337	2
556	337	1
1087	338	2
885	338	11
942	338	5
1051	338	1
1401	338	3
1376	338	6
1546	338	2
342	338	4
662	338	5
965	339	7
1040	339	3
746	339	12
1214	339	2
1451	339	5
1401	339	5
1689	339	3
1686	339	9
1688	339	6
545	339	5
429	339	5
874	340	1
882	340	3
1482	340	10
1641	340	8
1604	340	2
1736	340	1
474	340	2
707	340	2
972	341	15
1027	341	8
1026	341	6
1102	341	6
1341	341	7
1198	341	7
1399	341	2
1219	341	5
1187	341	5
1810	341	8
264	341	8
487	341	5
466	341	4
1058	342	4
1463	342	1
1437	342	1
1684	342	9
129	342	4
620	342	5
576	342	5
664	342	13
1039	343	8
969	343	1
832	343	7
358	343	2
724	343	7
714	343	1
388	343	1
923	344	3
806	344	2
739	344	4
1538	344	2
1719	344	3
606	344	2
553	344	6
703	344	2
1062	345	2
778	345	1
1208	345	1
1345	345	6
159	345	1
580	345	2
1387	347	2
1151	347	2
1126	347	3
1651	347	3
50	347	5
156	347	3
93	347	1
469	347	6
940	348	1
1463	348	2
1403	348	4
1782	348	1
322	348	3
320	348	9
8	348	7
635	348	9
984	349	2
1054	349	3
1063	349	5
782	349	3
1037	349	2
1281	349	2
1367	349	6
1268	349	2
373	349	4
1053	350	2
1223	350	2
1329	350	3
343	350	5
361	350	2
433	350	1
514	350	2
531	350	9
839	351	2
1128	351	4
1354	351	5
1201	351	1
1826	351	6
92	351	3
417	351	1
927	352	6
1341	352	1
36	352	4
134	352	9
264	352	9
1086	353	14
928	353	14
1210	353	11
1403	353	2
1384	353	4
1606	353	3
296	353	3
312	353	4
114	353	4
142	353	2
267	353	3
621	353	11
954	354	10
1079	354	3
748	354	5
1635	354	6
1684	354	4
161	354	4
361	354	4
315	354	5
567	354	10
498	354	14
719	354	6
706	354	4
1031	355	13
1394	355	9
1659	355	2
140	355	11
3	355	8
99	355	4
180	355	12
260	355	3
79	355	6
408	355	5
538	355	4
395	355	4
882	356	8
780	356	14
1004	356	3
1403	356	3
1748	356	3
1784	356	7
55	356	10
35	356	1
83	356	5
638	356	3
485	356	11
928	357	8
1146	357	6
1180	357	3
1627	357	8
1742	357	5
297	357	5
264	357	11
253	357	9
61	357	13
266	357	4
104	357	4
511	357	3
809	358	5
961	358	15
1153	358	6
1486	358	6
1511	358	3
98	358	15
338	358	9
444	358	2
428	358	6
678	358	5
597	358	3
502	358	2
786	359	2
1480	359	4
355	359	3
238	359	10
236	359	5
600	359	2
386	359	4
520	359	3
1801	360	15
1827	361	11
1160	362	7
1605	362	2
1676	362	5
1780	362	3
1842	362	10
319	362	6
330	362	5
360	362	2
542	362	2
652	362	5
808	363	4
988	363	3
1027	363	5
1007	363	1
1549	363	10
301	363	3
146	363	9
247	363	4
369	363	8
1385	364	15
1797	365	12
754	366	1
870	366	1
1610	366	2
1541	366	1
313	366	13
840	367	9
1285	367	3
1277	367	2
1313	367	15
1839	367	2
1688	367	3
1680	367	2
188	367	3
832	368	5
893	368	2
858	368	1
3	368	10
379	368	3
548	368	1
592	368	5
882	369	1
1029	369	2
1156	369	1
1319	369	12
1842	369	2
16	369	5
259	369	2
1453	370	4
1120	370	1
1753	370	3
1744	370	2
332	370	2
551	370	1
840	372	5
884	372	2
1270	372	1
1737	372	1
272	372	3
102	372	5
765	373	3
739	373	2
1278	373	4
1763	373	6
147	373	3
476	373	3
532	373	4
929	380	5
794	380	4
858	380	3
743	380	6
861	380	3
881	380	5
1110	380	4
1209	380	2
1738	380	6
815	381	1
1425	381	5
1626	381	1
112	381	3
614	381	2
549	381	5
762	385	5
995	385	5
886	385	4
736	385	5
1453	385	3
1409	385	5
1728	385	3
261	385	5
912	393	2
1172	393	2
331	393	1
649	393	1
686	393	1
1070	400	1
949	400	2
1022	400	2
955	400	1
1148	400	2
675	400	4
1635	404	1
1695	404	1
332	404	1
518	404	1
1112	406	2
1356	406	3
1557	406	2
228	406	4
144	406	2
395	406	2
432	406	1
1126	413	2
1150	413	8
1726	413	9
1673	413	4
93	413	5
321	413	3
52	413	3
236	413	2
484	413	3
1037	416	4
1264	416	9
1348	416	1
1659	416	9
354	416	4
630	416	6
441	416	3
648	416	8
649	416	3
758	417	3
1383	417	4
1776	417	4
1477	417	5
51	417	5
55	417	2
187	417	3
73	417	2
1222	419	1
1435	419	1
1459	419	1
746	426	2
1205	426	2
1777	426	5
266	426	6
244	426	7
247	426	3
436	426	2
572	426	2
33	427	1
82	427	1
351	427	3
459	427	3
701	427	1
1062	429	1
1435	429	2
1459	429	3
299	429	2
478	429	2
667	429	1
915	430	1
784	430	3
1391	430	5
113	430	1
731	430	1
845	431	13
769	431	5
1155	431	8
1197	431	6
1203	431	2
1343	431	12
1456	431	6
1606	431	11
139	431	7
175	431	12
68	431	9
73	431	5
351	431	6
295	431	6
462	431	3
746	432	5
828	432	3
1162	432	2
1335	432	13
1221	432	5
1814	432	10
243	432	12
270	432	5
547	432	9
598	432	2
544	432	3
1155	433	7
1239	433	7
1736	433	5
1812	433	4
1676	433	10
1486	433	13
1706	433	4
176	433	7
268	433	3
125	433	4
19	433	9
547	433	7
449	433	12
1026	434	3
1225	434	6
1754	434	4
1519	434	4
1534	434	7
113	434	6
364	434	14
51	434	9
470	434	5
492	434	5
423	434	6
451	434	10
1109	435	12
1456	435	5
1759	435	9
1527	435	10
1603	435	6
1553	435	2
1515	435	1
319	435	4
400	435	5
492	435	6
1250	436	1
1494	436	7
1733	436	5
36	436	12
208	436	4
498	436	6
593	436	7
714	436	6
837	437	5
1106	437	8
1727	437	12
1528	437	11
1662	437	9
1560	437	9
310	437	5
14	437	5
232	437	6
601	437	4
596	437	6
761	438	3
834	438	8
1236	438	1
1580	438	1
35	438	5
195	438	11
363	438	2
573	438	13
941	439	4
1149	439	7
1151	439	5
136	439	4
110	439	6
96	439	12
64	439	7
76	439	4
166	439	11
228	439	5
663	439	2
1058	440	2
1673	440	12
216	440	1
52	440	1
727	440	1
444	440	9
733	441	2
767	441	11
1256	441	3
1240	441	4
1376	441	3
1490	441	2
196	441	4
6	441	6
1205	442	3
1784	442	5
1511	442	1
274	442	2
32	442	2
620	442	6
688	442	3
670	442	11
1114	443	9
1342	443	7
1477	443	9
1510	443	6
176	443	5
90	443	6
268	443	5
127	443	7
85	443	6
448	443	3
382	443	4
515	443	15
294	444	7
114	444	3
39	444	10
71	445	6
98	445	8
95	445	6
904	446	6
741	446	5
1292	446	3
1378	446	2
1383	446	3
1824	446	2
1663	446	5
228	446	3
1187	447	4
1219	447	8
1594	447	1
1625	447	1
624	447	1
943	448	2
1184	448	5
1507	448	4
206	448	1
139	448	9
509	448	1
819	449	4
860	449	6
1334	449	4
1666	449	8
1819	449	5
69	449	3
228	449	7
246	449	8
296	449	6
446	449	3
959	450	4
736	450	3
995	450	3
762	450	3
1106	450	3
342	450	6
261	450	3
607	450	3
1032	451	4
825	451	4
1537	451	4
1757	451	1
1541	451	8
173	451	6
145	451	8
426	451	4
757	452	3
980	452	2
1291	452	3
1198	452	1
276	452	2
506	452	8
636	452	3
884	453	8
1365	453	3
1412	453	2
1795	453	3
1751	453	5
312	453	8
159	453	6
390	453	5
400	453	4
1001	454	3
1035	454	3
1116	454	8
1573	454	2
1556	454	1
232	454	4
899	455	8
1541	455	7
1516	455	2
1606	455	8
233	455	9
296	455	5
172	455	3
152	455	6
573	455	4
503	455	3
769	456	8
1392	456	1
1844	456	4
1822	456	3
1541	456	4
1659	456	5
174	456	8
414	456	8
899	457	5
1427	457	4
1354	457	6
193	457	1
96	457	9
536	457	4
399	457	6
487	457	2
934	458	14
973	458	5
808	458	10
1310	458	8
1431	458	6
1313	458	13
1541	458	9
126	458	5
408	458	4
571	458	5
532	458	5
385	458	6
648	458	11
1053	459	7
964	459	3
1176	459	9
1394	459	4
1510	459	2
1742	459	9
1802	459	5
188	459	8
124	459	13
127	459	12
267	459	9
630	459	8
585	459	10
858	460	14
1026	460	4
790	460	7
930	460	2
1528	460	7
1618	460	10
1576	460	8
6	460	9
443	460	1
586	460	5
1026	461	5
1036	461	13
964	461	2
825	461	3
1455	461	3
1784	461	3
114	461	15
406	461	3
842	462	3
1156	462	13
1493	462	5
13	462	3
5	462	3
67	462	15
104	462	3
1	462	3
705	462	2
737	463	4
1226	463	2
1206	463	2
529	463	1
570	463	1
972	464	10
955	464	2
1022	464	3
949	464	4
1070	464	2
1148	464	3
1158	464	3
1736	464	8
675	464	8
1026	465	1
909	465	1
1119	465	1
1565	465	5
426	465	10
821	466	3
1412	466	1
1428	466	2
1719	466	2
131	466	3
220	466	12
543	466	4
946	467	3
1669	467	3
1767	467	3
1624	467	2
146	467	11
263	467	5
198	467	4
487	467	3
940	468	10
1139	468	1
1450	468	4
1638	468	1
320	468	1
1128	469	2
310	469	1
174	469	1
19	469	1
426	469	11
755	470	7
1122	470	5
1840	470	2
1551	470	1
495	470	2
704	470	11
408	470	7
1077	471	6
1192	471	7
1351	471	4
1136	471	4
1645	471	5
260	471	5
109	471	9
406	471	11
449	471	9
440	471	2
857	472	4
1289	472	5
1335	472	8
1206	472	3
295	472	4
271	472	7
719	472	12
419	472	3
591	472	4
865	473	2
979	473	2
1233	473	7
1685	473	3
1728	473	8
542	473	4
624	473	3
606	473	3
879	474	5
1725	474	2
1799	474	3
326	474	1
644	474	5
409	474	2
980	475	3
745	475	1
1469	475	2
1657	475	4
106	475	2
285	475	7
37	475	7
857	476	5
896	476	7
1700	476	5
1771	476	8
650	476	3
367	476	3
377	476	2
517	476	3
895	477	1
893	477	8
1434	477	1
114	477	7
294	477	4
699	477	4
1032	478	3
1041	478	4
1743	478	1
44	478	4
418	478	3
494	478	4
785	479	4
1379	479	7
1660	479	6
1618	479	1
41	479	2
376	479	1
987	480	3
1431	480	1
1263	480	5
451	480	2
1396	481	1
1448	481	1
1241	481	3
32	481	4
574	481	4
1048	482	8
1152	482	11
1519	482	5
1769	482	5
1553	482	4
21	482	10
57	482	11
116	482	14
179	482	5
69	482	4
508	482	12
648	482	5
746	483	1
1205	483	1
1511	483	2
206	483	2
446	483	2
744	484	6
1827	484	9
1666	484	5
1475	484	3
322	484	9
287	484	3
279	484	6
273	484	4
191	484	5
1263	485	2
1599	485	5
8	485	3
1089	486	1
1388	486	7
1806	486	1
1551	486	9
132	486	1
866	487	4
1045	487	5
1806	487	3
322	487	2
354	487	2
523	487	2
494	487	2
1229	488	1
1221	488	3
1798	488	3
353	488	7
214	488	9
576	488	4
423	488	2
982	489	2
1084	490	9
1257	490	4
1438	490	3
1783	490	8
1657	490	3
1670	490	1
1598	490	2
737	491	2
1735	491	2
1513	491	1
107	491	5
200	491	1
1045	492	7
800	492	1
1296	492	6
1384	492	1
244	492	3
204	492	2
1397	493	2
1747	493	2
51	493	7
248	493	6
24	493	3
128	493	3
46	493	2
946	494	5
1413	494	8
1738	494	2
1624	494	3
225	494	8
198	494	5
488	494	3
855	495	2
831	495	3
22	495	3
157	495	7
459	495	6
515	495	2
601	495	2
648	495	3
758	496	2
1336	496	1
1608	496	1
1658	496	1
968	497	1
913	497	1
1062	497	3
1160	497	1
816	498	6
1277	498	6
1618	498	3
286	498	4
130	498	4
275	498	5
530	498	4
396	498	4
761	499	2
1323	499	4
1252	499	2
1759	499	1
315	499	2
312	499	3
280	500	2
252	500	2
68	500	2
850	501	1
860	501	7
1161	501	7
1354	501	3
1313	501	9
1180	501	4
547	501	3
372	501	6
762	502	2
995	502	2
736	502	2
12	502	7
261	502	2
61	502	6
437	502	3
607	502	2
985	503	1
1376	503	10
1812	503	11
1814	503	2
281	503	2
298	503	2
140	503	12
70	503	14
524	503	12
512	503	2
743	504	4
904	504	4
220	504	3
347	504	4
705	504	5
730	504	4
670	504	3
133	505	2
934	506	7
1132	506	6
1392	506	9
1840	506	6
1547	506	7
1509	506	11
279	506	10
289	506	4
339	506	8
327	506	5
511	506	10
507	506	6
500	506	6
475	506	8
1053	507	9
1785	507	3
162	507	11
2	507	3
273	507	5
188	507	6
369	507	6
415	507	5
599	507	15
382	507	5
991	508	3
1291	508	14
1365	508	8
1814	508	12
1683	508	1
1714	508	7
363	508	4
283	508	4
713	508	7
643	508	10
1033	509	6
1604	509	10
190	509	3
64	509	4
52	509	12
556	509	5
415	509	3
955	510	3
1070	510	3
1022	510	4
949	510	3
1158	510	2
1148	510	4
1434	510	15
195	510	8
675	510	10
816	511	4
1458	511	1
1782	511	2
270	511	15
180	511	15
224	511	6
320	511	4
597	511	4
1146	512	1
1351	512	2
1404	512	2
1737	512	15
364	512	10
69	512	1
531	512	6
786	513	3
1333	513	1
1377	513	10
1410	513	6
1365	513	11
1726	513	3
139	513	4
79	513	8
523	513	8
831	514	2
1268	514	12
365	514	6
138	514	1
287	514	1
642	514	15
373	514	3
1009	515	13
1097	515	3
789	515	5
1378	515	5
1123	515	3
1532	515	10
1569	515	6
30	515	7
246	515	6
14	515	8
545	515	8
1012	516	5
1003	516	5
1229	516	3
1495	516	6
1681	516	4
134	516	13
117	516	7
20	516	11
151	516	5
605	516	6
933	517	3
1157	517	8
1765	517	11
1607	517	4
1798	517	6
1758	517	2
136	517	7
427	517	1
784	518	7
1132	518	5
1370	518	3
228	518	2
94	518	8
132	518	5
603	518	6
524	518	15
724	518	2
994	519	3
1053	519	4
802	519	7
813	519	3
1589	519	2
186	519	3
171	519	2
410	519	14
1048	520	6
969	520	6
1050	520	5
1077	520	7
1223	520	5
1785	520	7
78	520	4
201	520	6
207	520	12
186	520	8
648	520	7
1007	521	6
862	521	6
1407	521	8
1235	521	4
1694	521	3
1611	521	5
179	521	4
430	521	11
450	521	3
916	522	1
1827	522	4
1606	522	13
1621	522	7
1640	522	8
428	522	9
368	522	3
808	523	2
1045	523	6
988	523	9
1431	523	2
1175	523	6
1153	523	12
170	523	8
800	524	2
1025	524	2
1596	524	7
294	524	2
114	524	6
98	524	5
310	524	4
411	524	6
595	524	15
89	525	1
202	525	9
178	525	2
434	525	3
432	525	3
543	525	7
574	525	9
909	526	4
1153	526	3
1227	526	1
224	526	5
140	526	10
419	526	5
631	526	6
1580	527	10
1508	527	3
1744	527	7
1769	527	7
37	527	3
11	527	7
468	527	1
556	527	3
1093	528	14
832	528	8
886	528	6
1409	528	7
1718	528	4
155	528	7
251	528	4
134	528	6
6	528	4
418	528	6
379	528	7
977	529	1
934	529	10
1770	529	6
1829	529	3
192	529	3
267	529	4
670	529	2
1403	530	13
1284	530	3
1807	530	3
1756	530	5
1795	530	4
1730	530	4
168	530	6
491	530	4
927	531	8
893	531	9
1341	531	5
1471	531	9
1204	531	10
1636	531	2
239	531	6
166	531	8
323	531	3
554	531	4
209	532	4
280	532	9
349	532	4
472	532	4
410	532	4
438	532	3
402	532	4
1445	533	2
1313	533	8
1428	533	4
1471	533	4
1690	533	1
449	533	3
1365	534	2
1246	534	3
1258	534	3
1466	534	2
1676	534	6
584	534	2
447	534	5
1056	535	5
1457	535	2
1566	535	2
1730	535	2
184	535	3
364	535	7
553	535	8
616	535	6
902	536	4
1240	536	3
1629	536	1
36	536	8
278	536	3
16	536	2
1050	537	4
1807	537	5
203	537	4
289	537	5
676	537	8
1440	538	8
1201	538	5
1535	538	1
463	538	5
500	538	2
369	538	4
827	539	1
740	539	7
1395	539	1
1159	539	1
925	540	4
880	540	6
1370	540	5
1316	540	4
1404	540	4
1358	540	7
403	540	7
647	540	4
1019	541	1
900	541	5
1147	541	1
1506	541	6
186	541	6
1044	542	1
1700	542	1
1788	542	1
120	542	7
1066	543	1
1826	543	3
647	543	2
394	543	2
335	544	1
158	544	1
361	544	8
461	544	1
1056	545	10
1356	545	4
1470	545	10
1380	545	2
1762	545	3
1525	545	9
1581	545	1
546	545	9
617	545	11
1212	546	5
1152	546	4
1705	546	7
1549	546	12
356	546	10
13	546	10
120	546	6
96	546	5
41	546	7
403	546	2
431	546	9
928	547	13
849	547	7
1325	547	7
1462	547	4
1195	547	15
1577	547	7
1509	547	12
511	547	9
413	547	6
645	547	7
615	547	5
524	547	8
943	548	8
1288	548	4
1183	548	9
1116	548	12
1334	548	3
234	548	11
353	548	4
191	548	6
531	548	13
595	548	6
414	548	4
843	549	14
1009	549	6
1590	549	3
186	549	11
325	549	1
62	549	5
370	549	3
559	549	7
832	550	3
1379	550	3
1584	550	2
301	550	4
448	550	12
516	550	1
710	550	15
1069	551	4
946	551	2
1118	551	6
1628	551	3
1572	551	5
1641	551	2
719	551	13
631	551	13
1432	552	11
1	552	1
5	552	1
13	552	1
1011	553	2
753	553	9
1141	553	3
1204	553	12
284	553	1
562	553	4
568	553	8
811	554	5
1096	554	1
1322	554	8
1247	554	6
1605	554	4
542	554	3
588	554	10
893	555	6
1133	555	2
1170	555	6
1716	555	3
198	555	6
133	555	3
315	555	3
184	555	11
700	555	8
817	556	1
1395	556	10
1411	556	1
257	556	1
1377	557	14
1347	557	1
1387	557	1
374	557	1
1018	558	2
1259	558	10
1636	558	5
1814	558	8
208	558	6
63	558	2
501	558	3
625	558	4
887	559	7
238	559	5
17	559	15
233	559	8
313	559	4
463	559	1
467	559	5
953	560	6
746	560	7
1377	560	6
1701	560	7
1510	560	1
186	560	5
127	560	6
176	560	9
495	560	12
1096	561	2
811	561	6
1114	561	2
1605	561	10
307	561	4
257	561	2
542	561	8
581	561	2
1796	562	14
1017	563	9
1654	563	2
1594	563	5
319	563	10
590	563	7
691	563	3
470	563	3
373	563	5
1037	564	5
1039	564	5
1374	564	7
1136	564	13
1494	564	8
323	564	4
393	564	8
697	564	9
621	564	5
882	565	12
1429	565	3
1828	565	2
1555	565	2
333	565	1
588	565	3
856	566	8
1020	566	1
1814	566	7
1545	566	4
231	566	5
246	566	10
591	566	5
770	567	4
882	567	5
1431	567	4
1706	567	7
352	567	4
482	567	12
1002	568	6
1084	568	2
1392	568	4
1421	568	5
1840	568	3
68	568	8
459	568	5
593	568	11
830	569	3
1185	569	10
1767	569	1
1669	569	2
725	569	1
1032	570	7
911	570	3
1804	570	2
1829	570	2
1820	570	11
4	570	9
578	570	3
501	570	9
472	570	8
1142	578	4
1733	578	4
18	578	3
527	578	7
685	578	8
718	578	1
488	582	1
906	587	11
1195	587	1
1822	587	11
1519	587	13
1630	587	8
43	587	8
184	587	4
228	587	9
385	587	11
710	587	12
392	587	7
490	587	8
770	670	1
1438	670	1
1607	670	3
493	670	2
885	671	7
1115	671	6
1493	671	4
1594	671	3
1835	671	3
212	671	2
596	671	5
762	679	4
736	679	4
261	679	4
291	679	5
203	679	2
607	679	4
1424	680	1
1487	680	2
36	680	3
323	680	1
953	681	4
853	681	8
1052	681	5
1191	681	5
1642	681	6
405	681	5
440	681	5
1294	682	9
1324	682	6
1560	682	2
1842	682	4
133	682	4
221	682	1
1290	684	1
116	684	2
215	684	1
57	684	2
1423	687	1
1271	687	7
1508	687	8
1601	687	1
143	687	4
974	688	4
1749	688	1
241	688	1
660	688	4
943	690	7
891	690	3
1006	690	6
788	690	5
1272	690	3
1775	690	8
245	690	2
223	690	6
1775	692	4
145	692	5
312	692	5
178	692	7
536	692	6
597	692	9
596	692	2
652	692	9
1801	693	1
1237	694	4
1740	694	4
49	694	5
422	694	5
927	695	9
1341	695	2
1382	695	14
1782	695	15
1516	695	11
1583	695	1
224	695	3
317	695	10
927	696	15
1341	696	11
1274	696	3
1377	696	15
1412	696	13
1225	696	7
1842	696	3
133	696	5
636	696	4
642	696	4
999	697	12
1244	697	3
1425	697	3
1590	697	5
1733	697	3
308	697	5
144	697	10
428	697	8
616	697	12
939	698	7
763	698	8
1242	698	2
1475	698	6
56	698	9
113	698	10
58	698	13
360	698	5
664	698	14
420	698	4
572	698	6
807	699	10
965	699	4
1128	699	9
1793	699	2
1657	699	13
102	699	2
206	699	6
127	699	8
359	699	3
822	700	1
1462	700	2
1425	700	2
1401	700	2
76	700	15
413	700	10
532	700	8
1540	701	6
1629	701	2
1761	701	3
270	701	6
144	701	13
279	701	7
634	701	11
632	701	5
761	702	5
898	702	10
944	702	1
780	702	12
1221	702	4
3	702	9
614	702	4
1275	703	14
38	703	5
262	703	10
325	703	3
497	703	4
512	703	5
612	703	3
495	703	6
1048	704	7
1271	704	2
1188	704	6
1557	704	7
1487	704	4
214	704	3
152	704	10
284	704	12
648	704	4
1472	705	3
1637	705	2
692	705	5
698	705	7
769	706	6
741	706	11
1079	706	4
1346	706	3
1235	706	2
1491	706	4
392	706	2
844	707	13
882	707	9
1077	707	5
1051	707	4
1188	707	8
1300	707	9
1718	707	6
115	707	5
417	707	6
1046	708	2
1113	708	2
1528	708	4
277	708	2
204	708	3
138	708	9
389	708	12
813	709	8
941	709	12
1062	709	5
913	709	4
328	709	2
224	709	7
315	709	4
904	710	5
1285	710	8
1332	710	4
1294	710	8
1376	710	5
321	710	9
39	710	4
531	710	10
885	711	5
785	711	6
1379	711	10
1708	711	5
123	711	5
846	712	4
838	712	7
1133	712	9
1198	712	3
1765	712	5
1823	712	8
56	712	7
523	712	7
511	712	12
761	713	7
973	713	6
964	713	5
1172	713	8
1491	713	3
1785	713	4
194	713	5
9	713	11
809	714	7
1458	714	7
1158	714	7
152	714	4
460	714	1
393	714	12
765	715	2
1115	715	8
1508	715	4
1770	715	4
147	715	2
679	715	3
620	715	10
881	716	4
1047	716	6
786	716	4
1286	716	1
33	716	10
556	716	2
909	717	2
1078	717	1
1636	717	3
1680	717	3
194	717	9
399	717	13
954	718	9
931	718	2
1180	718	5
1251	718	3
1802	718	6
1534	718	6
273	718	6
120	718	8
503	718	11
975	719	3
735	719	3
885	719	9
1226	719	3
1707	719	2
483	719	5
898	720	8
1138	720	9
254	720	9
895	721	2
893	721	4
1434	721	2
1227	721	8
896	722	2
1044	722	9
945	722	2
1068	722	6
1182	722	6
483	722	2
594	722	3
992	723	3
790	723	1
1045	723	9
1675	723	4
1540	723	2
1030	724	6
1051	724	2
1391	724	6
145	724	4
92	724	4
411	724	7
727	724	2
1165	725	2
1343	725	1
161	725	6
487	725	1
1034	726	4
1421	726	8
1784	726	1
103	726	2
1316	727	2
1585	727	5
1518	727	8
1243	728	5
1268	728	6
173	728	5
10	728	8
730	728	6
387	728	2
645	728	4
841	729	4
942	729	3
1300	729	5
342	729	9
157	729	5
51	729	6
567	729	6
1023	730	8
1331	730	5
1432	730	3
1639	730	9
42	730	7
1107	731	4
1337	731	4
1716	731	6
1724	731	1
123	731	4
907	732	5
742	732	8
789	732	4
1509	732	4
1813	732	3
86	732	8
511	732	6
1427	733	1
1365	733	1
250	733	4
392	733	6
1122	734	2
1338	734	2
1803	734	1
313	734	9
471	734	2
885	735	8
974	735	1
241	735	2
660	735	1
926	736	3
1048	736	4
1391	736	2
158	736	2
7	736	6
632	736	4
809	737	6
1136	737	1
1283	737	6
1284	737	4
347	737	3
792	738	3
1439	738	5
1399	738	1
1690	738	5
494	738	7
1645	739	4
1529	739	6
1659	739	3
127	739	5
305	739	3
572	739	4
1001	740	6
892	740	5
1201	740	7
328	740	3
553	740	5
380	740	9
1001	741	5
788	741	2
1458	741	2
1535	741	2
318	741	2
685	741	7
794	742	2
1144	742	1
1220	742	6
1410	742	3
182	742	2
831	743	6
765	743	14
1457	743	13
1109	743	9
1421	743	15
1426	743	8
1358	743	6
1718	743	5
1617	743	3
1574	743	4
186	743	13
1055	744	5
930	744	14
1035	744	9
1053	744	5
1176	744	4
1264	744	11
1607	744	14
1684	744	13
285	744	5
319	744	9
758	745	5
1003	745	6
745	745	12
1468	745	3
1844	745	12
1512	745	9
213	745	6
251	745	10
240	745	9
374	745	8
941	746	7
986	746	11
1407	746	9
1442	746	9
1569	746	5
47	746	15
78	746	5
272	746	5
337	746	14
669	746	8
818	747	2
1259	747	13
45	747	12
343	747	6
96	747	3
15	747	7
333	747	2
452	747	10
657	747	5
1114	748	8
1607	748	9
1514	748	5
1573	748	5
1842	748	7
243	748	3
296	748	11
382	748	6
527	748	10
626	748	12
732	749	18
1237	749	3
111	749	15
49	749	3
653	749	4
574	749	2
422	749	4
1217	750	1
1438	750	2
178	750	9
156	750	6
52	750	13
145	750	6
313	750	12
556	750	7
897	751	4
975	751	2
1708	751	3
251	751	15
507	751	11
471	751	4
486	751	4
962	752	2
1463	752	4
1378	752	3
180	752	14
279	752	5
8	752	12
495	752	5
806	753	4
1735	753	4
1490	753	15
1597	753	4
286	753	5
48	753	9
688	753	9
410	753	13
280	754	10
209	754	5
349	754	6
438	754	5
402	754	6
410	754	5
472	754	5
891	755	8
1209	755	5
1383	755	7
1331	755	9
1802	755	12
1621	755	8
1808	755	10
327	755	13
117	755	6
191	755	13
530	755	11
600	755	8
663	755	12
538	755	6
1810	756	11
456	756	5
1018	757	3
985	757	3
1755	757	7
161	757	5
514	757	7
707	757	4
1084	758	3
838	758	2
886	758	7
586	758	2
618	758	15
1304	759	3
1432	759	2
1756	759	1
1523	759	3
248	759	12
1001	760	1
866	760	3
1673	760	2
230	760	14
176	760	4
773	761	5
918	761	7
963	761	5
1812	761	3
1716	761	13
153	761	5
481	761	8
902	762	9
755	762	9
1250	762	13
1759	762	5
1629	762	5
186	762	7
160	762	9
535	762	3
898	763	13
1300	763	6
1705	763	3
1725	763	3
1660	763	8
28	763	2
204	763	5
1490	764	8
1605	764	1
1560	764	8
542	764	1
468	764	14
929	765	15
1092	765	2
1209	765	4
1116	765	6
1500	765	8
425	765	3
1014	766	3
1401	766	1
1690	766	6
26	766	14
148	766	9
4	766	3
985	767	9
1008	767	10
1071	767	3
947	767	6
20	767	6
84	767	4
674	767	6
429	767	4
1331	768	4
1587	768	4
1505	768	1
330	768	14
411	768	5
1023	769	11
944	769	5
1668	769	8
275	769	3
495	769	4
530	769	5
942	770	8
82	770	6
316	770	4
458	770	1
515	770	11
1775	771	7
661	771	4
728	771	3
1052	772	2
831	772	5
1198	772	2
365	772	11
170	772	1
839	773	7
776	773	3
1128	773	6
1283	773	5
1149	773	5
92	773	11
531	773	2
1325	774	3
1572	774	4
1521	774	2
1523	774	6
345	774	8
564	774	2
714	774	14
769	775	10
962	775	5
1558	775	2
1547	775	3
99	775	8
293	775	3
432	775	6
1730	776	1
1823	776	12
120	776	4
43	776	2
428	776	3
755	777	3
1250	777	5
618	777	4
535	777	1
710	777	13
967	778	3
735	778	13
1290	778	2
275	778	2
514	778	3
530	778	2
766	779	2
1396	779	4
1365	779	14
1538	779	5
75	779	3
102	779	3
1247	780	2
1189	780	4
40	780	2
288	780	1
1005	781	1
1283	781	3
83	781	2
243	781	2
256	782	3
53	782	6
712	782	3
503	782	1
634	782	8
1157	783	7
1113	783	3
1335	783	5
1661	783	1
1701	783	6
865	784	4
1331	784	3
1693	784	3
197	784	2
42	784	2
284	785	4
568	785	2
680	785	3
387	785	3
885	786	3
212	786	1
67	786	1
1306	787	1
1368	787	4
1642	787	4
1761	787	2
839	788	3
1157	788	1
1514	788	6
204	788	6
617	788	4
954	789	8
753	789	2
215	789	4
634	789	3
569	789	6
604	789	4
755	790	2
1419	790	3
1647	790	4
1476	790	3
563	790	4
757	791	5
761	791	4
3	791	5
39	791	2
708	791	2
758	792	9
1468	792	1
1750	792	8
374	792	4
548	792	2
1726	793	2
176	793	3
151	793	3
599	793	5
433	793	2
745	794	3
1742	794	7
266	794	5
275	794	7
558	794	4
635	794	5
1382	795	2
1361	795	2
44	795	5
1286	796	3
1622	796	2
1506	796	2
1532	796	3
684	796	4
1266	797	6
1550	797	5
1796	797	5
1548	797	4
197	797	8
255	797	4
1165	798	3
1541	798	2
1802	798	3
538	798	3
901	799	4
1237	799	5
100	799	4
89	799	6
49	799	6
422	799	6
501	799	6
987	800	1
1766	800	2
287	800	4
200	800	4
1175	801	2
1817	801	2
47	801	2
85	801	1
1122	802	3
1506	802	4
1695	802	2
1744	802	3
94	802	3
1651	803	1
50	803	3
494	803	1
1605	804	3
317	804	3
240	804	2
137	804	3
44	804	3
827	805	2
1061	805	1
1236	805	2
1705	805	2
1534	806	1
428	806	5
1089	807	7
1257	807	3
1670	807	3
1737	807	9
173	807	3
256	807	4
1561	808	1
42	808	6
108	808	7
197	808	3
695	808	9
588	808	7
935	809	8
1310	809	4
1572	809	3
675	809	2
566	809	2
410	809	8
825	810	5
849	810	4
1605	810	8
1662	810	7
1700	810	8
542	810	7
938	811	1
1373	811	8
497	811	8
435	811	1
1249	812	1
1233	812	2
171	812	1
979	813	1
1436	813	4
1295	813	2
559	813	2
1015	814	4
1597	814	1
556	814	4
622	814	4
1800	815	3
972	816	2
1835	816	2
298	816	5
217	816	4
451	816	5
1256	817	2
1357	817	1
1593	817	2
1399	818	4
1719	818	5
1764	818	4
357	818	5
832	819	1
1288	819	5
1063	820	3
74	820	1
996	821	4
1144	821	2
1574	821	1
1583	821	5
842	822	2
1269	822	1
1457	822	5
353	822	5
1223	823	3
1283	823	4
1521	823	3
970	824	4
1033	824	2
865	824	3
388	824	2
714	824	2
843	825	1
1198	825	8
119	825	6
550	825	1
885	826	4
1365	827	4
1267	827	1
27	827	2
646	827	2
1496	828	1
1771	828	4
473	828	1
975	829	1
1459	829	2
285	829	4
1002	830	5
1451	830	2
1814	830	4
307	830	3
618	830	3
1444	831	3
1183	831	1
20	831	3
82	831	2
793	832	3
867	832	1
107	832	8
289	832	7
593	832	4
1022	833	7
784	833	5
1801	833	4
1811	833	11
277	833	12
272	833	12
365	833	15
182	833	5
407	833	8
487	833	8
926	834	9
865	834	12
860	834	10
1400	834	11
1502	834	3
1676	834	9
268	834	7
680	834	8
615	834	4
618	834	9
898	835	14
792	835	4
1258	835	8
1355	835	14
1736	835	3
1684	835	12
1669	835	5
719	835	7
449	835	7
780	836	15
898	836	6
1275	836	11
1844	836	11
1602	836	1
778	837	3
1103	837	4
844	837	11
1121	837	2
1466	837	9
1118	837	4
1790	837	11
519	837	13
898	838	11
1030	838	11
1057	838	13
1071	838	2
1547	838	2
320	838	7
136	838	3
287	838	2
801	839	8
747	839	11
787	839	8
823	839	8
810	839	9
199	839	7
288	839	10
579	839	6
479	839	5
613	839	6
846	840	7
1174	840	4
1702	840	1
196	840	11
585	840	3
448	840	15
971	841	1
1312	841	2
1343	841	7
1173	841	3
1771	841	11
1714	841	10
891	842	7
802	842	5
1037	842	6
1155	842	9
1463	842	7
1112	842	9
1505	842	9
493	842	6
657	842	12
763	843	10
1322	843	6
1779	843	3
1828	843	8
160	843	7
205	843	9
107	843	7
86	843	5
527	843	13
749	844	4
1018	844	6
1429	844	11
1190	844	5
1553	844	5
596	844	4
372	844	12
1068	845	11
732	845	32
885	845	10
1171	845	2
1768	845	3
147	845	6
488	845	2
1086	846	3
1244	846	5
1509	846	3
219	846	7
448	846	2
577	846	13
797	847	5
1007	847	8
846	847	5
359	847	4
204	847	10
347	847	8
714	847	15
499	847	7
841	848	1
1457	848	3
1823	848	10
316	848	13
413	848	9
755	849	4
1109	849	14
1221	849	6
1693	849	4
1497	849	7
302	849	6
3	849	6
1845	850	1
86	850	4
297	850	6
490	850	15
575	850	5
1055	851	3
996	851	2
1319	851	2
80	851	8
223	851	11
405	851	2
839	852	1
1640	852	1
253	852	14
618	852	7
942	853	4
1383	853	5
1260	853	10
1585	853	7
1567	853	9
1718	853	7
586	853	7
534	853	7
828	854	2
1368	854	1
1113	854	4
80	854	7
653	854	10
1524	855	6
1712	855	5
130	855	5
77	855	9
188	855	14
83	855	6
423	855	4
322	856	13
230	856	5
398	856	2
433	856	7
1423	857	5
1521	857	4
1601	857	5
1684	857	14
168	857	8
631	857	4
986	858	6
1128	858	7
1374	858	5
1393	858	12
1167	858	5
360	858	9
612	858	4
940	859	7
137	859	5
317	859	15
359	859	5
129	859	5
44	859	7
112	859	6
1084	860	1
1104	860	1
1264	860	12
711	860	6
1086	861	6
1414	861	5
1195	861	13
1228	861	2
1737	861	7
75	861	6
102	861	6
639	861	6
859	862	1
245	862	15
6	862	7
500	862	7
394	862	3
985	863	4
742	863	6
1401	863	8
1161	863	5
1777	863	6
148	863	8
106	863	6
26	863	13
989	864	11
971	864	3
1566	864	3
102	864	4
75	864	5
229	864	7
959	865	3
348	865	4
319	865	2
210	865	12
207	865	4
509	865	8
1095	866	2
1456	866	2
1450	866	2
597	866	10
535	866	7
955	867	10
1070	867	10
1049	867	5
949	867	12
1022	867	10
1149	867	13
1148	867	10
1158	867	1
315	867	8
675	867	6
739	868	3
1141	868	8
60	868	3
698	868	10
595	868	3
532	868	3
961	869	11
1228	869	1
1743	869	6
424	869	1
906	870	3
961	870	3
1153	870	7
120	870	3
572	870	3
701	870	15
1331	871	2
1319	871	1
80	871	14
17	871	3
616	871	7
986	872	5
1351	872	11
1277	872	9
344	872	6
345	872	9
350	872	9
507	872	8
564	872	5
1574	873	15
1647	873	1
330	873	7
563	873	1
881	874	7
738	874	9
1580	874	2
1480	874	11
313	874	6
238	874	1
1031	875	3
1204	875	14
1758	875	1
731	875	8
427	875	2
25	876	2
459	876	2
475	876	13
408	876	9
536	876	2
657	876	4
737	877	5
1170	877	7
146	877	1
111	877	14
955	878	4
949	878	7
1070	878	4
1148	878	6
1158	878	4
675	878	9
845	879	2
1045	879	4
1131	879	3
83	879	4
618	879	6
1060	880	4
1364	880	2
1660	880	9
1504	880	5
1518	880	4
242	881	3
10	881	6
246	881	5
709	881	3
727	881	4
989	882	9
1603	882	5
517	882	4
367	882	5
650	882	4
991	883	1
1233	883	1
1728	883	6
1410	884	7
1529	884	3
1732	884	2
691	884	5
477	884	2
840	885	1
890	885	2
1329	885	2
66	885	8
910	886	8
1143	886	8
1338	886	3
1236	886	4
666	886	6
485	886	4
1009	887	4
1199	887	4
1123	887	5
1781	887	6
69	887	8
567	887	7
1245	888	1
1498	888	4
659	888	7
916	889	3
1187	889	7
108	889	8
172	889	2
345	889	6
536	889	3
796	890	9
1011	891	4
881	891	3
212	891	5
64	891	2
670	891	6
994	892	4
958	892	4
1247	892	1
576	892	8
769	893	4
1249	893	2
1676	893	2
1528	893	6
271	893	2
209	894	6
349	894	5
472	894	7
410	894	7
402	894	5
438	894	4
1334	895	1
1743	895	3
616	895	4
405	895	8
1069	896	8
1106	896	9
1515	896	2
1527	896	1
594	896	8
1127	897	1
1524	897	2
1621	897	6
470	897	4
1316	898	3
125	898	3
289	898	6
592	898	4
507	898	3
777	899	1
1299	899	4
1200	899	9
1643	899	4
900	900	2
895	900	3
1631	900	8
225	900	4
483	900	9
377	900	6
771	901	8
1143	901	1
1753	901	4
283	901	3
979	902	6
1322	902	5
1199	902	5
153	902	4
357	902	3
1011	903	3
751	903	3
790	903	8
1445	903	3
1414	904	1
1474	904	4
317	904	4
334	904	7
1232	905	7
1596	905	3
275	905	6
729	905	6
703	905	4
725	905	5
1091	906	1
1065	906	7
1479	906	9
272	906	6
448	906	5
979	907	7
865	907	8
770	907	12
861	907	8
748	907	8
1243	907	6
1322	907	9
1577	907	5
361	907	11
149	907	15
160	907	12
367	907	15
1004	908	4
1589	908	4
1692	908	2
1609	908	4
332	908	9
1644	909	8
1003	910	2
436	910	5
721	910	2
407	910	4
815	911	3
940	911	3
1119	911	2
432	911	4
549	911	8
1456	912	8
1771	912	1
1818	912	2
332	912	5
233	913	3
188	913	7
350	913	4
128	913	2
637	913	3
1053	914	6
998	914	2
1754	914	1
488	914	6
642	914	6
1655	915	1
237	915	1
473	915	9
741	916	15
849	916	6
831	916	12
1114	916	10
1308	916	4
1777	916	7
1686	916	8
232	916	5
527	916	12
563	916	10
482	916	6
753	917	10
1361	917	4
1528	917	8
317	917	13
137	917	11
336	917	5
191	917	7
44	917	10
507	917	4
755	918	8
808	918	13
1355	918	3
1337	918	7
1275	918	8
1219	918	7
1553	918	12
577	918	14
930	919	3
929	919	11
1834	919	11
215	919	3
233	919	5
236	919	13
98	919	9
42	919	9
992	920	7
1289	920	2
1156	920	9
1271	920	13
1824	920	3
302	920	12
534	920	3
1037	921	10
865	921	7
1034	921	7
1374	921	9
1151	921	6
1528	921	10
187	921	5
51	921	4
428	921	12
803	922	10
308	922	6
202	922	4
29	922	4
96	922	11
374	922	2
500	922	8
746	923	11
961	923	7
1115	923	9
181	923	3
320	923	14
491	923	5
891	924	10
1408	924	4
336	924	4
66	924	3
382	924	11
1343	925	5
13	925	12
5	925	10
189	925	2
1	925	5
471	925	5
894	926	6
1479	926	8
30	926	12
132	926	3
574	926	1
617	926	10
738	927	12
1323	927	5
1520	927	5
145	927	10
678	927	3
685	927	4
851	928	12
942	928	13
1085	928	5
1370	928	11
1187	928	10
1470	928	6
1419	928	9
1146	928	14
1462	928	9
130	928	6
106	928	10
77	928	11
406	928	7
1048	929	12
780	929	3
1840	929	4
1675	929	5
300	929	2
450	929	15
1087	930	1
1296	930	3
124	930	15
149	930	3
586	930	15
1385	931	14
1264	931	14
1095	932	8
1009	932	11
1392	932	6
1114	932	6
1844	932	9
1509	932	6
648	932	9
616	932	15
864	933	2
1549	933	11
188	933	4
11	933	2
212	933	14
593	933	2
807	934	12
1359	934	4
1313	934	5
1104	934	2
1474	934	3
1822	934	15
1170	935	4
1174	935	1
1702	935	2
1600	935	11
75	935	11
1069	936	13
1327	936	1
698	936	11
561	936	1
12	937	14
149	937	2
61	937	5
498	937	4
700	937	2
1727	938	2
1542	938	2
362	938	3
599	938	11
694	938	3
953	939	7
1717	939	11
344	939	3
356	939	2
623	939	3
531	939	7
1095	940	5
1368	940	2
1124	940	1
364	940	13
950	941	1
1751	941	2
312	941	6
593	941	8
573	941	15
890	942	14
934	942	3
1694	942	2
248	942	5
620	942	4
1129	943	3
1312	943	3
1193	943	1
967	944	10
152	944	9
356	944	9
392	944	5
568	944	4
619	944	6
913	945	2
1190	945	2
1438	945	5
1112	945	7
1812	945	15
1576	945	6
1045	946	1
1540	946	4
132	946	2
664	946	11
752	947	9
1117	947	5
1603	947	1
82	947	8
719	947	14
1026	948	13
939	949	6
763	949	6
1036	949	7
773	949	11
1282	949	3
133	949	8
239	949	5
1002	950	4
1392	950	5
109	950	2
19	950	4
285	950	14
1078	951	2
353	951	3
58	951	8
338	951	14
614	951	6
605	951	2
804	952	14
719	952	1
1351	953	3
1541	953	10
558	953	3
408	953	3
1360	954	10
872	955	11
1315	956	10
1569	956	1
56	956	5
78	956	3
1441	957	3
1439	957	6
76	957	13
297	957	9
296	957	9
113	957	7
586	957	4
742	958	5
999	958	3
1421	958	10
232	958	2
619	958	3
1352	959	7
1180	959	11
609	959	7
401	959	4
674	959	8
647	959	3
1095	960	7
351	960	7
26	960	4
267	960	10
399	960	8
568	960	5
573	960	7
828	961	6
797	961	6
1146	961	5
1802	961	13
1481	961	5
1052	962	8
1340	962	4
1296	962	14
320	962	5
535	962	8
639	962	2
1256	963	7
1259	963	11
1688	963	8
1697	963	4
558	963	7
530	963	7
700	963	3
788	964	8
1823	964	9
252	964	8
350	964	7
64	964	1
400	964	15
926	965	5
1290	965	3
1776	965	3
117	965	4
429	965	12
278	966	15
1076	967	14
955	968	9
1070	968	9
792	968	5
949	968	10
1158	968	5
675	968	3
961	969	2
1824	969	5
356	969	5
344	969	12
10	969	3
1177	970	1
1580	970	5
1504	970	14
501	970	7
471	970	8
914	972	1
1083	972	4
626	972	5
765	973	1
147	973	1
1358	975	1
1825	975	1
772	976	4
1018	976	4
1023	976	6
1458	976	9
491	976	6
550	976	7
1056	978	3
650	978	2
517	978	2
367	978	2
966	981	1
555	981	1
884	983	3
843	983	6
1360	983	1
1376	983	9
1052	984	6
1817	984	3
2	984	4
197	984	6
692	984	3
775	986	4
1296	986	2
265	986	6
7	986	4
441	986	6
941	987	2
1257	987	5
1480	987	1
807	989	2
977	989	9
930	989	4
880	989	7
1462	989	8
286	989	8
1570	990	1
235	990	1
1602	996	2
46	996	3
20	996	2
557	996	2
1745	999	1
760	1000	7
1808	1000	9
205	1000	5
107	1000	6
110	1000	9
86	1000	7
160	1000	6
1058	1002	7
1001	1002	7
1149	1002	8
1344	1002	3
89	1002	8
386	1002	7
501	1002	8
1815	1005	2
1773	1005	1
14	1005	4
115	1006	3
190	1006	4
348	1006	2
507	1006	2
1436	1008	1
1564	1008	1
899	1009	6
916	1009	2
1422	1009	3
343	1009	7
612	1009	2
877	1012	5
1574	1012	6
1771	1012	3
407	1012	9
613	1012	2
936	1013	5
1444	1013	6
358	1013	6
381	1013	1
953	1014	3
1151	1014	1
552	1014	2
1388	1015	3
496	1015	3
601	1015	1
1095	1018	4
224	1018	8
47	1018	3
553	1018	3
444	1018	8
1356	1019	1
1380	1019	3
546	1019	3
1766	1023	5
1791	1023	2
1631	1023	3
481	1023	4
1632	1024	2
1478	1024	1
541	1024	5
809	1026	8
748	1026	4
1722	1026	1
463	1026	8
869	1027	6
1730	1027	5
140	1027	9
130	1027	2
430	1027	5
1088	1030	2
967	1030	4
1639	1030	2
511	1030	5
948	1031	2
87	1031	2
681	1031	2
476	1031	5
1413	1033	3
196	1033	3
489	1033	3
678	1033	2
821	1038	5
934	1038	9
1662	1038	6
1716	1038	8
1820	1038	6
43	1038	5
740	1042	2
1162	1042	4
1270	1042	4
219	1042	2
1076	1045	4
582	1045	1
707	1045	3
850	1046	3
918	1046	4
1196	1046	3
214	1046	5
883	1050	1
1488	1050	1
341	1052	1
682	1052	1
1609	1056	3
473	1056	3
551	1056	3
1153	1057	2
1600	1057	5
29	1057	6
95	1057	9
688	1057	4
980	1065	7
1471	1065	7
1219	1065	9
1486	1065	2
168	1065	4
803	1066	2
81	1066	2
480	1066	1
1363	1067	2
1204	1067	8
1837	1067	1
373	1067	7
1295	1068	3
1262	1068	1
1523	1068	4
887	1074	4
796	1074	1
726	1074	3
1103	1077	5
105	1077	6
476	1077	2
453	1077	6
1439	1078	4
339	1078	6
273	1078	3
389	1078	5
629	1078	7
1537	1079	1
457	1079	3
638	1079	4
925	1081	5
824	1081	3
1385	1081	5
1335	1081	15
1491	1081	10
1600	1081	10
1806	1081	12
86	1081	10
511	1081	8
750	1082	3
1660	1082	1
346	1082	5
800	1083	6
1581	1083	6
200	1083	7
628	1083	1
458	1083	9
1395	1084	3
1262	1084	2
409	1084	1
124	1085	9
523	1085	6
617	1085	1
389	1085	3
874	1086	2
892	1086	2
750	1086	2
1374	1086	2
1025	1088	1
1225	1088	2
379	1088	2
959	1089	5
1177	1089	3
1644	1089	4
356	1089	6
386	1089	6
1569	1092	4
1843	1092	5
1657	1092	7
446	1092	7
984	1093	4
229	1093	5
156	1093	4
77	1093	3
1022	1098	6
949	1098	8
955	1098	5
1070	1098	5
1148	1098	5
822	1100	4
1329	1100	1
14	1100	2
920	1102	2
1069	1102	5
1641	1102	3
1700	1102	2
773	1105	3
1289	1105	3
1716	1105	7
416	1105	6
578	1105	5
1306	1107	5
1572	1107	6
586	1107	3
105	1108	1
1033	1109	3
401	1109	1
1324	1112	5
1141	1112	2
1359	1112	8
38	1112	7
358	1112	9
752	1113	3
1388	1113	1
972	1125	3
1835	1125	4
185	1125	3
458	1125	5
944	1126	2
861	1126	2
1665	1126	2
307	1126	2
924	1128	4
27	1128	4
646	1128	3
453	1128	3
1309	1130	1
1357	1130	3
1593	1130	3
1484	1134	2
1823	1134	1
719	1134	5
1415	1140	2
1814	1140	5
1674	1140	2
489	1140	2
1552	1142	1
508	1142	5
560	1142	8
727	1142	9
1357	1143	2
1467	1143	1
1389	1144	3
1345	1144	1
286	1144	3
851	1145	3
735	1145	5
14	1145	3
240	1145	3
964	1146	4
756	1146	4
55	1146	1
815	1147	2
1820	1147	2
30	1147	5
321	1147	8
777	1148	5
1299	1148	2
1643	1148	1
965	1153	2
1300	1153	2
1584	1153	3
399	1153	7
559	1153	6
1072	1155	4
997	1155	3
1245	1155	3
1498	1155	6
1006	1157	1
504	1157	2
390	1157	3
814	1158	3
863	1158	3
258	1158	5
521	1158	4
1211	1161	3
1603	1161	2
1708	1161	1
1297	1162	5
57	1162	3
155	1162	5
116	1162	5
1016	1165	3
1457	1165	1
116	1165	4
1375	1168	6
1393	1168	5
251	1168	3
458	1168	2
535	1168	6
1027	1176	7
979	1176	3
80	1176	6
186	1176	4
1090	1177	1
754	1177	3
1357	1177	4
1040	1179	1
1625	1179	3
673	1179	2
1057	1180	6
111	1180	4
594	1180	5
631	1180	7
843	1181	4
108	1181	6
116	1181	9
57	1181	7
345	1181	7
1248	1183	3
332	1183	4
1795	1184	2
161	1184	3
579	1184	5
1066	1185	3
1558	1185	1
374	1185	3
891	1186	14
942	1186	12
992	1186	8
1585	1186	9
320	1186	12
361	1186	7
490	1186	4
637	1186	6
560	1186	6
1045	1187	15
1362	1187	2
1664	1187	4
1633	1187	3
122	1187	10
73	1187	12
1102	1188	7
809	1188	13
1277	1188	12
1824	1188	11
1642	1188	9
109	1188	8
184	1188	5
1021	1189	5
1054	1189	10
1332	1189	10
1607	1189	8
1717	1189	4
360	1189	7
408	1189	14
557	1189	6
1300	1190	7
1600	1190	6
80	1190	13
58	1190	7
296	1190	10
188	1190	5
170	1190	11
55	1190	5
870	1191	9
1421	1191	12
1261	1191	8
1262	1191	8
85	1191	5
179	1191	7
623	1191	10
430	1191	7
852	1192	5
1704	1192	3
566	1192	5
647	1192	6
587	1192	11
1428	1193	1
1444	1193	7
1598	1193	10
101	1193	3
701	1193	12
929	1194	1
1092	1194	6
1366	1194	5
1500	1194	14
174	1194	10
923	1195	4
1392	1195	13
1647	1195	3
1515	1195	9
8	1195	10
563	1195	3
1447	1196	6
1440	1196	2
1660	1196	3
1740	1196	14
214	1196	6
363	1196	6
568	1196	15
1264	1197	4
1394	1197	3
1127	1197	4
122	1197	14
197	1197	13
591	1197	8
1370	1198	4
1811	1198	12
1801	1198	12
45	1198	4
700	1198	4
430	1198	6
1092	1199	11
1017	1199	3
58	1199	15
173	1199	4
256	1199	7
394	1199	5
956	1200	10
1003	1200	4
972	1200	12
1228	1200	7
346	1200	9
256	1200	6
712	1200	5
942	1201	14
1239	1201	6
1284	1201	11
1529	1201	8
1630	1201	9
84	1201	7
296	1201	7
370	1201	4
782	1202	12
1235	1202	5
167	1202	3
2	1202	5
77	1202	6
507	1202	10
865	1203	5
1808	1203	4
1598	1203	9
46	1203	4
209	1203	10
441	1203	13
1197	1204	4
1524	1204	8
1839	1204	15
140	1204	15
112	1204	7
80	1204	9
16	1204	4
930	1205	13
1378	1205	10
1389	1205	1
1527	1205	5
594	1205	9
111	1206	12
280	1206	3
300	1206	7
19	1206	12
68	1206	3
252	1206	3
1304	1207	2
1240	1207	6
292	1207	4
92	1207	7
500	1207	11
515	1207	12
418	1207	7
741	1208	9
1322	1208	4
1703	1208	3
400	1208	10
402	1208	10
740	1209	12
946	1209	4
1624	1209	4
1521	1209	7
263	1209	4
947	1210	3
1776	1210	2
139	1210	3
365	1210	9
411	1210	15
1004	1211	5
1734	1211	6
1710	1211	2
252	1211	10
583	1211	5
1057	1212	2
1347	1212	3
1319	1212	5
1323	1212	7
230	1212	11
856	1213	10
1259	1213	8
1313	1213	2
1396	1213	7
1684	1213	6
471	1213	3
891	1214	11
775	1214	6
1633	1214	4
446	1214	6
448	1214	4
466	1214	6
1392	1215	3
98	1215	6
174	1215	13
95	1215	3
515	1215	4
793	1216	2
1493	1216	1
314	1216	12
514	1216	6
998	1217	3
1676	1217	8
1518	1217	3
214	1217	11
570	1217	3
1786	1218	2
115	1218	6
4	1218	11
614	1218	5
1428	1219	7
1290	1219	5
365	1219	5
384	1219	5
714	1219	11
816	1220	5
1294	1220	5
1324	1220	3
1724	1220	11
132	1220	8
1343	1221	4
1799	1221	4
36	1221	9
672	1221	5
1195	1222	10
1340	1222	11
1718	1222	14
1742	1222	8
1737	1222	10
1788	1222	12
200	1222	11
116	1222	7
57	1222	5
36	1222	5
954	1223	7
1480	1223	3
1726	1223	1
634	1223	12
779	1224	4
1292	1224	13
1627	1224	7
194	1224	4
567	1224	8
844	1225	4
1487	1225	1
1730	1225	9
349	1225	15
884	1226	5
732	1226	27
1187	1226	6
1585	1226	11
1678	1226	2
119	1226	5
1352	1227	3
1392	1227	8
661	1227	2
609	1227	6
577	1227	7
506	1227	10
885	1228	12
1550	1228	3
1548	1228	2
286	1228	2
529	1228	6
1035	1229	4
753	1229	3
1822	1229	10
1551	1229	8
588	1229	9
934	1230	6
1076	1230	8
1515	1230	6
159	1230	4
521	1230	11
621	1230	9
657	1230	8
952	1231	3
1716	1231	5
168	1231	3
468	1231	13
704	1231	6
1314	1232	12
1229	1232	4
15	1232	6
979	1233	4
1608	1233	4
1663	1233	4
162	1233	12
458	1233	8
902	1234	2
757	1234	2
1286	1234	7
186	1234	12
110	1234	4
1400	1235	10
1271	1235	1
1477	1235	6
325	1235	2
1034	1236	12
1827	1236	6
180	1236	8
127	1236	4
354	1236	6
385	1236	9
547	1236	6
1235	1237	7
1118	1237	20
1769	1237	2
106	1237	1
811	1238	2
856	1238	11
1128	1238	5
1206	1238	5
395	1238	7
955	1239	15
1160	1239	5
1279	1239	2
1791	1239	5
143	1239	7
1180	1240	12
1182	1240	1
139	1240	6
610	1240	5
1182	1241	2
1412	1241	8
1365	1241	10
1796	1241	1
1329	1242	4
1730	1242	6
300	1242	5
73	1242	11
2	1242	9
132	1242	7
1091	1243	2
1561	1243	7
6	1243	1
898	1244	7
1272	1244	6
1493	1244	3
1706	1244	8
1518	1244	2
977	1245	2
988	1245	7
1416	1245	2
1633	1245	2
742	1246	9
821	1246	6
1104	1246	4
1784	1246	9
132	1246	9
459	1246	7
1155	1247	13
1681	1247	7
1812	1247	6
207	1247	11
635	1247	6
598	1247	5
411	1247	14
527	1247	15
706	1247	11
462	1247	6
1017	1248	4
32	1248	3
136	1248	6
305	1248	4
736	1249	6
762	1249	6
995	1249	9
1461	1249	5
63	1249	9
607	1249	6
940	1250	2
8	1250	6
420	1250	3
843	1251	3
863	1251	5
1455	1251	5
532	1251	6
785	1252	3
1308	1252	3
529	1252	2
411	1252	8
1088	1253	8
1010	1253	2
1688	1253	9
623	1253	7
449	1253	5
1347	1254	2
232	1254	7
718	1254	2
1555	1255	3
109	1255	3
182	1255	4
73	1255	7
920	1256	4
1175	1256	4
1550	1256	2
553	1256	7
827	1257	3
1258	1257	4
1112	1257	6
338	1257	5
137	1258	8
305	1258	5
106	1258	4
812	1259	4
1466	1259	7
1509	1259	7
606	1259	4
396	1259	9
780	1260	2
516	1260	6
1750	1261	9
1685	1261	4
505	1261	1
753	1262	5
1331	1262	6
220	1262	8
600	1262	9
642	1262	2
842	1263	5
106	1263	3
262	1263	4
314	1263	8
882	1264	7
1225	1264	3
1684	1264	5
298	1264	4
235	1265	6
110	1265	3
425	1265	2
512	1265	3
1581	1266	7
1764	1266	9
35	1266	7
495	1266	3
477	1266	3
954	1267	5
1114	1267	7
890	1268	6
357	1268	1
76	1268	5
821	1269	2
1425	1269	4
1376	1269	7
164	1269	3
1028	1270	1
1645	1270	3
595	1270	8
804	1271	9
1823	1271	4
1484	1271	4
719	1271	3
1436	1272	2
1513	1272	4
273	1272	9
599	1272	3
755	1273	5
910	1273	2
1831	1273	2
223	1273	7
1090	1274	5
127	1274	9
308	1274	1
992	1275	4
748	1275	3
1391	1275	7
1342	1275	5
920	1276	6
734	1276	4
1208	1276	6
644	1276	4
757	1277	1
1154	1277	3
1593	1277	6
1561	1278	8
95	1278	2
282	1278	2
413	1278	2
854	1279	28
765	1279	9
812	1279	5
212	1279	3
626	1279	4
740	1280	4
961	1280	6
1756	1280	3
463	1280	9
616	1280	9
1258	1281	7
1603	1281	3
1639	1281	5
416	1281	5
1285	1282	5
1640	1282	9
1607	1282	5
429	1282	3
1294	1283	7
1489	1283	2
282	1283	1
927	1284	4
1315	1284	3
384	1284	9
419	1284	4
1839	1285	8
1747	1285	4
46	1285	6
83	1285	9
625	1285	3
1378	1286	9
162	1286	6
255	1286	3
459	1286	8
465	1286	3
1099	1287	3
1365	1287	5
1359	1287	7
1700	1287	4
1233	1288	5
66	1288	1
508	1288	6
986	1289	7
927	1289	11
854	1289	16
1352	1289	11
1341	1289	4
1706	1289	9
101	1289	11
513	1289	3
669	1289	11
969	1290	9
913	1290	7
97	1290	5
225	1290	5
622	1290	8
1765	1291	3
1482	1291	2
399	1291	9
593	1291	3
1575	1292	1
1587	1292	8
316	1292	3
1027	1293	6
1670	1293	4
1753	1293	6
4	1293	8
484	1293	5
1016	1294	6
1427	1294	5
1628	1294	4
746	1295	6
1375	1295	3
1182	1295	3
789	1296	3
898	1296	4
1156	1296	7
178	1296	4
875	1297	4
1364	1297	1
527	1297	8
265	1298	7
639	1298	3
567	1298	2
679	1298	4
1401	1299	4
260	1299	2
353	1299	2
234	1299	6
1621	1300	3
333	1300	9
564	1300	4
1075	1301	4
89	1301	3
501	1301	4
373	1301	9
1191	1302	7
1442	1302	2
75	1302	2
102	1302	9
603	1302	8
784	1303	9
1483	1303	5
1759	1303	4
332	1303	7
519	1303	9
1083	1304	2
1390	1304	2
530	1304	6
607	1304	5
1276	1305	7
1770	1305	5
1559	1305	3
208	1305	3
853	1306	1
1399	1306	6
1304	1306	9
440	1306	6
1018	1307	7
803	1307	7
1006	1307	10
764	1307	9
1310	1307	13
1523	1307	5
344	1307	7
360	1307	10
333	1307	13
1027	1308	9
1073	1308	15
1289	1308	6
1136	1308	6
1654	1308	4
73	1308	6
392	1308	14
382	1308	13
373	1308	10
1039	1309	11
861	1309	6
784	1309	8
1358	1309	12
1813	1309	2
1604	1309	12
251	1309	5
62	1309	11
919	1310	4
1659	1310	4
1594	1310	8
1607	1310	13
212	1310	11
186	1310	10
449	1310	8
790	1311	6
819	1311	2
1410	1311	8
1595	1311	14
132	1311	10
216	1311	7
125	1311	8
627	1311	14
1034	1312	15
985	1312	7
1077	1312	14
841	1312	7
1717	1312	6
1524	1312	7
1491	1312	9
307	1312	10
451	1312	7
758	1313	4
1806	1313	5
22	1313	4
90	1313	10
274	1313	11
58	1313	10
1401	1314	13
1282	1314	2
1755	1314	4
1712	1314	3
9	1314	12
223	1314	10
762	1315	10
1096	1315	3
890	1315	15
1810	1315	4
669	1315	12
545	1315	4
987	1316	10
1112	1316	4
1277	1316	5
1718	1316	2
701	1316	14
724	1316	11
740	1317	6
1565	1317	3
92	1317	6
674	1317	3
499	1317	11
787	1318	4
1332	1318	7
1755	1318	13
291	1318	9
613	1318	4
1006	1319	4
1220	1319	15
58	1319	4
320	1319	2
535	1319	11
1170	1320	11
1310	1320	5
1706	1320	3
1701	1320	8
144	1320	11
118	1320	6
750	1321	10
406	1321	8
606	1321	10
591	1321	9
1267	1322	4
1696	1322	10
94	1322	5
683	1322	4
551	1322	12
1374	1323	11
1156	1323	4
163	1323	2
653	1323	3
428	1323	11
1102	1324	4
1567	1324	1
1529	1324	13
625	1324	10
1095	1325	3
1355	1325	15
1625	1325	7
1565	1325	9
1585	1325	4
98	1325	10
903	1326	5
1675	1326	8
1659	1326	15
102	1326	14
244	1326	8
560	1326	5
1203	1327	5
1839	1327	14
1811	1327	3
1678	1327	10
717	1327	2
818	1328	5
792	1328	8
1363	1328	8
1332	1328	11
1678	1328	6
1817	1328	14
477	1328	7
868	1329	7
1171	1329	8
1516	1329	13
6	1329	11
780	1330	13
1507	1330	1
131	1330	9
414	1330	14
509	1330	6
1449	1331	10
1160	1331	6
1370	1331	13
1502	1331	5
125	1331	5
654	1331	8
1668	1332	5
1706	1332	12
1820	1332	12
119	1332	2
42	1332	4
1070	1333	11
1669	1333	4
198	1333	7
225	1333	10
596	1333	8
697	1333	5
791	1334	2
1356	1334	12
114	1334	13
546	1334	1
954	1335	6
1086	1335	5
1122	1335	9
1354	1335	13
1829	1335	15
1630	1335	4
879	1336	6
952	1336	5
1215	1336	6
453	1336	14
582	1336	4
1175	1337	5
124	1337	3
465	1337	2
598	1337	12
1382	1338	1
1743	1338	8
322	1338	7
19	1338	13
984	1339	5
1837	1339	2
209	1339	11
642	1339	3
992	1340	5
978	1340	10
1839	1340	1
1063	1341	2
1441	1341	1
1576	1341	13
1203	1342	9
50	1342	8
167	1342	13
9	1342	4
685	1342	2
864	1343	10
1458	1343	6
1514	1343	9
140	1343	5
712	1343	4
973	1344	7
1359	1344	9
1388	1344	2
177	1344	3
14	1344	10
1685	1345	11
1826	1345	8
110	1345	8
17	1345	5
13	1345	8
640	1345	6
734	1346	14
1460	1346	1
135	1346	5
1091	1347	3
1388	1347	4
1823	1347	11
48	1347	4
896	1348	1
1076	1348	10
1685	1348	2
889	1349	2
899	1349	10
1139	1349	2
693	1349	2
1542	1350	3
362	1350	4
704	1350	5
1111	1351	2
249	1351	2
476	1351	13
594	1351	2
1227	1352	4
1457	1352	12
1702	1352	4
184	1352	8
379	1352	8
1471	1353	6
269	1353	15
400	1353	6
670	1353	4
580	1353	3
739	1354	10
1433	1354	4
1766	1354	4
131	1354	8
662	1354	7
735	1355	4
1023	1355	14
226	1355	4
529	1355	8
1141	1356	6
1657	1356	10
251	1356	9
175	1356	2
863	1357	4
814	1357	4
1639	1357	8
26	1357	7
521	1357	12
992	1358	2
1513	1358	10
619	1358	5
1260	1359	3
1313	1359	12
30	1359	4
282	1359	3
1560	1360	5
203	1360	10
691	1360	1
1821	1361	11
1785	1361	2
902	1362	5
1827	1362	7
364	1362	9
308	1362	7
399	1362	11
696	1362	8
835	1363	12
1592	1363	1
454	1363	4
1089	1364	9
1009	1364	2
1270	1364	3
1718	1364	10
633	1365	4
471	1365	1
439	1365	14
1203	1366	4
1740	1366	2
390	1366	14
1352	1367	6
1540	1367	8
287	1367	8
418	1367	8
609	1367	4
554	1367	15
1659	1368	8
20	1368	4
428	1368	7
411	1368	11
538	1368	5
838	1369	5
1019	1369	3
816	1369	9
1132	1369	8
139	1369	12
1345	1370	4
1506	1370	7
94	1370	15
159	1370	9
376	1370	4
1365	1371	12
1194	1371	1
1728	1371	4
864	1372	3
1706	1372	10
122	1372	3
371	1372	4
839	1373	15
1733	1373	1
436	1373	3
815	1374	7
1425	1374	11
1547	1374	4
174	1374	5
1461	1375	6
1135	1375	3
1527	1375	7
226	1375	5
594	1375	10
253	1376	2
515	1376	1
664	1376	12
799	1377	9
1273	1377	1
1267	1377	11
1247	1377	7
1154	1378	10
152	1378	3
397	1378	2
460	1378	4
1067	1379	1
1208	1379	5
1614	1379	13
793	1380	10
1774	1380	2
401	1380	8
728	1380	9
550	1380	5
1106	1381	1
142	1381	10
337	1381	2
1020	1382	3
1177	1382	11
1685	1382	7
1736	1382	6
110	1382	7
517	1382	6
1075	1383	3
1427	1383	15
1786	1383	3
1662	1383	3
871	1384	12
1332	1384	5
360	1384	6
192	1384	8
474	1384	5
819	1385	5
891	1385	5
1747	1385	7
80	1385	12
657	1385	6
1192	1386	5
1366	1386	3
1479	1386	7
716	1386	13
666	1386	8
1083	1387	3
1049	1387	4
1162	1387	10
626	1387	3
880	1388	10
91	1388	5
272	1388	4
656	1388	5
886	1389	3
1409	1389	3
1448	1389	2
364	1389	12
971	1390	15
826	1390	2
580	1390	1
1071	1391	4
411	1391	2
418	1391	15
523	1391	3
1051	1392	8
1085	1392	7
112	1392	8
292	1392	13
395	1392	8
436	1392	8
721	1392	8
793	1393	6
885	1393	6
1396	1393	6
1158	1393	6
1564	1393	2
110	1393	15
914	1394	2
1454	1394	1
798	1395	3
552	1395	4
718	1395	3
959	1396	9
1169	1396	5
1244	1396	4
43	1396	7
1055	1397	2
1176	1397	2
1640	1397	7
218	1398	3
588	1398	5
463	1398	4
1255	1399	8
235	1399	8
457	1399	1
956	1400	3
1583	1400	2
1474	1400	5
837	1401	3
1469	1401	3
19	1401	5
1183	1402	5
1165	1402	7
70	1402	7
576	1402	6
731	1402	6
1208	1403	2
1729	1403	1
1831	1404	7
384	1404	3
696	1404	9
1076	1405	2
1770	1405	3
214	1405	4
982	1406	3
206	1407	3
451	1407	1
1338	1408	1
1583	1409	3
1526	1409	1
77	1410	2
394	1410	4
1463	1411	3
1425	1411	1
1077	1412	9
908	1412	3
1581	1412	9
91	1412	3
1650	1413	1
141	1413	2
194	1414	3
18	1414	4
635	1414	4
802	1415	8
940	1415	6
1269	1415	3
187	1415	4
893	1416	3
1433	1416	2
212	1416	4
175	1417	4
552	1417	1
1794	1418	5
262	1418	9
370	1418	5
691	1418	7
1635	1419	3
123	1419	3
225	1419	3
764	1420	8
913	1420	6
327	1420	9
123	1420	6
388	1420	4
937	1421	3
1371	1421	4
1258	1421	9
107	1421	9
1742	1422	4
314	1422	1
1027	1423	2
744	1423	3
1475	1423	5
1179	1424	2
1498	1424	1
1571	1425	1
234	1425	2
798	1426	1
1756	1426	2
23	1427	1
636	1427	5
860	1428	3
1388	1428	5
1769	1428	3
863	1429	9
814	1429	9
1708	1429	2
258	1429	8
521	1429	6
1105	1430	1
324	1430	5
1047	1431	4
1149	1431	3
327	1431	4
1813	1432	1
654	1432	4
879	1433	3
1482	1433	1
1412	1434	5
1605	1434	5
542	1434	5
1150	1435	2
553	1435	2
643	1435	3
1114	1436	5
536	1436	1
1714	1437	8
288	1437	4
258	1437	7
283	1437	5
952	1438	2
1398	1438	1
1100	1439	2
996	1439	3
356	1439	3
1437	1440	2
1349	1440	3
238	1440	2
1251	1441	1
48	1441	2
694	1442	4
486	1442	2
376	1442	2
976	1443	1
1789	1443	2
1082	1444	1
1249	1444	3
918	1445	1
1207	1445	3
1670	1446	2
1834	1446	1
1666	1447	2
342	1447	5
430	1447	4
1127	1448	2
1585	1448	2
1042	1449	2
211	1449	2
189	1449	3
789	1450	6
852	1450	7
1354	1450	11
1127	1450	15
1502	1450	8
14	1450	11
154	1450	15
566	1450	4
401	1450	10
202	1451	5
356	1451	4
145	1451	2
1340	1452	6
175	1452	5
621	1452	4
669	1452	9
913	1453	5
1610	1453	8
12	1453	8
41	1453	3
852	1454	3
1347	1454	5
245	1454	3
1349	1455	1
347	1455	5
1516	1456	1
527	1456	3
1479	1457	5
272	1457	2
656	1457	2
931	1458	6
1104	1458	3
1783	1458	7
64	1458	5
280	1459	5
68	1459	5
252	1459	5
868	1460	5
1791	1460	3
508	1460	4
1369	1461	2
1790	1461	1
77	1462	1
110	1462	5
880	1463	4
1401	1463	6
673	1463	4
610	1463	9
958	1464	1
1215	1464	2
1427	1465	2
1508	1465	1
1214	1466	1
1650	1466	3
896	1467	3
271	1467	5
580	1467	4
1042	1468	1
1312	1468	4
805	1469	3
1353	1470	1
672	1470	2
1801	1471	9
437	1471	9
178	1472	3
331	1472	2
1690	1473	4
294	1473	3
344	1473	4
1819	1474	2
44	1474	6
47	1474	5
458	1474	6
751	1475	5
1225	1475	5
311	1475	4
1443	1476	1
331	1476	5
101	1477	2
329	1477	1
807	1478	1
610	1478	3
1681	1480	2
711	1480	1
944	1481	4
638	1481	1
1258	1482	5
1774	1482	4
75	1482	4
1266	1483	1
1356	1483	2
112	1485	4
1052	1486	1
92	1486	5
795	1487	2
1220	1487	1
734	1488	2
879	1488	1
1079	1489	2
1131	1489	8
1625	1489	2
1508	1489	9
148	1490	4
26	1490	5
192	1490	4
1699	1491	1
40	1491	5
1661	1492	7
284	1492	6
246	1492	9
117	1492	9
576	1492	7
530	1492	8
1823	1493	5
704	1494	3
485	1494	1
1071	1495	6
62	1495	7
948	1496	4
1248	1496	5
681	1496	4
488	1497	5
641	1497	1
1359	1498	2
164	1498	1
834	1499	5
1018	1499	5
1390	1499	4
1382	1500	3
1759	1500	3
320	1500	3
236	1501	1
190	1501	2
1179	1502	1
1699	1502	2
1543	1503	2
1750	1504	5
595	1504	1
1289	1505	4
1369	1505	6
1604	1505	7
534	1505	5
1170	1506	5
917	1507	5
1527	1507	4
1504	1507	2
859	1508	2
1371	1508	2
1366	1508	2
907	1509	2
453	1509	1
1109	1510	1
1277	1510	8
1784	1510	6
1032	1511	2
1520	1511	4
308	1511	2
1004	1512	2
1429	1512	2
1050	1513	3
1634	1513	1
863	1514	6
1165	1514	5
1794	1514	3
1828	1514	6
244	1515	6
615	1515	3
727	1515	7
673	1515	5
209	1516	7
349	1516	7
402	1516	7
472	1516	6
438	1516	6
410	1516	6
1405	1517	4
341	1517	3
682	1517	3
1701	1518	4
1584	1518	4
248	1518	3
1024	1519	1
535	1519	2
1304	1520	4
1645	1520	6
253	1520	8
319	1520	5
1017	1521	2
1566	1521	1
1256	1522	8
365	1522	4
696	1522	4
875	1523	5
1066	1523	4
898	1523	2
105	1524	2
694	1524	1
1664	1525	2
420	1525	1
1440	1526	4
34	1526	4
633	1526	5
829	1527	3
683	1527	1
987	1528	7
1084	1528	5
1216	1528	9
146	1528	4
344	1529	5
365	1529	3
79	1529	4
991	1530	2
766	1530	1
933	1531	4
42	1531	3
197	1531	4
1031	1532	6
840	1532	14
969	1532	14
1346	1532	6
1190	1532	10
1281	1532	12
1845	1532	12
307	1532	5
648	1532	6
954	1533	4
1121	1533	3
1275	1533	4
173	1534	2
384	1534	1
1091	1535	4
985	1535	8
1271	1535	5
185	1535	8
920	1536	5
1246	1536	2
1741	1536	4
1324	1537	7
98	1537	4
421	1537	3
692	1537	6
915	1538	5
1088	1538	3
96	1538	7
214	1538	7
1211	1539	1
519	1539	2
1759	1540	6
84	1540	8
142	1540	7
699	1540	9
720	1540	7
1097	1541	2
750	1541	7
1769	1541	8
906	1542	5
1839	1542	4
120	1542	2
1215	1543	1
1208	1543	3
1721	1544	1
510	1544	2
159	1545	2
135	1545	3
486	1545	3
1016	1546	8
1212	1546	9
1790	1546	4
1771	1546	9
153	1546	6
1094	1547	1
1311	1547	3
893	1548	5
98	1548	3
936	1549	1
1486	1549	3
1286	1550	2
1126	1550	1
1157	1551	2
418	1551	4
720	1551	4
1477	1552	8
570	1552	2
652	1552	8
447	1552	3
1007	1553	5
1790	1553	2
1702	1553	6
242	1553	6
686	1554	5
649	1554	4
814	1555	5
1306	1555	4
545	1555	3
174	1556	4
234	1556	5
684	1556	3
982	1557	7
950	1557	6
765	1557	5
147	1557	5
875	1558	2
1263	1558	8
338	1558	3
413	1558	7
252	1559	4
68	1559	4
280	1559	4
1375	1560	5
1616	1560	3
639	1560	5
1419	1561	6
1775	1561	2
1514	1561	3
449	1561	6
1059	1562	1
1757	1562	2
1041	1563	3
1465	1563	7
1569	1563	3
1539	1563	6
737	1564	14
1351	1564	7
1555	1564	14
1654	1564	10
712	1564	6
699	1564	7
441	1564	5
984	1565	3
1095	1565	9
987	1565	11
753	1565	15
365	1565	25
10	1565	7
375	1565	14
436	1565	6
384	1565	11
940	1566	4
953	1566	14
1450	1566	6
1382	1566	10
1361	1566	6
1384	1566	6
1782	1566	10
296	1566	13
863	1567	12
1150	1567	7
1255	1567	13
1201	1567	3
89	1567	10
425	1567	10
380	1567	5
1063	1568	1
840	1568	13
1285	1568	13
231	1568	9
444	1568	15
851	1569	9
1555	1569	5
298	1569	6
312	1569	10
197	1569	10
96	1569	15
630	1569	7
1306	1570	8
1152	1570	10
1497	1570	9
301	1570	5
15	1570	9
648	1570	12
586	1570	10
1056	1571	8
1112	1571	14
1214	1571	12
172	1571	4
545	1571	6
568	1571	14
676	1571	6
980	1572	14
1469	1572	5
1153	1572	14
1183	1572	6
262	1572	6
670	1572	7
616	1572	10
831	1573	8
1352	1573	10
1392	1573	10
1706	1573	13
448	1573	1
1118	1574	12
1143	1574	15
32	1574	6
467	1574	1
520	1574	14
941	1575	14
821	1575	12
1180	1575	6
172	1575	15
167	1575	7
392	1575	4
569	1575	7
1051	1576	3
15	1576	8
274	1576	3
588	1576	12
475	1576	14
618	1576	10
1845	1577	9
623	1577	5
622	1577	5
536	1577	11
538	1577	11
1455	1578	9
1191	1578	9
1596	1578	11
1590	1578	8
229	1578	12
426	1578	5
782	1579	10
1390	1579	6
1460	1579	10
1440	1579	5
11	1579	4
870	1580	3
1030	1580	9
1117	1580	8
411	1580	10
710	1580	10
1627	1581	11
270	1581	3
134	1581	11
1272	1582	10
1170	1582	15
1718	1582	8
228	1582	6
61	1582	9
45	1582	9
654	1582	7
844	1583	15
1825	1583	3
1546	1583	14
60	1583	8
201	1583	9
368	1583	8
1817	1584	10
1820	1584	13
38	1584	8
424	1584	5
497	1584	5
973	1585	8
781	1585	6
1786	1585	7
1637	1585	10
217	1585	7
207	1585	8
692	1585	12
925	1586	9
1050	1586	8
1188	1586	11
1631	1586	9
1716	1586	11
1542	1586	8
225	1586	6
1223	1587	6
1108	1587	5
284	1587	10
291	1587	4
853	1588	10
170	1588	2
574	1588	3
433	1588	9
440	1588	12
875	1589	7
1668	1589	6
25	1589	5
688	1589	10
456	1589	7
1084	1590	4
1430	1590	4
1355	1590	6
196	1590	12
228	1590	10
1035	1591	15
1253	1591	11
215	1591	5
73	1591	9
399	1591	5
780	1592	11
1458	1592	4
1199	1592	3
1665	1592	9
242	1592	10
1088	1593	5
1096	1593	10
1661	1593	3
1754	1593	6
1608	1593	15
1039	1594	4
1276	1594	2
1727	1594	10
224	1594	10
621	1594	8
242	1595	9
572	1595	8
688	1595	14
385	1595	7
710	1595	5
1636	1596	4
77	1596	4
174	1596	11
508	1596	7
947	1597	5
1774	1597	3
1505	1597	11
596	1597	7
918	1598	11
779	1598	8
1217	1598	2
1416	1598	5
909	1599	8
1596	1599	9
1633	1599	8
1722	1599	2
392	1599	13
1057	1600	15
1256	1600	9
213	1600	5
173	1600	9
491	1600	8
1025	1601	3
1163	1601	2
1401	1601	12
248	1601	9
789	1602	9
1288	1602	7
526	1602	3
593	1602	10
625	1602	8
999	1603	4
739	1603	6
807	1603	8
286	1603	6
401	1603	11
912	1604	3
1502	1604	2
310	1604	10
172	1604	7
866	1605	5
1359	1605	13
346	1605	8
446	1605	5
917	1606	3
1689	1606	13
1725	1606	4
698	1606	9
1425	1607	8
1449	1607	6
29	1607	7
282	1607	12
420	1607	2
1100	1608	5
1445	1608	4
1654	1608	6
511	1608	14
915	1609	3
1827	1609	3
1817	1609	7
248	1609	10
802	1610	10
1328	1610	1
484	1610	8
1567	1611	8
316	1611	12
291	1611	6
185	1611	4
413	1611	8
743	1612	15
1629	1612	8
1495	1612	2
406	1612	4
151	1613	15
322	1613	5
489	1613	6
387	1613	5
1432	1614	7
1422	1614	5
1261	1614	15
1802	1614	8
325	1614	9
928	1615	2
1686	1615	6
43	1615	4
494	1615	12
1329	1616	5
1346	1616	7
1785	1616	5
134	1616	14
823	1617	3
896	1617	11
1751	1617	7
1641	1617	6
1603	1617	8
735	1618	7
1306	1618	11
1337	1618	3
1786	1618	5
803	1619	3
1200	1619	25
1606	1619	9
444	1619	10
558	1619	2
816	1620	3
600	1620	6
459	1620	13
969	1621	12
1146	1621	4
1495	1621	9
1648	1621	4
1032	1622	6
1177	1622	13
1560	1622	6
544	1622	4
674	1622	7
1012	1623	8
1645	1623	8
1592	1623	7
1801	1623	13
45	1623	5
244	1624	5
489	1624	5
564	1624	9
621	1624	12
836	1625	4
1183	1625	7
391	1625	4
535	1625	10
1594	1626	6
91	1626	8
347	1626	10
557	1626	7
536	1626	5
25	1627	3
465	1627	5
428	1627	10
616	1627	8
140	1628	6
294	1628	10
114	1628	8
614	1628	9
649	1628	7
436	1628	9
935	1629	11
1131	1629	4
1612	1629	5
1518	1629	7
771	1630	10
739	1630	7
564	1630	1
1026	1631	7
137	1631	14
617	1631	3
1135	1632	4
487	1632	12
1335	1633	6
76	1633	2
280	1633	12
85	1633	7
84	1633	6
1079	1634	9
1598	1634	3
304	1634	6
194	1634	6
151	1634	12
1033	1635	7
1816	1635	2
103	1635	4
283	1635	15
845	1636	3
1378	1636	7
285	1636	11
120	1636	5
1260	1637	15
1322	1637	3
1688	1637	4
858	1638	4
1337	1638	6
1363	1638	5
341	1638	15
1481	1639	3
259	1639	4
19	1639	10
401	1639	6
1119	1640	3
187	1640	8
8	1640	11
375	1640	5
1090	1641	4
1127	1641	12
1539	1641	5
573	1641	6
1845	1642	3
1621	1642	4
728	1642	12
1432	1643	12
1508	1643	5
1641	1643	7
860	1644	4
1449	1644	8
1128	1644	11
282	1644	7
628	1644	7
843	1645	12
19	1645	8
563	1645	5
662	1645	3
837	1646	6
1286	1646	10
1668	1646	2
342	1646	3
880	1647	5
1100	1647	3
1802	1647	7
612	1647	12
979	1648	10
157	1648	3
575	1648	4
406	1648	6
1743	1649	11
1838	1649	1
649	1649	6
1118	1650	18
1794	1650	4
350	1650	8
548	1650	4
1159	1651	5
519	1651	11
551	1651	4
438	1651	9
753	1652	1
494	1652	15
395	1652	6
174	1653	9
73	1653	10
8	1653	4
537	1653	2
741	1654	10
364	1654	6
370	1654	1
17	1655	10
13	1655	5
1	1655	6
5	1655	5
1396	1656	15
1514	1656	2
96	1656	6
692	1656	4
1074	1657	10
1190	1657	9
1136	1657	5
1711	1657	6
485	1657	7
1375	1658	2
1738	1658	8
296	1658	2
549	1658	11
1434	1659	8
1413	1659	13
1455	1659	11
1118	1659	16
1235	1659	8
1668	1659	11
76	1659	8
142	1659	11
638	1659	6
466	1659	15
850	1660	4
2	1660	8
362	1660	5
1139	1661	7
1615	1661	1
1123	1662	7
1762	1662	2
1769	1662	4
873	1663	2
1428	1663	5
587	1663	7
821	1664	1
231	1664	7
1374	1665	4
1684	1665	8
246	1665	7
448	1665	7
1513	1666	6
603	1666	5
856	1667	9
771	1667	7
1492	1667	2
467	1667	8
829	1668	4
1696	1668	3
519	1668	8
1343	1669	6
1248	1669	4
1568	1669	5
1136	1670	2
56	1670	4
30	1670	9
1249	1671	4
1188	1671	4
487	1671	7
811	1672	9
1352	1672	8
1167	1672	8
609	1672	8
1480	1673	2
235	1673	9
238	1673	3
1033	1674	4
1820	1674	8
590	1674	2
1066	1675	2
1126	1675	5
93	1675	8
1009	1676	9
1123	1676	9
1808	1676	5
243	1676	8
220	1677	5
287	1677	7
1249	1678	6
11	1678	5
37	1678	5
1189	1679	7
582	1679	3
519	1679	4
1378	1680	6
1289	1680	9
295	1680	5
109	1680	7
1068	1681	2
1305	1681	8
111	1681	2
1162	1682	9
446	1682	4
457	1682	5
1177	1683	9
713	1683	1
800	1684	5
1676	1684	7
38	1684	3
1364	1685	3
1780	1685	6
1829	1685	4
865	1686	6
246	1686	2
685	1686	3
978	1687	4
696	1687	7
411	1687	4
807	1688	6
1516	1688	5
1608	1688	2
1381	1689	8
1726	1690	5
1535	1690	4
236	1690	6
1739	1691	8
940	1692	8
1841	1692	1
1287	1693	4
1702	1693	3
678	1693	9
1453	1694	7
1173	1694	2
479	1694	2
811	1695	7
281	1695	4
204	1695	9
597	1695	6
1390	1696	3
1650	1696	9
403	1696	4
853	1697	5
1048	1697	9
1090	1697	2
974	1698	9
510	1698	1
1197	1699	2
528	1699	6
379	1699	5
1083	1700	6
25	1701	4
202	1701	3
662	1701	8
862	1702	1
441	1702	7
71	1703	5
98	1703	7
95	1703	5
1794	1704	7
221	1704	2
615	1704	2
860	1705	8
1352	1705	5
609	1705	5
1087	1706	9
1026	1707	9
1592	1707	8
382	1707	7
599	1707	4
1490	1708	1
212	1708	7
1400	1709	1
65	1709	7
887	1710	1
1233	1710	6
1096	1711	4
1138	1711	6
984	1712	8
200	1712	3
523	1712	4
830	1713	5
1153	1713	5
185	1713	7
1461	1714	7
1389	1714	9
1527	1714	8
226	1714	3
73	1715	4
58	1715	9
379	1715	4
1244	1716	6
1527	1717	3
522	1717	3
696	1717	6
1228	1718	3
1540	1718	9
1514	1718	7
418	1718	9
1818	1719	6
1492	1720	9
34	1720	3
376	1720	3
946	1721	7
1689	1721	2
1688	1721	2
1259	1722	4
1261	1722	2
1603	1722	7
880	1723	9
1351	1723	6
307	1723	6
385	1723	5
830	1724	4
533	1724	4
645	1724	8
1432	1725	4
82	1725	9
698	1725	5
890	1726	9
907	1726	6
1831	1726	5
483	1726	7
5	1727	4
13	1727	4
86	1727	6
1192	1728	8
1493	1728	9
253	1728	4
139	1728	8
822	1729	7
391	1729	1
1730	1730	8
643	1730	4
713	1730	4
234	1731	4
338	1731	4
1512	1732	1
1760	1732	6
1286	1733	9
1346	1733	1
1469	1734	1
1765	1734	6
1190	1735	4
1630	1735	2
636	1735	7
1786	1736	4
1594	1736	4
64	1736	6
1703	1737	8
424	1737	2
727	1737	6
720	1737	8
826	1738	3
1164	1738	3
1116	1738	7
1019	1739	5
919	1739	3
1607	1739	7
1263	1740	3
1599	1740	8
354	1740	5
1101	1741	4
1256	1741	5
1471	1741	8
813	1742	4
1466	1742	8
1222	1742	6
476	1742	8
1130	1743	1
324	1743	6
828	1744	7
1453	1744	5
724	1744	3
1086	1745	4
1638	1745	7
101	1745	5
896	1746	4
1260	1746	8
477	1746	4
1170	1747	2
696	1747	3
528	1747	7
759	1748	2
207	1748	10
357	1748	13
116	1748	10
463	1748	7
688	1748	8
520	1748	10
1553	1749	7
263	1749	1
1182	1750	9
41	1750	5
263	1750	3
939	1751	9
1197	1751	3
528	1751	5
1733	1752	6
1573	1752	4
585	1752	2
1705	1753	1
135	1753	7
773	1754	6
1232	1754	3
447	1754	4
1141	1755	5
1746	1755	2
981	1756	4
1056	1757	7
1423	1757	7
1601	1757	4
183	1757	6
897	1758	5
1422	1758	2
338	1758	8
784	1759	4
1826	1759	4
356	1759	8
1821	1760	1
329	1760	8
1345	1761	5
1515	1761	3
301	1761	6
1323	1762	6
255	1762	5
62	1762	9
186	1762	9
968	1763	4
1506	1763	5
1686	1763	7
946	1764	10
1024	1764	13
1340	1764	12
1641	1764	12
1628	1764	5
141	1764	15
1297	1765	1
615	1765	6
960	1766	1
1713	1766	6
289	1767	9
605	1767	3
399	1767	3
925	1768	2
1565	1768	6
723	1768	4
1687	1769	6
1590	1769	6
391	1769	2
389	1769	8
1009	1770	15
1322	1770	10
1242	1770	5
1785	1770	8
1704	1770	12
557	1770	15
698	1770	13
622	1770	9
1356	1771	7
1735	1771	3
1579	1771	3
1582	1771	3
1265	1772	6
1522	1772	1
845	1773	5
481	1773	2
612	1773	6
1799	1774	5
41	1774	4
580	1774	9
1044	1775	3
1293	1775	2
1173	1775	8
1268	1776	5
1372	1776	2
91	1776	7
975	1777	5
1159	1777	7
1060	1778	5
1093	1778	5
100	1778	7
1010	1779	6
1380	1779	4
53	1779	9
711	1779	8
202	1780	7
613	1780	3
393	1780	5
758	1781	6
766	1781	4
1780	1781	2
1498	1782	3
198	1782	8
171	1782	4
1030	1783	7
1479	1783	6
126	1783	6
569	1783	4
1137	1784	7
1794	1784	13
1576	1784	11
1812	1784	5
144	1784	15
65	1784	11
677	1784	7
443	1784	10
1771	1785	6
1492	1785	1
124	1786	4
502	1786	3
386	1786	9
775	1787	8
1277	1787	4
318	1787	3
899	1788	9
1020	1788	2
245	1788	4
734	1789	6
1482	1789	3
1790	1789	6
281	1789	6
985	1790	10
1239	1790	12
1509	1790	10
1767	1790	9
1775	1790	12
240	1790	6
297	1790	8
511	1790	7
797	1791	4
1469	1791	10
1550	1791	6
240	1791	12
345	1791	10
108	1791	9
1276	1792	3
1471	1792	11
1335	1792	10
1532	1792	11
161	1792	10
122	1792	7
495	1792	9
823	1793	10
810	1793	10
747	1793	12
787	1793	12
801	1793	10
145	1793	11
178	1793	10
156	1793	7
726	1793	12
613	1793	8
723	1793	12
729	1793	9
965	1794	9
750	1794	12
745	1794	10
1281	1794	9
1654	1794	9
322	1794	15
307	1794	9
568	1794	10
1019	1795	9
819	1795	9
1199	1795	6
1335	1795	14
173	1795	10
227	1795	6
599	1795	14
1033	1796	10
1839	1796	12
1529	1796	5
1730	1796	15
1497	1796	8
369	1796	9
1048	1797	11
785	1797	8
1433	1797	6
1669	1797	9
1755	1797	8
529	1797	11
408	1797	12
927	1798	10
808	1798	1
338	1798	12
502	1798	12
844	1799	14
1281	1799	5
1131	1799	6
1219	1799	10
1688	1799	11
104	1799	6
747	1800	14
801	1800	9
810	1800	11
823	1800	6
199	1800	11
613	1800	9
579	1800	12
729	1800	11
723	1800	14
726	1800	11
479	1800	10
1363	1801	7
1473	1801	5
1596	1801	10
24	1801	8
20	1801	10
280	1801	14
1423	1802	13
1754	1802	8
85	1802	14
33	1802	3
266	1802	12
624	1802	8
758	1803	11
1296	1803	12
1449	1803	11
266	1803	7
452	1803	9
634	1803	5
741	1804	12
893	1804	13
275	1804	13
144	1804	8
612	1804	5
452	1804	6
821	1805	7
1449	1805	14
1376	1805	12
1494	1805	15
1794	1805	6
695	1805	5
1152	1806	5
1301	1806	14
1636	1806	8
142	1806	8
210	1806	13
392	1806	15
941	1807	11
1340	1807	15
1763	1807	14
871	1808	9
867	1808	10
1717	1808	5
24	1808	10
2	1808	7
295	1808	12
893	1809	10
842	1809	11
793	1809	8
808	1809	6
1432	1809	6
314	1809	11
46	1809	9
784	1810	11
1277	1810	11
1802	1810	11
1611	1810	9
1713	1810	5
612	1810	7
742	1811	7
258	1811	12
17	1811	14
359	1811	9
552	1811	3
521	1811	13
855	1812	9
1229	1812	8
1762	1812	11
335	1812	5
158	1812	10
461	1812	15
1150	1813	10
1312	1813	10
118	1813	4
32	1813	5
356	1813	11
1401	1814	9
1606	1814	4
2	1814	13
604	1814	11
595	1814	9
728	1814	14
850	1815	14
1354	1815	14
1546	1815	13
119	1815	4
625	1815	5
1045	1816	11
1110	1816	3
31	1816	13
462	1816	2
531	1816	15
1263	1817	11
163	1817	4
155	1817	10
43	1817	9
428	1817	13
1229	1818	2
1762	1818	8
172	1818	14
113	1818	15
51	1818	11
424	1818	9
1018	1819	13
1035	1819	14
846	1819	6
1264	1819	5
1494	1819	6
532	1819	10
1219	1820	14
1507	1820	15
1594	1820	2
624	1820	2
1374	1821	6
1195	1821	7
642	1821	12
705	1821	13
372	1821	3
965	1822	3
746	1822	13
780	1822	8
174	1822	15
470	1822	6
1225	1823	8
1233	1823	14
1494	1823	9
1778	1823	8
330	1823	8
224	1823	11
906	1824	13
1152	1824	6
1668	1824	4
1727	1824	6
121	1824	13
761	1825	14
1495	1825	3
1750	1825	4
1722	1826	5
1759	1826	8
1664	1826	8
634	1826	14
906	1827	8
858	1827	6
1404	1827	6
116	1827	12
137	1827	6
57	1827	10
1079	1828	8
1732	1828	6
393	1828	4
387	1828	11
636	1828	12
1027	1829	10
1192	1829	3
139	1829	11
375	1829	3
800	1830	13
836	1830	1
136	1830	14
1421	1831	9
69	1831	2
173	1831	11
19	1831	11
691	1831	8
963	1832	6
1341	1832	15
1306	1832	6
1689	1832	4
264	1832	14
892	1833	4
1201	1833	10
1783	1833	5
230	1833	13
1022	1834	11
949	1834	11
1148	1834	9
1109	1834	7
593	1834	5
1042	1835	15
34	1835	2
713	1835	14
725	1835	3
818	1836	10
1013	1836	1
635	1836	15
953	1837	5
139	1837	14
151	1837	11
815	1838	4
1199	1838	12
1626	1838	6
30	1838	8
1642	1839	3
146	1839	3
705	1839	11
642	1839	14
775	1840	5
1471	1840	12
1272	1840	5
295	1840	15
775	1841	11
1437	1841	4
280	1841	13
572	1841	5
1147	1842	10
178	1842	5
127	1842	11
516	1842	3
873	1843	1
284	1843	13
214	1843	13
1785	1844	6
1774	1844	11
1709	1844	4
562	1844	9
666	1844	10
896	1845	14
1165	1845	4
1233	1845	4
159	1845	12
1025	1846	4
294	1846	6
187	1846	12
649	1846	9
627	1846	13
1669	1847	12
1767	1847	4
263	1847	11
154	1847	5
822	1848	14
1793	1848	3
234	1848	13
617	1848	5
1473	1849	1
83	1849	15
547	1849	13
1075	1850	5
1009	1850	12
272	1850	15
407	1850	7
1366	1851	4
1644	1851	14
415	1851	2
633	1851	15
71	1852	1
98	1852	14
95	1852	12
431	1853	1
1033	1854	8
1051	1854	5
80	1854	10
444	1854	7
1454	1855	3
1241	1855	12
1683	1855	7
1665	1855	8
1580	1856	13
697	1856	1
1244	1857	2
1657	1857	2
631	1857	11
1549	1858	1
346	1858	10
733	1859	3
1689	1859	5
270	1859	12
966	1860	16
464	1860	5
715	1860	5
1003	1861	3
1775	1861	5
184	1861	14
1301	1862	12
760	1863	3
771	1863	2
1644	1863	10
36	1864	11
1496	1865	4
1506	1865	11
668	1865	5
999	1866	11
972	1867	13
1393	1867	4
1507	1867	3
1278	1868	3
1678	1868	7
4	1868	12
6	1868	8
1418	1869	13
1793	1870	4
172	1870	5
598	1870	14
1456	1871	15
1107	1871	1
1297	1872	3
1456	1872	3
444	1872	12
204	1873	13
90	1873	7
101	1873	4
617	1873	7
1176	1874	11
1573	1874	8
344	1874	9
369	1874	5
1489	1875	5
529	1875	3
642	1875	11
367	1876	12
728	1876	1
1845	1877	2
1641	1877	15
1831	1877	3
867	1878	4
1358	1878	2
1707	1878	11
804	1879	11
911	1879	4
1492	1879	4
1020	1880	5
1570	1880	12
1685	1880	6
363	1880	7
1432	1881	5
12	1881	12
765	1882	15
1465	1882	1
1744	1883	13
672	1883	1
1831	1884	13
124	1884	2
710	1884	2
661	1885	15
368	1886	15
1253	1887	1
1621	1887	13
1698	1888	2
1767	1888	2
1516	1888	15
1360	1889	9
1310	1889	10
1734	1889	7
695	1889	4
843	1890	10
1056	1890	1
965	1891	15
975	1891	8
1459	1891	6
1592	1891	5
1513	1892	8
152	1892	12
354	1892	7
509	1892	2
1040	1893	6
1083	1893	5
46	1893	15
394	1893	6
834	1894	1
713	1894	13
1235	1895	6
15	1895	3
310	1895	6
80	1895	11
1389	1896	4
1440	1896	15
1362	1896	6
1779	1896	8
1121	1898	4
1318	1898	2
448	1898	11
1587	1899	5
330	1899	15
129	1899	3
761	1900	8
1153	1900	11
484	1900	6
407	1900	5
1178	1901	5
221	1901	13
496	1901	5
759	1902	3
711	1902	4
426	1902	13
1314	1903	3
1541	1903	15
115	1903	4
1003	1904	10
1052	1904	4
1697	1904	2
804	1905	12
1484	1905	3
1823	1905	2
442	1906	11
1592	1907	3
99	1907	3
793	1908	1
314	1908	10
804	1909	4
63	1909	12
1815	1910	3
31	1910	3
459	1910	14
844	1911	3
1612	1911	12
722	1911	3
1317	1912	1
1221	1913	8
1203	1913	14
8	1913	5
282	1913	6
1651	1914	8
1580	1914	7
230	1914	4
178	1914	15
1212	1915	15
290	1915	1
881	1916	10
794	1916	5
276	1916	4
893	1917	15
753	1917	4
1494	1917	3
856	1918	12
1224	1918	3
1756	1918	6
174	1918	6
986	1919	13
1139	1919	5
291	1919	3
1275	1920	1
431	1920	12
1203	1921	1
175	1921	13
752	1922	4
1046	1922	3
51	1922	12
30	1923	14
815	1924	5
1565	1924	12
1626	1924	5
1587	1925	2
662	1925	11
384	1925	2
1371	1926	14
731	1927	14
985	1928	5
1597	1928	2
568	1928	11
940	1929	5
174	1929	12
322	1929	6
720	1929	6
914	1930	15
1355	1931	5
1636	1931	7
215	1931	6
384	1931	10
1320	1932	4
67	1932	3
607	1932	13
1367	1933	7
275	1933	14
24	1933	4
530	1933	9
1567	1934	13
140	1934	2
382	1934	3
1660	1935	4
1820	1935	5
656	1935	14
1586	1936	1
567	1936	15
1041	1937	2
1603	1937	4
724	1937	12
358	1938	14
929	1939	12
1500	1939	2
9	1939	5
348	1940	13
946	1941	6
1624	1941	5
1628	1941	7
1142	1942	11
1323	1942	1
1392	1943	2
304	1943	4
525	1943	11
1030	1944	13
819	1944	3
524	1944	2
1035	1945	11
1031	1945	4
631	1945	3
1749	1946	13
241	1946	5
660	1946	5
1470	1947	5
284	1947	5
344	1947	14
1405	1948	1
702	1948	10
819	1949	1
373	1949	12
1006	1950	9
894	1950	3
769	1950	9
96	1950	10
749	1951	7
1151	1951	4
85	1951	13
8	1951	8
1046	1952	14
1153	1952	4
1227	1952	2
1216	1953	7
82	1953	5
95	1953	7
628	1953	11
902	1954	12
364	1954	3
502	1954	4
833	1955	13
887	1956	11
164	1956	4
193	1956	4
1816	1957	1
283	1957	11
854	1958	1
1788	1958	13
1240	1959	14
498	1959	1
910	1960	11
1439	1960	7
1500	1960	6
1647	1960	8
380	1960	6
1063	1961	4
1588	1961	12
74	1961	2
837	1962	9
1232	1962	4
1603	1962	14
588	1962	6
995	1963	7
1315	1963	5
1180	1963	8
1785	1963	10
1089	1964	6
1565	1964	4
1486	1964	14
842	1965	4
1393	1965	9
78	1965	8
329	1965	13
1051	1966	11
227	1966	9
32	1966	7
500	1966	4
934	1967	8
802	1967	9
181	1967	11
302	1967	7
146	1967	7
988	1968	4
1187	1968	9
1370	1968	8
339	1968	11
1321	1969	4
1569	1969	15
326	1969	3
1687	1970	15
1396	1971	10
1488	1971	8
1580	1971	8
306	1971	4
1023	1972	1
713	1972	12
732	1973	1
1242	1973	14
1172	1974	3
1566	1974	7
103	1974	9
647	1974	14
1173	1975	14
1381	1975	1
803	1976	5
1200	1976	20
1683	1976	4
1420	1977	13
1134	1977	1
1368	1978	5
253	1978	11
407	1978	2
323	1979	5
309	1979	7
166	1979	13
369	1979	7
923	1980	5
1780	1980	4
134	1980	10
843	1981	7
1527	1981	14
627	1981	8
651	1981	5
1266	1982	3
252	1982	11
289	1982	2
166	1983	14
577	1983	1
988	1984	10
1002	1984	7
1296	1984	5
200	1984	8
948	1985	3
1700	1985	15
94	1985	4
1057	1986	14
1227	1986	6
1679	1986	5
462	1986	7
1018	1987	9
179	1987	9
269	1987	3
635	1987	10
139	1988	15
99	1988	2
358	1988	3
1429	1989	5
1695	1989	5
476	1989	14
1068	1990	7
1099	1990	2
814	1990	8
989	1990	10
1070	1991	12
1450	1991	9
1810	1991	3
1760	1991	8
1024	1992	6
1355	1992	12
1665	1992	3
414	1992	6
1252	1993	5
1802	1993	14
677	1993	3
1630	1994	5
1841	1994	9
1562	1994	9
1686	1994	10
1372	1995	3
1494	1995	11
494	1995	3
878	1996	1
1350	1996	11
595	1997	5
414	1997	2
1186	1998	3
1830	1998	4
1330	1999	1
734	2000	3
667	2000	5
473	2003	2
519	2003	3
321	2004	1
1651	2005	4
398	2005	4
1356	2007	5
1525	2007	2
1637	2008	3
677	2008	4
924	2009	1
366	2010	1
1247	2012	4
997	2013	1
871	2019	5
1456	2019	4
795	2022	1
303	2030	1
1432	2032	1
981	2033	2
922	2034	5
589	2034	3
1427	2036	3
1252	2036	3
398	2037	1
1390	2041	5
1804	2041	4
1612	2042	1
1330	2044	4
199	2044	2
1217	2047	4
1740	2047	8
52	2047	8
1402	2049	1
1820	2050	9
1659	2050	7
305	2050	9
137	2050	7
914	2052	3
1454	2052	2
571	2053	3
679	2053	5
1168	2055	1
1177	2056	7
283	2056	8
713	2056	3
1074	2057	4
1788	2057	3
1176	2058	5
557	2058	5
1467	2060	2
79	2060	3
1489	2062	1
375	2063	1
1412	2064	4
1597	2064	5
1074	2065	1
92	2066	1
748	2067	7
1754	2067	2
650	2067	8
1373	2068	1
1538	2069	3
611	2069	2
974	2070	3
1749	2070	8
241	2070	8
1283	2071	7
1724	2071	3
318	2071	6
998	2074	4
1271	2074	3
1432	2075	8
1719	2075	4
532	2075	9
1234	2076	4
442	2076	3
903	2077	7
1225	2077	9
1672	2077	3
1145	2078	4
1118	2078	2
629	2079	1
249	2081	4
437	2081	5
1312	2082	5
1121	2082	5
324	2083	1
1350	2085	1
1055	2087	1
1157	2088	3
1260	2088	5
1461	2092	1
1072	2093	3
997	2093	2
1079	2095	5
193	2095	3
1836	2096	1
1415	2097	1
1067	2098	2
1614	2098	3
1107	2099	3
1488	2099	5
952	2100	4
879	2100	4
214	2102	1
1181	2104	1
687	2106	1
1337	2107	5
1780	2107	5
464	2108	1
1145	2113	1
1782	2119	7
451	2119	3
412	2119	7
975	2120	4
1713	2120	2
1533	2121	1
911	2123	2
1379	2123	2
907	2124	1
883	2130	3
1488	2130	3
643	2131	5
1098	2135	3
1111	2135	3
1413	2136	5
696	2136	2
788	2137	4
1129	2137	4
340	2141	5
551	2141	5
1499	2143	1
768	2144	1
1028	2145	3
1147	2145	4
476	2147	1
823	2148	1
870	2150	4
724	2150	5
756	2153	5
987	2153	9
1339	2154	1
1207	2157	1
1586	2158	4
199	2158	3
1499	2159	3
1558	2159	3
930	2160	6
1474	2160	6
151	2160	4
1417	2161	1
1449	2165	9
1187	2165	8
1539	2165	2
1352	2170	4
609	2170	3
1345	2171	3
121	2171	3
966	2173	3
555	2173	2
1680	2174	1
1200	2177	1
1705	2179	5
135	2179	4
720	2180	2
628	2180	3
59	2182	1
793	2185	7
1722	2185	6
550	2185	4
1614	2188	1
1255	2189	1
924	2192	3
1790	2192	3
499	2193	1
1453	2195	1
1450	2197	5
1557	2197	5
1398	2198	4
442	2198	5
421	2200	2
692	2200	2
832	2201	9
1249	2201	5
263	2201	8
823	2202	4
580	2202	5
1507	2203	5
206	2203	5
889	2207	5
938	2207	4
942	2209	9
899	2209	7
268	2209	4
983	2210	1
168	2213	5
709	2213	4
1135	2214	5
659	2216	1
1028	2218	5
1422	2218	4
1033	2219	5
1561	2219	5
355	2220	1
752	2222	8
1101	2222	5
1560	2222	7
1207	2223	4
573	2223	2
1175	2225	3
18	2225	2
958	2227	2
1222	2227	2
1036	2228	3
813	2228	5
689	2229	1
352	2230	6
595	2230	7
617	2230	2
1365	2234	6
1396	2234	8
1116	2234	3
1186	2237	1
1768	2238	1
735	2240	9
1331	2240	8
1844	2240	8
227	2240	7
1716	2241	1
772	2243	1
1359	2244	1
541	2246	1
1833	2249	1
1691	2251	1
1126	2254	4
1808	2254	2
799	2255	5
1459	2255	5
896	2256	5
704	2256	2
1131	2258	2
195	2258	2
1380	2261	1
1259	2263	1
1603	2266	9
263	2266	9
90	2266	5
1234	2268	1
1405	2270	3
341	2270	4
1524	2272	1
947	2274	8
1419	2274	5
1611	2274	8
101	2276	1
194	2277	1
1262	2281	4
1159	2281	3
397	2285	4
460	2285	5
1714	2286	1
602	2288	1
386	2289	1
791	2290	1
1381	2291	2
1700	2291	3
972	2294	4
1835	2294	5
203	2297	5
477	2297	5
1085	2300	4
1685	2300	5
418	2301	5
696	2301	5
744	2302	1
702	2304	1
1003	2307	8
846	2307	13
1471	2307	13
1774	2307	9
1575	2307	10
316	2307	11
542	2307	15
935	2308	1
1029	2309	3
316	2309	5
780	2310	5
1206	2310	6
361	2310	6
1444	2312	1
1103	2313	1
1093	2316	2
1747	2316	3
1470	2318	4
1781	2318	5
371	2319	5
700	2319	5
1696	2321	2
551	2321	2
1314	2322	1
935	2326	5
1747	2326	5
1163	2328	3
1490	2328	3
966	2329	2
555	2329	3
1079	2330	6
1315	2330	4
419	2330	6
1712	2331	1
1663	2332	1
1743	2333	4
82	2333	4
804	2335	1
1010	2336	1
921	2338	3
1504	2338	4
1075	2340	7
219	2340	5
608	2340	6
175	2344	1
842	2348	9
1414	2348	3
1602	2348	7
1464	2349	5
1507	2349	2
1485	2350	1
1174	2354	2
727	2354	5
1652	2357	1
853	2359	3
433	2359	4
1199	2360	2
607	2360	8
1072	2361	8
1179	2361	5
1498	2361	8
1687	2363	1
1220	2364	3
52	2364	2
387	2366	1
31	2367	1
1171	2368	1
724	2369	1
1276	2370	4
1764	2370	5
783	2371	2
1633	2371	7
529	2371	7
1068	2372	3
1305	2372	2
872	2374	1
1791	2375	1
1277	2377	7
338	2377	6
318	2377	4
1233	2379	3
624	2379	4
1386	2380	3
308	2380	4
758	2381	1
1369	2383	1
913	2384	3
882	2384	2
1360	2386	2
1171	2386	5
411	2387	1
1099	2391	4
583	2391	4
1053	2392	3
1726	2392	6
358	2392	8
1159	2393	4
455	2393	4
1264	2394	1
655	2395	1
1751	2396	6
1533	2396	9
707	2396	5
1500	2397	1
1666	2398	1
1108	2402	3
1843	2402	4
1674	2403	1
1012	2404	3
1737	2404	4
852	2405	1
503	2407	5
450	2407	5
1216	2408	5
200	2408	5
1329	2409	7
1282	2409	4
1779	2409	7
1071	2410	5
252	2410	9
1183	2411	3
72	2412	1
1038	2413	1
1531	2414	1
1044	2415	4
1404	2416	8
1694	2416	6
69	2416	5
1087	2417	5
1214	2417	3
1671	2421	1
245	2422	5
702	2422	5
1481	2428	4
1074	2435	2
1435	2435	5
445	2436	1
720	2437	1
1219	2438	2
254	2438	4
1632	2439	1
1213	2440	1
1307	2441	1
1711	2442	1
1321	2443	1
9	2446	1
1080	2449	1
1333	2450	5
1771	2450	2
285	2456	1
1635	2457	4
1567	2457	5
1542	2460	1
189	2465	5
271	2465	4
1450	2469	7
1426	2469	3
1074	2470	3
676	2470	5
1178	2471	3
1465	2471	5
222	2475	3
330	2475	4
1704	2476	5
566	2476	3
1779	2477	4
1727	2477	3
927	2481	1
1096	2482	6
1451	2482	8
1686	2482	5
1568	2484	1
172	2485	1
924	2486	2
105	2486	4
341	2487	2
682	2487	2
1184	2488	4
1442	2488	5
1150	2490	1
1112	2494	3
139	2494	2
812	2495	7
1801	2495	2
45	2495	6
1758	2496	4
427	2496	5
1778	2497	6
1657	2497	9
728	2497	2
1821	2498	2
329	2498	5
1543	2499	1
1804	2504	1
785	2505	9
770	2505	3
1122	2505	8
1702	2506	5
1577	2506	3
1470	2507	1
153	2508	1
988	2511	1
776	2514	1
858	2516	5
1788	2516	6
632	2516	9
276	2519	1
1073	2520	4
1544	2520	2
876	2521	1
1418	2522	1
1072	2523	1
1617	2524	2
723	2524	3
1830	2525	1
676	2527	4
611	2527	9
661	2527	6
1303	2529	1
713	2530	2
512	2530	4
721	2533	1
1265	2534	5
1522	2534	3
1118	2535	1
1213	2536	2
1836	2536	3
1040	2537	2
869	2537	7
673	2537	6
1299	2538	1
1595	2545	1
866	2546	7
1136	2546	3
126	2546	9
1060	2547	1
1628	2548	2
198	2548	3
1021	2549	3
1698	2549	4
1395	2550	9
1727	2550	7
409	2550	3
982	2553	4
1655	2553	5
936	2554	4
289	2554	3
671	2555	1
1008	2559	1
1061	2562	4
1658	2562	5
1587	2563	3
204	2563	4
847	2565	1
1003	2566	1
1653	2568	1
1599	2569	1
1617	2572	1
1787	2576	4
11	2576	3
1656	2579	1
797	2580	3
1088	2580	4
1623	2583	1
1763	2584	2
608	2584	3
723	2591	5
380	2591	4
1772	2595	1
397	2600	1
1509	2602	5
511	2602	4
1750	2603	1
993	2604	1
1411	2607	4
1763	2608	3
220	2608	6
608	2608	8
1131	2609	7
1515	2609	7
227	2609	3
833	2611	1
1533	2616	5
1656	2616	3
1140	2617	1
1333	2622	2
1750	2622	3
1061	2624	5
1145	2624	5
1435	2627	4
1655	2627	2
919	2632	2
76	2632	3
1796	2635	2
644	2635	3
1525	2636	1
1311	2637	1
404	2638	1
1513	2639	7
1811	2639	4
1554	2640	1
227	2646	5
573	2646	5
785	2648	7
1825	2648	4
1411	2649	5
97	2649	4
1723	2650	1
504	2654	1
1762	2656	1
927	2657	2
1341	2657	3
665	2658	4
883	2660	4
1488	2660	4
1799	2662	2
237	2662	2
1336	2666	3
1788	2666	4
1332	2667	2
452	2667	4
824	2668	14
1239	2668	11
1596	2668	5
279	2668	12
344	2668	8
586	2668	13
759	2669	1
1812	2671	1
1721	2672	4
510	2672	5
805	2677	1
1028	2678	2
1781	2678	2
1423	2679	2
1601	2679	3
1731	2681	5
1780	2681	9
607	2681	7
539	2682	1
313	2683	1
1070	2685	7
955	2685	8
916	2685	4
1797	2687	1
1504	2694	3
729	2694	2
951	2695	1
914	2697	4
1454	2697	5
295	2700	3
527	2700	2
1384	2702	5
727	2702	3
1210	2703	1
837	2705	2
1112	2705	5
845	2708	1
1447	2709	1
1588	2710	1
412	2711	1
1805	2718	1
738	2719	1
1320	2720	1
1703	2722	1
844	2723	9
1215	2723	3
705	2723	6
1044	2724	2
1741	2724	2
1248	2728	1
1748	2730	1
1251	2731	5
1841	2731	3
1056	2732	4
1679	2732	3
183	2733	1
749	2736	3
1287	2736	3
475	2737	1
1302	2738	1
1263	2739	4
1599	2739	2
1265	2741	1
1475	2742	4
560	2742	4
1359	2746	5
1127	2746	3
1714	2748	3
299	2748	3
716	2749	1
1403	2750	5
1638	2750	3
1154	2751	1
1155	2753	2
1588	2753	2
1818	2756	1
1116	2764	9
1186	2764	4
1830	2764	6
1751	2766	3
1539	2766	4
756	2767	6
1317	2767	4
1694	2769	5
181	2769	2
230	2772	1
1164	2773	5
1130	2773	3
1219	2774	4
1638	2778	4
329	2778	3
1679	2780	1
1557	2786	9
1578	2786	5
257	2786	9
1301	2788	1
1760	2789	1
1677	2790	1
1446	2791	1
1695	2792	4
27	2792	7
455	2792	6
695	2794	1
1452	2796	1
282	2798	5
535	2798	4
681	2799	1
664	2800	1
1121	2801	7
1573	2801	7
417	2801	3
806	2805	5
1409	2811	4
1116	2811	2
1111	2812	5
249	2812	5
1576	2813	1
888	2814	1
1746	2815	1
1535	2816	3
516	2816	5
764	2817	4
1073	2817	5
1259	2818	5
546	2818	2
812	2820	3
1779	2820	2
1800	2821	1
892	2826	9
1547	2826	5
96	2826	8
1242	2827	1
378	2828	1
1397	2831	4
1223	2831	4
1262	2832	3
455	2832	3
945	2834	7
950	2834	2
1814	2834	6
889	2835	1
1621	2836	5
456	2836	4
790	2837	3
309	2837	4
750	2839	5
1704	2839	4
973	2841	3
115	2841	2
571	2843	1
1737	2844	5
559	2844	4
1182	2845	5
1411	2845	3
1164	2850	4
1658	2850	4
1241	2851	1
1808	2854	3
334	2854	8
210	2854	7
883	2855	2
1488	2855	2
840	2856	3
449	2856	2
1185	2858	1
1029	2862	5
1760	2862	4
1027	2864	3
1592	2864	6
1204	2865	5
673	2865	3
1227	2866	5
458	2866	4
426	2869	1
1287	2870	1
1186	2871	5
1830	2871	5
787	2872	6
1744	2872	14
299	2872	6
726	2872	14
579	2872	8
723	2872	15
729	2872	13
1055	2873	6
1392	2873	11
388	2873	11
553	2873	9
454	2873	10
640	2873	7
714	2873	13
1541	2874	11
1733	2874	10
251	2874	13
301	2874	8
412	2874	2
657	2874	13
1282	2875	7
1668	2875	12
1820	2875	14
239	2875	12
615	2875	8
466	2875	11
1123	2876	4
1392	2876	12
1449	2876	12
1584	2876	10
267	2876	8
985	2877	15
763	2877	12
1250	2877	2
1659	2877	14
610	2877	7
462	2877	10
808	2878	15
842	2878	12
793	2878	5
1106	2878	14
68	2878	14
661	2878	7
1627	2879	10
297	2879	11
677	2879	9
375	2879	9
569	2879	10
609	2879	14
534	2879	9
747	2880	9
989	2880	14
1254	2880	4
1727	2880	15
362	2880	13
13	2881	13
64	2881	9
17	2881	12
5	2881	8
1	2881	7
501	2881	11
761	2882	12
738	2882	14
962	2882	12
1051	2882	7
1220	2882	4
1248	2883	7
1321	2883	15
1238	2883	5
1662	2883	10
409	2883	15
1031	2884	12
851	2884	11
1553	2884	15
1642	2884	7
699	2884	6
503	2884	6
828	2885	11
1388	2885	12
1524	2885	10
1731	2885	3
617	2885	9
894	2886	4
770	2886	14
1325	2886	10
1604	2886	14
255	2886	6
998	2887	13
1497	2887	5
147	2887	12
275	2887	8
545	2887	10
782	2888	15
205	2888	10
178	2888	8
218	2888	15
351	2888	8
514	2888	9
838	2889	15
1233	2889	15
1360	2889	5
1363	2889	9
1728	2889	12
933	2890	6
1221	2890	10
1607	2890	15
128	2890	7
630	2890	9
600	2890	15
1087	2891	8
1007	2891	7
1009	2891	7
342	2891	15
61	2891	10
437	2891	13
1005	2892	12
933	2892	5
1279	2892	11
1306	2892	7
333	2892	10
1473	2893	11
300	2893	15
240	2893	7
508	2893	10
590	2893	3
732	2894	11
1466	2894	12
1755	2894	12
28	2894	8
63	2894	4
1334	2895	7
1676	2895	12
144	2895	12
250	2895	6
220	2895	7
668	2895	14
1292	2896	6
1827	2896	5
1734	2896	12
240	2896	13
492	2896	12
894	2897	5
1055	2897	7
1263	2897	12
1795	2897	10
906	2898	10
1665	2898	5
266	2898	10
710	2898	7
998	2899	10
1117	2899	13
1654	2899	15
295	2899	8
629	2899	2
963	2900	4
1023	2900	9
1783	2900	12
1708	2900	12
149	2900	12
1637	2901	4
119	2901	10
38	2901	11
637	2901	12
559	2901	8
941	2902	5
992	2902	9
1228	2902	13
1676	2902	14
407	2902	15
1542	2903	4
1605	2903	13
362	2903	7
542	2903	13
1558	2904	7
1537	2904	12
1480	2904	8
238	2904	9
685	2904	10
1189	2905	5
121	2905	6
349	2905	13
410	2905	11
1006	2906	7
246	2906	12
489	2906	4
373	2906	13
753	2907	13
767	2907	6
1037	2907	8
1606	2907	6
268	2907	14
1469	2908	8
1794	2908	10
1822	2908	5
319	2908	11
1253	2909	9
1722	2909	13
301	2909	15
1045	2910	12
1006	2910	12
1415	2910	7
1124	2910	3
828	2911	5
1370	2911	12
1831	2911	6
162	2911	15
912	2912	13
1217	2912	3
178	2912	13
100	2912	8
927	2913	7
1341	2913	14
1228	2913	6
1755	2913	14
625	2913	6
272	2914	9
527	2914	14
656	2914	3
470	2914	15
887	2915	13
63	2915	6
103	2915	5
725	2915	15
1100	2916	4
1149	2916	12
1742	2916	12
278	2916	9
1642	2917	11
1576	2917	7
443	2917	5
666	2917	15
814	2918	12
1249	2918	7
1337	2918	10
1589	2918	9
1609	2918	6
741	2919	8
853	2919	11
181	2919	4
4	2919	10
886	2920	8
1412	2920	6
1122	2920	7
123	2920	11
688	2920	15
1022	2921	5
1070	2921	8
1148	2921	14
675	2921	12
909	2922	7
1494	2922	14
295	2922	14
495	2922	8
534	2922	8
1444	2923	5
1781	2923	13
56	2923	6
546	2923	10
750	2924	8
1811	2924	15
1672	2924	5
459	2924	11
1031	2925	5
279	2925	11
466	2925	10
1211	2926	7
1189	2926	15
1624	2926	7
195	2926	7
631	2926	14
903	2927	6
311	2927	5
369	2927	11
691	2927	12
1315	2928	12
20	2928	5
46	2928	8
650	2928	14
1440	2929	11
1537	2929	9
81	2929	10
381	2929	5
1011	2930	13
1383	2930	8
1665	2930	6
136	2930	10
651	2930	9
973	2931	10
1502	2931	9
321	2931	4
557	2931	10
1088	2932	14
1214	2932	15
219	2932	8
302	2932	4
813	2933	9
793	2933	12
1008	2933	7
1791	2933	14
650	2933	6
1464	2934	3
1122	2934	12
1337	2934	8
1824	2934	10
962	2935	11
1066	2935	7
50	2935	2
834	2936	3
371	2936	9
483	2936	12
620	2936	11
127	2937	14
11	2937	6
573	2937	14
528	2937	3
1362	2938	13
1225	2938	11
1393	2938	7
206	2938	4
1241	2939	10
1692	2939	6
23	2939	5
725	2939	14
1151	2940	7
1300	2940	4
645	2940	13
1368	2941	3
274	2941	12
70	2941	9
180	2941	11
1027	2942	14
1278	2942	7
1730	2942	7
162	2942	7
588	2942	15
760	2943	4
1644	2943	6
145	2943	13
156	2943	11
1553	2944	8
195	2944	5
136	2944	15
596	2944	12
1162	2945	11
154	2945	7
568	2945	6
621	2945	7
600	2945	11
809	2946	15
801	2946	12
1502	2946	7
822	2947	13
1034	2947	14
926	2947	7
451	2947	6
706	2947	8
1077	2948	15
1407	2948	12
1376	2948	8
610	2948	2
959	2949	7
1383	2949	15
266	2949	8
448	2949	9
446	2949	14
781	2950	4
818	2950	7
812	2950	11
476	2950	15
1026	2951	8
824	2951	6
1095	2951	12
1242	2951	9
1476	2951	14
1088	2952	7
1702	2952	8
239	2952	9
490	2952	11
554	2952	10
1428	2953	12
1489	2953	12
101	2953	8
10	2953	5
1270	2954	7
1837	2954	3
1701	2954	10
1353	2955	4
1757	2955	9
672	2955	13
397	2955	14
837	2956	7
1487	2956	5
141	2956	10
1081	2957	3
1631	2957	11
159	2957	7
1187	2958	13
1601	2958	6
728	2958	4
757	2959	6
1520	2959	12
1673	2959	3
866	2960	8
1507	2960	9
62	2960	15
389	2960	6
980	2961	8
1039	2961	14
1795	2961	7
931	2962	9
1279	2962	4
1798	2962	15
816	2963	12
1778	2963	5
612	2963	8
1674	2964	10
1677	2964	2
311	2964	6
1456	2965	14
560	2965	9
710	2965	4
1035	2966	8
1162	2966	3
1201	2966	13
884	2967	11
1473	2967	2
445	2967	8
1180	2968	15
210	2968	6
214	2968	2
1133	2969	15
1407	2969	5
1693	2969	8
1602	2970	3
203	2970	8
567	2970	12
1020	2971	4
245	2971	6
425	2971	11
1270	2972	5
26	2972	9
133	2972	15
1291	2973	8
1803	2973	8
324	2973	8
393	2973	13
769	2974	12
1071	2974	9
1274	2974	2
1093	2975	15
1102	2975	9
1774	2975	8
78	2975	9
1722	2976	10
730	2976	5
910	2977	12
794	2977	3
1742	2977	6
1084	2978	11
1279	2978	5
1663	2978	6
809	2979	10
1170	2979	8
1227	2979	3
871	2980	6
947	2980	11
1743	2980	2
1204	2981	4
33	2981	6
53	2981	13
1676	2982	11
1659	2982	6
581	2982	5
1023	2983	5
1165	2983	6
1109	2983	11
1373	2984	6
1485	2984	14
348	2984	3
1196	2985	7
1669	2985	6
205	2985	6
375	2985	15
1310	2986	9
1755	2986	6
521	2986	10
377	2986	8
927	2987	5
1341	2987	12
1399	2987	7
1010	2988	5
1039	2988	7
301	2988	10
909	2989	6
499	2989	10
959	2990	6
196	2990	9
295	2990	11
758	2991	12
1025	2991	6
1690	2991	9
187	2991	7
1158	2992	8
1516	2992	4
444	2992	14
882	2993	15
1833	2993	4
1778	2993	7
1327	2994	4
38	2994	10
497	2994	6
926	2995	11
1341	2995	6
247	2995	9
598	2995	6
1347	2996	8
1834	2996	4
574	2996	10
1287	2997	7
259	2997	5
314	2997	13
889	2998	12
754	2998	6
1181	2998	5
1655	2999	3
1714	2999	14
105	2999	8
831	3000	13
1043	3000	4
1244	3000	9
918	3001	12
1203	3001	6
175	3001	3
1625	3002	5
1635	3002	9
401	3002	12
1540	3003	11
33	3003	4
193	3003	9
1578	3004	2
345	3004	12
208	3004	7
945	3005	10
1379	3005	4
1799	3005	6
1232	3006	8
146	3006	14
57	3006	6
116	3006	8
822	3007	10
1449	3007	4
627	3007	7
860	3008	14
1192	3008	6
417	3008	4
949	3009	5
1022	3009	14
1148	3009	8
998	3010	5
549	3010	6
598	3010	10
1638	3011	15
1640	3011	2
525	3011	9
1371	3012	5
137	3012	15
432	3012	9
844	3013	6
1259	3013	15
640	3013	5
1015	3014	9
1712	3014	6
210	3014	14
433	3014	8
851	3015	7
1190	3015	7
1707	3015	10
242	3015	8
1060	3016	2
1605	3016	7
542	3016	12
1611	3017	10
22	3017	6
62	3017	8
382	3017	9
909	3018	3
998	3018	6
3	3018	15
967	3019	11
1113	3019	8
1837	3019	7
106	3019	7
941	3020	9
1628	3020	6
161	3020	7
382	3020	14
928	3021	3
1778	3021	13
1728	3021	7
918	3022	6
732	3022	34
183	3022	5
711	3022	11
1104	3023	5
1661	3023	14
120	3023	9
855	3024	10
272	3024	8
656	3024	4
1456	3025	7
1549	3025	13
138	3025	7
585	3025	8
1276	3026	9
327	3026	10
423	3026	5
930	3027	10
1502	3027	6
1598	3027	6
538	3027	9
894	3028	8
828	3028	9
140	3028	13
494	3028	6
1372	3029	4
384	3029	8
418	3029	12
1534	3030	2
113	3030	8
503	3030	10
937	3031	5
155	3031	8
483	3031	10
1571	3032	7
1033	3033	9
1172	3033	10
1502	3033	4
1133	3034	7
259	3034	13
487	3034	6
1788	3035	8
517	3035	5
593	3035	15
104	3036	12
670	3036	9
622	3036	2
1561	3037	2
138	3037	14
285	3037	9
1843	3038	2
1611	3038	11
122	3038	6
1248	3039	6
478	3039	10
715	3039	4
1142	3040	5
380	3040	7
444	3040	11
877	3041	8
1077	3041	8
1547	3041	9
705	3041	12
935	3042	12
1021	3042	4
1332	3042	8
1205	3043	7
137	3043	10
419	3043	2
1543	3044	3
79	3044	12
647	3044	7
849	3045	3
243	3045	6
42	3045	10
976	3046	4
1328	3046	16
398	3046	8
1344	3047	14
1249	3047	8
1589	3047	5
293	3048	5
169	3048	8
375	3048	11
349	3049	8
402	3049	12
438	3049	7
410	3049	9
1277	3050	3
1775	3050	14
1844	3050	6
862	3051	4
1576	3051	9
428	3051	14
358	3052	4
556	3052	6
386	3052	12
925	3053	8
1093	3053	7
771	3053	13
1390	3053	7
822	3054	11
1449	3054	5
1188	3054	9
1065	3055	15
578	3055	6
421	3055	5
243	3056	9
581	3056	4
710	3056	11
1356	3057	6
1525	3057	3
489	3057	12
891	3058	9
1342	3058	11
1798	3058	5
1319	3059	7
1489	3059	3
8	3059	15
1693	3060	6
318	3060	7
581	3060	15
680	3060	9
1124	3061	2
1456	3061	11
1573	3061	9
481	3062	7
546	3062	4
514	3062	10
944	3063	8
959	3063	8
1056	3063	6
1507	3063	14
101	3064	13
424	3064	8
628	3064	2
1734	3065	5
167	3065	6
162	3065	10
1300	3066	12
1681	3066	3
25	3066	9
1737	3067	3
1612	3067	9
286	3067	10
1037	3068	9
964	3068	14
1606	3068	7
1534	3068	8
1436	3069	9
216	3069	4
718	3069	13
32	3070	12
278	3070	4
304	3070	7
148	3071	11
177	3071	4
546	3071	7
136	3072	8
385	3072	12
492	3072	2
1184	3073	3
1761	3073	15
206	3073	9
1798	3074	7
143	3074	5
132	3074	11
1279	3075	10
1791	3075	6
717	3075	3
1827	3076	8
325	3076	4
634	3076	10
933	3077	2
884	3077	7
1204	3077	15
1624	3078	8
1711	3078	5
195	3078	15
1051	3079	6
1750	3079	6
251	3079	6
89	3079	13
1706	3080	15
112	3080	5
482	3080	7
1757	3081	11
548	3081	7
366	3081	2
1686	3082	4
212	3082	9
1068	3083	5
317	3083	8
1261	3084	3
1329	3084	6
1342	3085	8
1728	3085	5
1475	3086	8
187	3086	9
452	3086	8
984	3087	7
102	3087	7
75	3087	8
1837	3088	4
309	3088	9
1703	3089	4
384	3089	7
1332	3090	3
229	3090	9
1393	3091	3
1561	3091	6
1090	3092	3
1781	3092	8
817	3093	9
1498	3093	7
193	3094	5
422	3094	9
1074	3095	7
1226	3095	4
1144	3096	6
1712	3096	2
732	3097	2
57	3097	14
183	3097	12
506	3097	11
463	3097	12
989	3098	6
1646	3098	3
989	3099	7
1396	3099	3
1395	3100	4
125	3100	6
924	3101	5
1398	3101	6
1698	3102	5
238	3102	7
945	3103	8
306	3103	2
855	3104	8
335	3104	3
1673	3105	5
439	3105	7
164	3106	5
89	3106	7
473	3107	6
504	3107	3
454	3108	9
676	3108	2
980	3109	5
1464	3109	7
1241	3110	7
211	3110	5
1705	3111	6
27	3111	3
341	3112	7
682	3112	5
1389	3113	5
1617	3113	8
1493	3114	2
702	3114	7
1032	3115	9
167	3115	9
17	3115	8
809	3116	9
240	3116	4
931	3117	3
698	3117	6
1309	3118	3
1154	3118	9
57	3119	4
116	3119	6
958	3120	7
1246	3120	5
1803	3121	6
378	3121	4
1353	3122	8
682	3122	4
1168	3123	3
689	3123	6
778	3124	4
72	3124	8
1118	3125	7
309	3125	3
896	3126	9
518	3126	2
1729	3127	5
683	3127	9
1451	3128	9
526	3128	5
991	3129	4
1758	3129	8
1583	3130	6
418	3130	2
1160	3131	4
314	3131	6
1193	3132	3
474	3132	6
1672	3133	4
649	3133	8
1357	3134	9
1512	3134	4
1228	3135	4
585	3135	7
1184	3136	7
169	3136	4
715	3137	8
589	3137	2
1189	3138	8
376	3138	5
1074	3139	5
1189	3139	6
1029	3140	4
1189	3140	9
982	3141	9
966	3141	7
1369	3141	24
1768	3141	7
1462	3142	3
988	3143	6
66	3143	2
1136	3144	9
158	3144	4
941	3145	8
1031	3145	2
1793	3146	5
310	3146	7
859	3147	5
1201	3147	9
350	3148	2
459	3148	9
1188	3149	5
10	3149	9
746	3150	9
765	3150	4
801	3151	14
1419	3151	11
1589	3151	12
1504	3151	10
1609	3151	14
1692	3151	4
1385	3152	9
269	3152	4
1478	3153	4
541	3153	7
68	3154	6
252	3154	6
280	3154	6
337	3155	8
578	3155	4
1673	3156	6
99	3156	5
1181	3157	4
1467	3157	8
1714	3158	9
690	3158	5
1818	3159	3
1082	3160	3
950	3161	4
455	3161	7
841	3162	5
115	3162	7
1493	3163	8
713	3163	5
1296	3164	4
170	3164	7
340	3165	7
299	3165	5
1384	3166	7
1511	3166	8
179	3166	8
1017	3167	5
256	3167	8
1547	3168	6
81	3168	5
1047	3169	8
1625	3169	4
1264	3170	3
1489	3170	8
1422	3171	6
360	3171	3
937	3172	4
443	3172	8
1208	3173	9
154	3173	4
1133	3174	4
636	3174	9
1714	3175	2
211	3175	9
1472	3176	6
718	3176	4
765	3177	6
1189	3177	3
13	3178	6
1	3178	8
5	3178	7
276	3179	6
711	3179	5
1386	3180	6
1472	3180	7
718	3180	9
1696	3181	4
551	3181	6
1289	3182	8
1775	3182	3
1570	3183	3
1753	3183	7
1460	3184	9
661	3184	5
1714	3185	6
1532	3186	5
138	3186	8
1727	3187	4
1542	3187	9
1689	3188	6
200	3188	2
1119	3189	5
352	3189	7
765	3190	8
87	3190	5
1207	3191	5
109	3191	6
803	3192	9
1623	3192	5
1625	3193	8
1804	3193	5
1541	3194	6
665	3194	2
864	3195	4
896	3195	6
792	3196	6
1171	3196	6
622	3196	6
839	3197	8
1239	3197	13
1160	3197	11
492	3197	7
536	3197	14
427	3197	14
878	3198	6
1350	3198	2
336	3199	6
354	3199	3
919	3200	5
1272	3200	8
807	3201	9
1268	3202	7
385	3202	4
760	3203	8
1236	3203	3
834	3204	4
1291	3204	7
1369	3205	9
326	3205	5
852	3206	6
1553	3206	6
157	3206	8
1081	3207	7
1818	3207	5
1806	3208	7
152	3208	5
1023	3209	4
1698	3209	7
813	3210	6
258	3210	9
521	3210	7
1648	3211	6
1627	3211	5
821	3212	4
887	3212	6
1699	3213	6
105	3213	5
101	3214	9
387	3214	4
1237	3215	7
49	3215	8
422	3215	7
1179	3216	7
1498	3216	9
1696	3216	7
977	3217	7
1539	3217	3
1519	3218	3
277	3219	4
101	3219	6
1335	3220	7
210	3220	4
972	3221	5
1835	3221	6
1161	3222	8
1476	3222	5
553	3223	4
367	3223	8
4	3224	5
118	3224	7
1600	3225	8
508	3225	3
1841	3226	8
666	3226	3
1730	3227	3
99	3227	7
1435	3228	6
222	3228	4
1610	3229	7
1512	3229	2
855	3230	3
164	3230	7
906	3231	2
352	3231	9
1689	3232	8
256	3232	5
646	3233	7
464	3233	4
1	3234	4
633	3234	6
1758	3235	3
427	3235	6
967	3236	9
1781	3236	4
1529	3237	4
39	3237	7
153	3238	7
1707	3239	3
371	3239	6
900	3240	13
1324	3240	9
1289	3240	13
1686	3240	15
1627	3240	13
1718	3240	11
122	3240	8
1418	3241	2
1571	3241	6
841	3242	8
436	3242	4
1190	3243	6
161	3243	9
636	3243	8
299	3244	4
41	3244	6
1025	3245	9
611	3245	5
17	3246	4
1248	3247	2
522	3247	7
813	3248	7
1574	3248	3
883	3249	9
1586	3249	5
1081	3250	5
1707	3250	6
956	3251	2
1285	3251	6
37	3252	6
726	3252	5
32	3253	8
702	3253	4
1059	3254	3
112	3254	9
1139	3255	3
1511	3255	6
743	3256	9
953	3256	8
1400	3256	8
1560	3257	4
525	3257	7
479	3258	6
681	3258	5
979	3259	8
1091	3259	5
799	3260	2
455	3260	8
1447	3261	4
11	3261	9
280	3262	7
252	3262	7
68	3262	7
916	3263	6
986	3263	9
1011	3263	8
869	3264	8
1100	3264	8
78	3264	6
1197	3265	7
1681	3265	5
835	3266	5
1780	3266	7
1315	3267	7
1538	3267	4
121	3268	5
416	3268	7
1470	3269	3
611	3269	8
766	3270	6
725	3270	2
770	3271	6
1506	3271	8
722	3271	8
1825	3272	5
614	3272	7
211	3273	8
504	3273	4
260	3274	9
103	3274	8
723	3274	7
925	3275	6
521	3275	5
1046	3276	5
170	3276	6
1358	3277	8
1333	3277	4
1521	3278	8
631	3278	5
773	3279	2
624	3279	6
1103	3280	3
1818	3280	7
283	3281	6
564	3281	3
1496	3282	3
1542	3282	6
1109	3283	8
608	3283	2
1069	3284	6
1641	3284	4
1036	3285	2
83	3285	7
1146	3286	3
1842	3286	8
1468	3287	2
853	3288	6
1720	3288	7
440	3288	8
970	3289	7
1534	3289	3
156	3290	5
145	3290	7
1008	3291	6
1320	3291	5
1362	3292	5
390	3293	7
416	3293	4
751	3294	8
1355	3294	9
1629	3294	7
1796	3295	3
731	3295	7
1521	3296	9
631	3296	8
1213	3297	5
1361	3297	9
970	3298	6
1294	3298	6
69	3298	6
1061	3299	7
1338	3299	4
1430	3300	2
219	3300	6
1700	3301	9
63	3301	5
1347	3302	4
1670	3302	8
293	3303	7
37	3303	8
537	3303	7
1424	3304	6
1817	3304	5
967	3305	8
1424	3305	8
197	3305	9
941	3306	3
1609	3307	5
41	3307	8
1175	3308	7
346	3308	4
1408	3309	3
558	3309	9
1505	3310	7
329	3310	4
979	3311	5
1769	3311	6
1738	3312	4
515	3312	7
907	3313	3
1700	3313	7
1142	3314	2
1323	3314	9
855	3315	4
564	3315	7
559	3316	5
472	3316	9
1634	3317	8
314	3317	4
782	3318	7
1710	3318	3
1586	3319	6
1275	3320	2
1138	3320	8
1633	3321	5
316	3321	6
360	3322	4
474	3322	8
1443	3323	6
1554	3323	3
1314	3324	7
1654	3324	3
845	3325	6
1784	3325	4
902	3326	6
222	3326	2
949	3327	9
955	3327	7
1070	3327	6
1260	3328	4
1587	3328	7
822	3329	5
30	3329	6
1153	3330	8
515	3330	3
1777	3331	3
1594	3331	9
1394	3332	7
1491	3332	5
750	3333	6
275	3333	4
1505	3334	5
1777	3334	9
1050	3335	6
1734	3335	3
1490	3336	7
519	3336	5
754	3337	5
1154	3337	8
1005	3338	4
1135	3338	9
1569	3339	2
712	3339	7
1204	3340	7
1361	3340	3
172	3341	8
494	3341	5
128	3342	4
680	3342	6
1013	3343	3
1314	3343	8
1765	3344	4
61	3344	7
646	3345	4
555	3345	7
1271	3346	8
1712	3346	4
222	3347	8
326	3347	4
940	3348	9
1664	3348	7
389	3348	7
1043	3349	3
1024	3349	7
1617	3350	4
197	3350	7
1317	3351	5
507	3351	9
1829	3352	5
328	3352	7
1263	3353	9
1633	3353	9
379	3353	6
806	3354	9
158	3354	3
836	3355	5
204	3355	7
1056	3356	2
1340	3356	8
1806	3357	4
172	3357	9
1740	3358	3
1565	3358	8
1365	3359	9
363	3359	5
1098	3360	9
933	3361	9
1281	3361	6
430	3361	9
1545	3362	3
3	3362	7
156	3363	9
378	3363	3
744	3364	4
1585	3364	8
1206	3365	7
1722	3365	8
353	3365	6
966	3366	8
555	3366	5
788	3367	7
1557	3367	6
353	3367	9
952	3368	9
1581	3369	8
1576	3369	3
207	3370	9
584	3370	5
1506	3371	9
167	3371	2
39	3372	8
499	3372	4
769	3373	7
289	3373	8
533	3373	8
1113	3374	5
676	3374	7
1544	3375	3
621	3375	6
1289	3376	7
534	3376	4
1819	3377	9
143	3377	2
1585	3378	3
188	3378	9
14	3379	9
63	3379	7
518	3379	7
1122	3380	6
1171	3380	3
835	3381	3
89	3381	9
816	3382	11
1672	3382	8
1676	3382	13
1657	3382	8
210	3382	11
90	3382	14
909	3383	5
1153	3383	13
1216	3383	10
1844	3383	14
127	3383	15
824	3384	5
1242	3384	10
1495	3384	10
1588	3384	14
1529	3384	10
821	3385	8
1506	3385	10
1736	3385	15
278	3385	7
622	3385	10
737	3386	12
949	3386	14
1148	3386	12
85	3386	9
514	3386	8
675	3386	14
1095	3387	10
937	3387	6
1188	3387	12
1584	3387	12
1600	3387	9
684	3387	12
1385	3388	8
1510	3388	9
127	3388	13
631	3388	15
530	3388	12
858	3389	7
1754	3389	13
144	3389	14
118	3389	8
172	3389	13
952	3390	14
778	3390	8
1379	3390	13
27	3390	12
644	3390	6
865	3391	11
752	3391	10
1354	3391	8
1337	3391	15
1774	3391	7
1083	3392	7
944	3392	14
1397	3392	7
1796	3392	10
557	3392	12
864	3393	12
1242	3393	4
1527	3393	12
1762	3393	13
956	3394	14
1576	3394	10
191	3394	15
443	3394	2
1235	3395	10
1258	3395	11
278	3395	16
462	3395	5
1054	3396	12
866	3396	6
345	3396	11
329	3396	6
272	3396	10
1795	3397	13
12	3397	15
486	3397	12
694	3397	5
1088	3398	13
1310	3398	11
135	3398	9
179	3398	11
372	3398	9
869	3399	13
909	3399	14
1005	3399	5
1773	3399	10
1239	3400	9
152	3400	11
344	3400	10
590	3400	15
520	3400	8
1012	3401	15
1100	3401	10
1146	3401	7
1551	3401	14
562	3401	7
1270	3402	11
1778	3402	4
1773	3402	14
410	3402	15
926	3403	8
891	3403	12
1214	3403	13
1471	3403	10
1469	3403	11
315	3403	13
186	3403	14
527	3403	11
1153	3404	10
1495	3404	13
1516	3404	14
351	3404	2
1674	3405	11
245	3405	9
112	3405	10
627	3405	10
1251	3406	12
1537	3406	3
1644	3406	13
52	3406	10
1626	3407	10
1815	3407	5
279	3407	13
678	3407	11
1694	3408	8
1554	3408	9
191	3408	11
494	3408	14
405	3408	12
965	3409	6
1414	3409	15
616	3409	11
441	3409	12
727	3409	8
782	3410	9
1171	3410	15
1678	3410	9
350	3410	12
1689	3411	11
1511	3411	5
51	3411	10
85	3411	15
812	3412	9
1810	3412	13
362	3412	10
626	3412	11
583	3412	7
1285	3413	11
1449	3413	13
1770	3413	10
684	3413	7
700	3413	6
1065	3414	14
1163	3414	15
1594	3414	7
201	3414	8
96	3414	13
742	3415	11
1547	3415	10
55	3415	4
603	3415	10
740	3416	11
1354	3416	7
1486	3416	8
895	3417	4
707	3417	14
984	3418	6
1463	3418	10
157	3418	6
621	3418	15
28	3419	5
332	3419	15
654	3419	15
908	3420	10
1785	3420	14
1798	3420	9
1546	3420	7
788	3421	11
1416	3421	3
274	3421	15
1187	3422	11
1127	3422	6
21	3422	9
389	3422	15
748	3423	12
780	3423	4
1156	3423	12
1423	3424	11
1778	3424	12
83	3424	13
328	3424	14
192	3424	13
26	3424	11
148	3424	6
567	3424	13
1035	3425	10
156	3425	2
9	3425	14
1060	3426	14
1165	3426	10
1211	3426	5
800	3427	8
185	3427	6
534	3427	10
628	3427	15
1651	3428	5
293	3428	15
32	3428	14
1069	3429	12
1641	3429	5
593	3429	14
1045	3430	10
413	3430	3
411	3430	13
817	3431	5
171	3431	14
207	3432	7
300	3432	9
612	3432	11
532	3432	12
808	3433	14
955	3433	14
1760	3433	2
1024	3434	12
1379	3434	5
141	3434	11
153	3435	12
111	3435	3
1040	3436	7
763	3436	15
240	3436	8
449	3436	11
1432	3437	10
1292	3437	7
1374	3437	8
722	3437	15
1610	3438	11
1512	3438	10
288	3438	2
1004	3439	14
1178	3439	4
406	3439	15
128	3440	8
430	3440	14
525	3440	6
618	3440	12
1423	3441	4
373	3441	15
755	3442	10
858	3442	10
1203	3442	8
1718	3442	9
1041	3443	8
1183	3443	8
1465	3443	13
1539	3443	14
1274	3444	12
1707	3444	14
60	3444	5
234	3445	3
268	3445	12
1629	3446	3
638	3446	10
688	3446	11
1363	3447	13
1646	3447	4
205	3447	14
1655	3448	11
1533	3448	14
1037	3449	7
1137	3449	8
3	3449	13
319	3449	15
990	3450	14
1195	3450	2
1544	3450	13
964	3451	6
1383	3451	11
287	3451	15
269	3452	11
339	3452	5
408	3452	13
1005	3453	15
1057	3453	5
1459	3453	13
909	3454	10
869	3454	9
1117	3454	7
325	3454	13
338	3455	10
628	3455	10
1228	3456	8
1198	3456	9
19	3456	14
107	3456	10
293	3457	12
230	3457	15
317	3457	9
484	3457	7
1163	3458	12
1529	3458	14
577	3458	4
790	3459	9
1063	3459	14
1441	3459	8
1250	3459	15
1352	3460	9
1770	3460	14
330	3460	13
609	3460	9
1013	3461	4
1640	3461	15
462	3461	11
1648	3462	11
719	3462	10
1010	3463	3
545	3463	15
939	3464	14
1636	3464	6
60	3464	10
712	3464	9
1636	3465	9
53	3465	15
320	3465	10
58	3465	14
630	3465	13
564	3465	10
449	3465	13
387	3465	10
947	3466	13
1083	3466	8
1419	3466	7
1490	3466	14
1708	3467	11
637	3467	4
458	3467	11
870	3468	13
182	3468	12
412	3468	5
763	3469	5
298	3469	13
319	3469	12
747	3470	3
801	3470	11
193	3470	10
868	3471	9
1036	3471	10
1028	3471	9
126	3471	11
1551	3472	13
220	3472	10
142	3472	5
1377	3473	7
1523	3473	12
188	3473	15
730	3473	7
746	3474	8
259	3474	10
339	3474	9
599	3474	10
808	3475	12
1096	3475	14
842	3475	6
661	3475	8
1549	3476	4
653	3476	12
489	3476	11
1664	3477	5
1505	3477	15
645	3477	10
865	3478	10
815	3478	6
748	3478	10
1315	3478	6
1385	3479	12
75	3479	10
703	3479	3
1740	3480	10
89	3480	12
574	3480	5
1810	3481	15
192	3481	9
526	3481	7
483	3481	13
1066	3482	5
1150	3482	15
110	3482	14
902	3483	7
975	3483	13
1016	3483	13
1118	3483	15
1122	3483	11
226	3483	10
265	3483	11
198	3483	12
1426	3484	7
1748	3484	12
1825	3484	7
285	3484	13
1253	3485	7
1114	3485	14
1532	3485	9
255	3485	14
732	3486	4
1158	3486	11
1711	3486	11
1628	3487	9
1669	3487	11
198	3487	9
263	3487	10
1024	3488	4
1639	3488	10
1612	3488	15
1032	3489	15
1771	3489	10
1342	3490	6
1621	3490	14
1734	3490	11
1334	3491	8
1704	3491	15
1612	3491	11
255	3491	7
1243	3492	12
308	3492	8
395	3492	10
913	3493	8
1364	3493	6
1547	3493	11
101	3493	14
771	3494	6
1123	3494	8
590	3494	13
421	3494	13
280	3495	15
712	3495	10
432	3495	5
904	3496	9
106	3496	11
26	3496	10
382	3496	8
1294	3497	10
1509	3497	9
84	3497	9
60	3497	11
968	3498	15
1333	3498	3
32	3498	13
1131	3499	15
255	3499	11
1061	3500	6
863	3500	15
1692	3500	15
23	3500	7
1440	3501	13
1650	3501	5
161	3501	11
1261	3502	13
490	3502	5
441	3502	14
751	3503	4
549	3503	13
946	3504	14
1845	3504	4
543	3504	14
1766	3505	13
1731	3505	4
1794	3505	14
1057	3506	11
1416	3506	10
1305	3506	5
36	3507	2
567	3507	11
1011	3508	7
1627	3508	15
443	3508	9
1223	3509	15
1656	3509	2
1424	3510	3
1382	3510	13
1533	3511	3
94	3511	12
1437	3512	14
595	3512	2
1073	3513	7
856	3513	13
1825	3513	8
1273	3514	5
1768	3514	11
737	3515	6
85	3515	11
533	3515	6
1071	3516	11
1005	3516	8
1281	3516	7
269	3517	10
709	3517	5
1630	3518	3
181	3518	10
1419	3519	10
728	3519	5
1024	3520	14
513	3520	5
1356	3521	13
284	3521	8
529	3521	9
79	3522	10
627	3522	3
1774	3523	10
162	3523	5
935	3524	4
1548	3524	12
1201	3525	11
425	3525	4
181	3526	5
268	3526	10
27	3527	14
672	3527	4
798	3528	5
102	3528	10
1186	3529	10
1830	3529	3
1773	3530	2
116	3530	13
1177	3531	10
276	3531	5
1382	3532	4
585	3532	13
1729	3533	2
74	3533	12
1343	3534	11
697	3534	3
1502	3535	13
605	3535	5
1438	3536	14
1789	3536	3
1212	3537	16
290	3537	2
1479	3538	10
1844	3538	5
919	3539	9
1180	3539	9
657	3539	10
1462	3540	11
1781	3540	3
1472	3541	10
292	3541	5
1786	3542	6
233	3542	7
146	3542	13
745	3543	15
839	3543	4
1043	3544	13
1810	3544	5
1006	3545	15
1588	3545	5
1282	3546	6
1659	3546	12
586	3546	9
1148	3547	15
1591	3547	5
1313	3548	11
126	3548	3
1758	3549	5
427	3549	11
1172	3550	4
1600	3550	12
437	3551	10
1173	3552	13
237	3552	4
1081	3553	8
1109	3553	15
1818	3553	8
1328	3554	2
1673	3554	11
31	3555	8
422	3555	8
662	3555	10
1171	3556	4
246	3556	13
1769	3557	13
1595	3557	4
279	3558	14
699	3558	5
1054	3559	6
1642	3559	10
1829	3559	7
1061	3560	15
1564	3560	5
1799	3561	11
518	3561	4
1039	3562	15
498	3562	3
1351	3563	5
497	3563	10
896	3564	10
483	3564	3
1149	3565	6
118	3565	10
391	3565	8
990	3566	4
328	3566	10
998	3567	7
1780	3567	8
649	3567	12
209	3568	12
367	3568	4
1397	3569	13
166	3569	5
1028	3570	14
357	3570	4
60	3571	4
1490	3572	4
1648	3572	14
884	3573	15
1575	3573	4
986	3574	3
1684	3574	11
340	3575	4
288	3575	11
283	3576	14
103	3576	3
494	3577	13
1300	3578	13
1539	3578	7
213	3578	8
1290	3579	4
642	3579	13
890	3580	11
1635	3580	5
1250	3581	14
1441	3581	2
764	3582	2
1665	3582	11
1462	3583	5
666	3583	11
1436	3584	11
420	3584	5
1351	3585	8
1596	3585	15
75	3585	9
1533	3586	4
1790	3586	14
1410	3587	10
544	3587	5
1486	3588	12
444	3588	4
1571	3589	5
901	3590	12
100	3590	5
1051	3591	9
1361	3591	7
1626	3591	14
974	3592	10
241	3592	6
660	3592	8
1706	3593	14
1307	3594	4
51	3594	14
1238	3595	3
1542	3595	12
1445	3596	5
78	3596	12
1515	3597	14
602	3597	4
822	3598	12
1731	3598	8
282	3598	8
845	3599	9
840	3599	12
1811	3599	7
1027	3600	15
466	3600	3
846	3601	10
1526	3601	5
787	3602	7
726	3602	13
613	3602	7
1275	3603	15
1627	3603	6
728	3603	6
1014	3604	4
1436	3604	12
1275	3605	9
183	3605	13
732	3605	7
1478	3606	5
1593	3606	11
1397	3607	8
1659	3607	11
454	3607	6
1815	3608	6
47	3608	8
262	3608	12
1581	3609	5
148	3609	15
1598	3610	11
239	3610	8
554	3610	6
994	3611	5
1598	3611	14
183	3612	10
401	3612	2
938	3613	8
754	3613	12
480	3613	6
1254	3614	3
246	3614	15
1018	3615	10
675	3615	5
37	3616	4
723	3616	10
1078	3617	14
1105	3617	2
1184	3618	10
426	3618	2
958	3619	11
40	3619	6
522	3619	8
757	3620	9
1447	3620	8
1814	3620	13
1810	3621	9
606	3621	6
529	3621	12
1079	3622	14
67	3622	5
1551	3623	12
1523	3623	8
265	3623	9
1844	3624	15
368	3624	7
1378	3625	12
1358	3625	4
325	3626	8
491	3626	7
808	3627	5
173	3627	12
845	3628	12
1254	3628	2
1732	3629	5
636	3629	13
1266	3630	5
1404	3630	12
854	3631	3
463	3631	15
997	3632	10
1118	3632	3
803	3633	4
563	3633	15
839	3634	5
107	3634	15
1219	3635	3
282	3635	11
767	3636	3
1606	3636	14
1463	3637	8
1290	3637	6
2	3637	10
854	3638	9
1810	3638	6
291	3638	11
1253	3639	3
1804	3639	14
310	3640	14
109	3640	4
1025	3641	5
500	3641	12
858	3642	9
1023	3642	10
360	3642	8
1278	3643	11
136	3643	9
527	3643	9
139	3644	13
585	3644	5
1460	3645	3
1488	3645	11
1385	3646	4
15	3646	15
1286	3647	12
381	3647	4
1514	3648	4
1730	3648	10
762	3649	7
1575	3649	11
261	3649	7
1025	3650	11
1755	3650	2
618	3651	11
537	3651	4
1722	3652	4
1370	3653	10
1654	3653	5
385	3654	13
663	3654	5
1145	3655	13
1568	3655	4
310	3656	11
431	3656	3
800	3657	14
1243	3657	7
202	3657	6
915	3658	12
1346	3658	5
1073	3659	14
48	3659	5
529	3660	4
997	3661	12
817	3661	2
793	3662	11
314	3662	3
29	3663	15
391	3663	6
688	3663	6
589	3664	5
715	3664	13
779	3665	12
1561	3665	4
1365	3666	15
1692	3666	5
945	3667	3
213	3668	3
289	3668	11
1036	3669	12
1614	3669	5
967	3670	12
1019	3670	7
1119	3670	9
1349	3671	11
457	3671	2
1349	3672	8
281	3672	8
564	3672	13
1697	3673	5
320	3673	11
1547	3674	14
1546	3674	5
1255	3675	2
363	3675	11
593	3676	12
921	3677	5
225	3677	14
1028	3678	6
1839	3678	10
487	3678	9
788	3679	3
1114	3679	12
894	3680	7
999	3680	9
591	3680	11
1247	3681	3
1807	3681	14
907	3682	10
1656	3682	4
1307	3683	3
562	3683	11
774	3684	3
1196	3684	10
1053	3685	10
928	3685	7
1523	3685	9
1063	3686	7
1441	3686	9
1250	3686	11
1256	3687	6
1188	3687	13
47	3687	6
164	3688	13
341	3688	5
1054	3689	7
1781	3689	12
606	3689	7
238	3690	4
467	3690	15
269	3691	12
724	3691	4
505	3692	5
1214	3693	9
1765	3693	9
360	3693	12
1309	3694	6
1691	3694	8
397	3694	11
943	3695	15
1007	3695	4
1742	3696	10
405	3696	4
1678	3697	3
10	3697	10
1150	3698	14
987	3699	12
1367	3699	5
1700	3700	10
1442	3701	7
1457	3701	8
488	3701	14
1012	3702	4
1007	3702	11
934	3703	13
1818	3703	4
1380	3704	5
696	3704	13
1379	3705	8
70	3705	8
661	3705	14
381	3706	14
539	3706	3
13	3707	11
1	3707	9
5	3707	6
940	3708	15
1703	3708	5
203	3709	3
691	3709	15
835	3710	4
262	3710	11
947	3711	9
963	3711	8
1388	3711	11
733	3712	5
454	3713	14
248	3714	15
596	3714	3
1137	3715	11
1243	3715	9
129	3715	9
798	3716	7
1739	3716	7
1673	3716	10
829	3717	2
332	3717	10
1479	3718	15
1687	3718	4
841	3719	2
1155	3719	10
1558	3720	5
467	3720	11
790	3721	11
1309	3721	2
112	3722	11
1207	3723	9
1555	3723	8
1519	3723	12
836	3724	2
1733	3724	13
1037	3725	14
1773	3725	3
740	3726	8
871	3726	7
684	3726	11
1393	3727	10
103	3727	7
262	3727	7
493	3728	8
714	3728	10
388	3728	8
758	3729	8
224	3729	14
389	3729	9
1833	3730	3
1765	3730	14
849	3731	10
514	3731	5
1490	3732	6
547	3732	10
495	3732	7
1004	3733	9
1788	3733	11
23	3733	8
1437	3734	9
1489	3734	7
1584	3734	11
98	3735	11
485	3735	2
909	3736	11
1626	3736	2
1099	3737	7
1412	3737	15
123	3737	9
105	3738	14
583	3738	3
1257	3739	7
32	3739	9
169	3739	11
907	3740	9
584	3740	11
704	3740	9
201	3741	10
598	3741	4
450	3742	2
931	3743	5
1769	3743	10
1404	3744	10
257	3744	4
1569	3745	11
1562	3745	3
1325	3746	12
1431	3746	9
619	3746	8
1709	3747	2
413	3747	11
250	3748	5
308	3748	11
781	3749	5
120	3749	12
18	3750	5
169	3750	13
873	3751	12
1461	3751	2
1776	3752	5
252	3752	12
293	3753	4
620	3753	12
304	3754	5
318	3754	10
1392	3755	15
523	3755	5
758	3756	13
868	3757	4
1725	3757	10
1516	3758	12
1674	3758	3
1425	3759	12
527	3759	5
914	3760	5
1454	3760	11
87	3761	4
473	3761	10
1138	3762	13
1842	3762	6
1784	3762	8
1190	3763	11
1293	3763	4
772	3764	9
1244	3764	10
1562	3764	8
1355	3765	13
449	3765	4
651	3766	4
455	3767	14
584	3767	3
883	3768	8
1589	3768	13
1488	3768	7
928	3769	4
1077	3769	13
1823	3770	15
911	3771	7
1609	3771	13
199	3771	8
1573	3772	10
77	3772	5
1652	3773	3
553	3773	13
958	3774	12
1215	3774	5
1808	3775	8
1636	3775	13
615	3775	9
1095	3776	11
465	3776	4
1147	3777	3
623	3777	11
739	3778	5
998	3778	11
756	3779	8
870	3779	8
1010	3779	11
1551	3780	3
344	3780	11
1567	3781	4
107	3781	13
1097	3782	4
587	3782	10
1489	3783	4
330	3783	12
684	3784	5
867	3785	14
977	3785	5
1229	3786	5
1585	3786	12
1340	3787	5
1037	3788	12
1259	3788	2
1691	3789	3
553	3789	12
749	3790	5
307	3790	14
56	3791	15
537	3791	5
1215	3792	12
1245	3792	5
764	3793	12
1415	3793	4
1650	3794	4
161	3794	13
98	3795	13
71	3795	2
28	3796	4
611	3796	12
74	3797	11
541	3797	2
124	3798	11
706	3798	3
1261	3799	12
1559	3799	5
790	3800	10
677	3800	5
1690	3801	8
354	3801	8
365	3801	24
462	3801	14
210	3802	3
218	3802	10
366	3803	3
548	3803	12
1150	3804	4
1685	3804	15
890	3805	5
840	3805	11
1040	3806	8
310	3806	8
446	3806	13
1537	3807	5
230	3807	12
1055	3808	8
1219	3808	6
205	3808	12
1293	3809	8
40	3809	12
582	3809	9
773	3810	9
1132	3810	11
1645	3810	7
1292	3811	5
1374	3811	12
1365	3812	13
1574	3812	5
1301	3813	2
1621	3813	12
535	3814	5
576	3814	13
322	3815	10
170	3815	9
137	3815	9
991	3816	7
302	3816	8
675	3816	13
1453	3817	15
1447	3817	5
1266	3818	14
1552	3818	3
1647	3819	14
129	3819	2
846	3820	8
1640	3820	6
215	3820	13
1262	3821	5
377	3821	12
741	3822	14
1518	3822	5
875	3823	3
248	3823	11
1757	3824	3
231	3824	10
1820	3825	4
126	3825	15
1292	3826	4
401	3826	14
34	3827	5
1169	3828	15
828	3829	14
995	3829	4
1047	3830	15
1485	3830	3
902	3831	15
1022	3831	9
1148	3831	7
141	3832	4
1526	3833	4
462	3833	13
621	3834	14
623	3834	4
353	3835	8
88	3835	8
85	3835	10
1021	3836	7
903	3836	9
1440	3836	12
953	3837	15
1216	3837	4
143	3838	10
217	3838	5
1004	3839	10
854	3839	4
1674	3840	15
426	3840	3
1421	3841	13
332	3841	3
864	3842	5
226	3842	14
1338	3843	11
386	3843	5
1103	3844	10
565	3844	3
1844	3845	7
287	3845	11
131	3845	7
962	3846	3
322	3846	14
769	3847	11
666	3847	5
1573	3848	11
170	3848	3
1102	3849	5
1022	3849	12
1426	3850	2
66	3850	14
1001	3851	12
1349	3851	4
1093	3852	4
1492	3852	10
1335	3853	9
1296	3853	13
867	3854	2
610	3854	10
1531	3855	2
601	3856	5
27	3857	5
221	3858	5
829	3859	5
469	3860	2
21	3861	4
170	3862	4
1816	3863	5
1815	3864	4
1237	3865	8
49	3865	7
1599	3866	4
579	3867	2
1782	3868	6
412	3868	6
826	3869	4
1564	3870	3
1741	3871	5
481	3872	3
1330	3873	2
1441	3874	5
413	3875	4
1581	3876	3
909	3877	9
710	3877	6
717	3878	4
704	3879	4
998	3880	8
1243	3880	8
505	3881	2
250	3882	2
827	3883	4
1682	3884	2
1591	3885	4
1687	3886	5
836	3887	3
220	3888	9
833	3889	2
1298	3890	7
1692	3890	9
1323	3891	3
451	3892	4
267	3893	5
720	3894	5
1561	3895	3
1714	3896	4
1214	3897	5
435	3898	5
901	3899	5
199	3900	4
313	3901	3
121	3902	9
1588	3903	3
647	3904	5
1115	3905	3
1465	3906	4
1004	3907	6
208	3907	8
1440	3908	3
795	3909	5
63	3910	3
323	3911	2
927	3912	3
1520	3913	6
81	3913	6
1568	3914	2
1538	3915	6
591	3915	6
9	3916	3
1497	3917	6
593	3917	6
539	3918	2
823	3919	2
1040	3920	4
686	3921	2
1144	3922	5
1082	3923	2
804	3924	3
1339	3925	5
910	3926	5
1241	3927	2
1080	3928	4
1169	3929	4
1485	3930	4
602	3931	5
1399	3932	5
1019	3933	4
1623	3934	3
1722	3935	9
1661	3936	4
240	3937	5
1711	3938	2
1195	3939	9
569	3939	9
264	3940	4
1169	3941	3
1210	3942	8
205	3942	7
1460	3943	5
787	3944	3
1414	3945	6
1697	3945	6
1399	3946	3
888	3947	4
77	3948	7
452	3948	7
807	3949	4
1253	3950	5
335	3951	2
958	3952	3
1838	3953	4
1008	3954	5
1552	3955	4
241	3956	4
1110	3957	5
1674	3958	4
1465	3959	2
1452	3960	3
1495	3961	4
548	3962	5
381	3963	3
602	3964	3
853	3965	9
1399	3965	8
478	3966	4
1416	3967	4
461	3968	5
372	3969	4
683	3970	2
74	3971	5
1562	3972	2
417	3973	5
1722	3974	3
961	3975	9
538	3975	8
250	3976	3
1266	3977	4
1811	3978	2
953	3979	10
939	3979	10
1394	3979	11
1736	3979	14
79	3979	9
334	3979	15
282	3980	4
42	3981	5
1369	3982	5
716	3983	5
317	3984	5
189	3985	4
1696	3986	5
510	3987	4
121	3988	4
1787	3990	2
9	3991	2
1161	3992	4
1646	3993	5
732	3993	23
439	3994	3
768	3995	5
1273	3996	4
1205	3997	4
826	3998	5
613	3999	5
974	4000	5
382	4001	2
1586	4002	2
1369	4003	3
23	4004	4
604	4005	5
776	4006	2
439	4007	4
1763	4008	4
1505	4009	3
1386	4010	2
1682	4011	4
1622	4012	3
943	4013	5
685	4014	5
1615	4015	5
1398	4016	3
1648	4017	5
590	4018	4
1309	4019	4
695	4020	2
1254	4021	6
103	4021	6
1800	4022	4
686	4023	3
1261	4024	5
1106	4025	2
1381	4026	3
951	4027	3
481	4028	5
1078	4029	4
1792	4030	2
1640	4031	3
1057	4032	3
1344	4033	5
868	4034	3
1622	4035	5
1582	4036	2
1579	4036	2
1272	4037	2
95	4038	8
71	4038	7
702	4039	2
888	4040	5
1637	4041	5
1065	4042	2
1837	4043	5
718	4044	5
1133	4045	5
207	4046	5
946	4048	9
513	4048	6
1537	4049	2
1444	4050	4
460	4051	2
303	4052	3
1090	4053	6
614	4053	8
434	4054	5
166	4055	3
1087	4056	4
651	4057	3
1190	4058	3
383	4060	2
1330	4061	5
1602	4062	5
1797	4064	4
671	4065	2
754	4066	2
1373	4067	3
1417	4068	5
1757	4069	4
752	4070	5
561	4071	3
31	4072	5
541	4073	4
1612	4074	4
1677	4075	5
507	4077	5
1220	4078	5
1408	4079	5
767	4080	4
790	4081	5
734	4082	5
1833	4083	5
738	4084	5
640	4085	4
1821	4086	4
1348	4087	5
1773	4088	4
469	4089	4
1357	4090	5
1194	4091	2
1129	4092	5
958	4093	5
485	4094	3
716	4095	3
439	4096	2
1495	4097	5
1265	4098	4
1172	4099	5
1317	4100	9
273	4100	8
1664	4101	3
1168	4102	5
499	4103	2
274	4104	5
1035	4105	5
1556	4106	3
1167	4107	4
1155	4108	4
1533	4109	2
1623	4110	2
968	4111	3
126	4112	8
557	4112	9
967	4113	5
795	4114	3
1164	4115	2
872	4116	4
772	4117	6
1454	4117	12
1232	4117	13
1788	4117	10
243	4117	10
1459	4118	9
409	4119	5
297	4120	3
1369	4121	4
1714	4123	5
565	4124	5
1198	4125	4
1343	4126	2
427	4127	3
1492	4128	3
508	4129	2
328	4130	5
936	4131	8
1425	4131	7
1043	4132	5
582	4133	2
1512	4134	5
1072	4135	5
141	4136	5
1617	4137	7
480	4138	2
405	4139	3
1721	4140	3
777	4141	2
1821	4142	3
412	4143	3
167	4144	5
1286	4145	5
1276	4146	5
1348	4147	2
1169	4148	2
403	4149	5
1138	4150	5
1196	4151	4
1297	4152	4
1698	4153	3
1130	4154	2
668	4155	7
732	4155	6
888	4156	2
1076	4157	3
1065	4158	3
960	4159	5
1772	4160	3
1492	4161	5
961	4163	4
1446	4164	4
1205	4165	5
1729	4166	4
587	4167	9
1328	4168	4
21	4169	3
1838	4170	5
1723	4171	2
1679	4172	2
771	4173	4
97	4174	3
787	4175	2
1418	4176	5
1042	4177	3
1568	4178	3
1162	4179	5
1709	4180	3
752	4182	7
82	4182	7
1772	4183	2
854	4184	25
1524	4184	4
1744	4185	5
1417	4186	2
1144	4187	4
1200	4188	2
1068	4189	4
1723	4190	3
935	4191	3
1500	4192	4
1047	4193	3
1143	4194	4
664	4195	3
924	4196	7
1298	4197	5
757	4198	4
522	4199	5
801	4200	2
664	4201	5
1723	4202	4
1140	4203	2
1582	4204	4
1579	4204	4
1031	4205	8
1284	4205	8
925	4206	3
1134	4207	3
93	4208	3
23	4209	3
847	4210	4
1411	4211	2
1226	4212	5
1447	4213	2
247	4214	5
791	4215	4
790	4216	4
938	4217	5
983	4218	5
1098	4219	4
1185	4220	4
1216	4221	3
1748	4222	5
1666	4223	3
1129	4224	2
1007	4225	9
1690	4225	7
936	4226	3
302	4227	2
348	4228	5
1105	4229	5
1334	4230	6
562	4230	6
1059	4231	4
917	4232	6
1764	4232	6
555	4233	4
744	4234	2
698	4235	2
331	4236	3
210	4237	5
1467	4238	4
875	4239	6
620	4239	9
374	4240	5
241	4241	3
40	4242	4
1150	4243	3
1595	4244	2
1094	4245	5
1443	4246	2
664	4248	2
1120	4249	3
1034	4250	5
600	4251	4
1703	4252	2
518	4253	3
810	4254	3
415	4255	8
536	4255	7
1043	4257	8
26	4257	8
249	4258	3
518	4259	5
87	4260	3
414	4261	5
1531	4262	4
1782	4263	3
671	4264	4
1735	4265	5
903	4266	4
1414	4267	2
1762	4268	5
318	4269	5
1308	4270	5
1255	4271	5
873	4272	3
701	4273	4
565	4274	2
1500	4275	5
1606	4277	2
667	4278	4
845	4279	4
1640	4280	5
1093	4281	3
695	4282	3
966	4283	5
693	4284	3
1525	4285	5
697	4286	8
548	4286	9
1543	4287	5
1467	4288	3
1571	4289	2
776	4291	4
216	4292	5
1454	4293	6
24	4293	7
1286	4294	4
1191	4295	4
619	4296	4
532	4297	7
575	4297	6
847	4298	2
627	4299	4
1671	4300	2
1334	4301	5
1732	4302	4
1424	4303	2
28	4304	3
745	4305	4
1213	4306	3
62	4307	4
391	4308	5
1193	4309	4
490	4310	2
1694	4311	4
910	4312	3
1024	4313	5
883	4314	5
1386	4315	4
836	4316	6
544	4316	9
1487	4317	3
454	4318	5
132	4319	4
227	4320	4
808	4321	3
1615	4322	4
983	4323	4
10	4324	4
1303	4325	2
93	4326	4
52	4327	5
264	4328	3
776	4329	5
480	4330	4
443	4331	3
852	4332	4
1278	4333	6
1786	4333	9
1836	4334	4
331	4335	4
1642	4336	5
948	4337	5
485	4338	5
993	4339	2
667	4340	3
1691	4341	5
1157	4342	6
1463	4342	6
1443	4343	3
211	4344	4
1325	4345	5
1762	4346	4
213	4347	2
991	4348	6
275	4348	9
804	4349	2
1269	4350	5
297	4351	4
64	4352	8
467	4352	7
812	4353	2
1116	4354	5
1632	4355	3
629	4356	4
1748	4357	4
859	4358	4
1424	4359	5
1360	4360	3
1582	4361	5
1579	4361	5
958	4362	6
211	4362	7
1745	4363	5
1293	4364	5
1255	4365	3
1761	4368	8
1821	4368	7
1349	4369	2
1028	4370	4
1599	4371	3
817	4372	3
1115	4373	5
732	4374	5
314	4375	5
1589	4376	3
1436	4377	5
1274	4378	4
1228	4379	5
799	4380	4
278	4381	5
104	4382	5
1303	4383	3
177	4384	5
1671	4385	3
1821	4386	5
210	4387	2
1052	4388	7
424	4388	7
473	4389	4
1441	4390	4
1570	4391	5
1790	4392	5
1118	4393	5
1720	4394	3
431	4395	5
303	4396	4
1059	4397	5
457	4398	4
1134	4399	2
997	4400	4
952	4401	8
1435	4401	9
1843	4402	3
960	4403	4
1309	4404	5
1588	4405	4
216	4406	3
1596	4407	2
1130	4408	4
1387	4409	4
1349	4410	5
1732	4411	3
1099	4412	6
326	4412	6
1269	4413	2
467	4414	3
952	4415	7
1245	4415	7
1634	4416	2
1800	4417	2
1372	4418	5
1220	4419	2
492	4420	4
850	4421	5
1298	4422	2
810	4423	2
1382	4425	5
878	4426	4
1803	4427	4
689	4428	5
1813	4429	4
445	4430	2
1327	4431	3
1025	4432	8
502	4432	7
340	4433	3
218	4434	4
1186	4435	8
1478	4435	8
1772	4436	5
659	4437	2
1137	4438	5
1526	4439	2
1652	4440	5
1792	4441	5
990	4442	5
505	4443	4
1168	4444	4
1834	4445	5
1176	4446	3
203	4447	6
545	4447	7
1674	4448	5
1678	4449	4
686	4450	4
1655	4451	4
1107	4452	2
1364	4453	4
1169	4454	6
274	4454	7
1447	4455	3
218	4456	5
697	4457	4
1841	4458	2
1389	4459	2
1551	4460	5
1178	4461	2
643	4462	6
633	4462	8
1065	4463	5
1274	4464	5
1356	4465	8
106	4465	8
1154	4466	4
659	4467	4
939	4468	3
1010	4469	4
907	4470	4
406	4471	5
1054	4472	9
759	4472	7
1575	4473	6
513	4473	8
1210	4474	9
1822	4474	9
1414	4475	4
1412	4476	7
330	4476	6
1342	4477	4
59	4478	4
1472	4479	5
971	4480	5
1344	4481	2
1678	4482	5
1417	4483	3
351	4485	4
610	4486	4
854	4487	2
539	4488	5
425	4490	5
191	4491	3
1350	4492	3
560	4493	3
605	4494	4
608	4495	5
1595	4496	5
1143	4497	5
1505	4498	2
1179	4499	4
1823	4500	3
1321	4501	5
498	4502	5
453	4503	8
589	4504	4
1434	4505	4
708	4506	5
461	4507	4
1608	4508	5
235	4509	4
72	4510	4
1005	4511	3
1098	4512	5
687	4514	4
801	4515	4
128	4516	5
1096	4518	7
679	4518	6
1008	4519	3
504	4520	5
795	4523	4
1245	4524	4
901	4525	8
1673	4525	7
922	4526	3
1401	4527	7
1272	4527	9
1072	4528	2
1348	4529	3
869	4530	5
912	4531	4
1035	4532	6
347	4532	6
229	4533	4
283	4534	2
541	4535	3
1443	4536	5
1811	4537	5
416	4538	3
971	4539	4
853	4540	2
901	4541	6
181	4541	6
1080	4542	2
67	4543	4
322	4544	4
680	4545	4
1344	4546	4
390	4547	4
860	4548	5
1279	4549	3
1194	4550	5
1515	4551	5
24	4552	2
1097	4553	5
1834	4554	3
787	4555	5
912	4556	5
726	4557	2
1060	4558	3
945	4559	4
325	4560	5
1318	4561	3
257	4562	3
1434	4563	5
687	4564	5
450	4565	4
421	4566	4
1564	4567	4
1143	4568	2
1467	4569	5
1291	4570	2
847	4571	5
1720	4572	4
1428	4573	3
845	4574	7
1710	4574	9
1407	4575	6
1831	4575	9
930	4576	5
1137	4577	2
1360	4578	4
260	4579	7
394	4579	9
801	4580	5
404	4581	4
1214	4582	4
578	4583	2
1089	4584	3
1094	4585	2
956	4586	4
158	4587	5
1191	4588	2
199	4589	5
1250	4590	4
721	4591	5
337	4592	3
1043	4593	2
565	4594	4
764	4595	7
543	4595	8
1552	4596	2
1013	4597	2
846	4598	2
798	4600	2
510	4601	3
577	4602	3
1143	4603	3
1496	4604	2
1683	4605	3
1838	4606	3
1452	4607	2
1262	4608	6
377	4608	7
59	4609	5
1465	4610	6
581	4610	6
1173	4611	5
1805	4612	3
1163	4613	5
434	4614	4
747	4615	5
1593	4616	5
180	4617	2
557	4618	4
1499	4619	5
1725	4620	8
328	4620	9
1596	4621	6
327	4621	8
1566	4622	4
1387	4623	5
1080	4625	5
653	4627	5
237	4628	8
707	4628	8
900	4629	3
1387	4631	3
856	4632	5
550	4633	3
833	4635	5
1741	4636	3
641	4637	5
791	4638	3
337	4639	4
1498	4640	5
1571	4641	3
889	4642	4
1662	4643	4
1626	4644	3
951	4645	4
1482	4646	5
1288	4647	2
822	4648	6
1307	4648	8
866	4649	9
538	4649	7
1269	4650	4
1338	4651	5
1631	4652	4
1549	4653	2
1739	4654	3
1482	4655	4
633	4656	3
689	4657	4
1559	4658	4
747	4659	2
1591	4660	2
468	4661	5
993	4662	5
1828	4663	5
1836	4664	2
1497	4666	2
111	4667	5
1485	4668	8
1520	4668	8
972	4669	8
1835	4669	9
991	4670	5
1556	4671	4
1460	4672	4
870	4673	6
1544	4673	8
801	4674	3
368	4675	5
1327	4676	5
1622	4677	4
409	4678	4
1242	4679	3
1295	4680	4
1303	4681	4
1554	4682	5
415	4683	4
121	4684	2
1317	4685	2
921	4686	6
606	4686	8
1141	4687	4
768	4688	2
879	4689	2
358	4690	5
314	4691	2
1354	4692	2
1576	4693	4
971	4694	7
1708	4695	6
626	4695	6
738	4696	3
1120	4697	4
1150	4698	5
1767	4699	5
1436	4701	3
1161	4702	3
677	4703	2
1313	4704	4
985	4705	6
69	4705	9
468	4706	3
185	4707	5
1526	4708	3
1535	4709	5
920	4710	7
1332	4710	9
1789	4711	4
166	4712	4
1358	4713	5
1371	4714	9
99	4714	6
968	4715	2
1741	4716	6
332	4716	8
1291	4717	5
1073	4718	3
1494	4719	5
31	4720	4
1267	4721	3
1724	4722	5
1683	4723	2
1305	4724	4
1393	4725	6
272	4725	7
867	4726	5
1580	4727	3
59	4728	3
587	4729	4
805	4730	5
1805	4731	4
1025	4732	7
875	4732	9
1580	4733	4
1596	4734	8
128	4734	6
805	4735	2
222	4736	5
1717	4737	2
1145	4738	3
887	4740	2
924	4741	8
551	4741	9
1745	4742	3
478	4743	5
474	4744	3
956	4745	5
1096	4746	5
1415	4747	3
484	4748	4
983	4749	3
908	4750	7
678	4750	8
716	4751	2
1614	4752	2
1658	4753	3
732	4754	3
570	4755	4
1267	4756	5
209	4757	9
438	4757	8
1052	4758	3
557	4759	3
546	4760	5
976	4761	3
976	4762	2
1400	4763	5
85	4764	3
502	4766	5
1271	4767	4
1792	4768	4
1687	4769	2
1177	4770	8
713	4770	9
1312	4771	9
1586	4771	7
1595	4772	3
1101	4773	6
1264	4773	8
1656	4774	5
1462	4775	7
1444	4775	8
1704	4776	2
1015	4777	7
1004	4777	8
889	4778	3
441	4779	4
1315	4780	2
1395	4781	5
994	4782	2
1188	4783	2
1648	4785	3
923	4786	8
1167	4786	9
1551	4787	4
778	4788	2
276	4789	3
163	4790	5
287	4791	6
400	4791	7
1513	4792	5
243	4793	5
969	4794	4
235	4796	5
980	4797	4
1092	4798	5
1824	4799	4
1699	4800	3
1315	4801	8
419	4801	8
887	4802	5
1115	4803	4
1483	4804	3
1522	4805	4
118	4806	5
999	4807	6
925	4807	7
754	4808	4
1615	4809	2
1154	4810	5
366	4811	5
1578	4812	4
1038	4813	2
672	4814	3
303	4815	5
355	4816	4
777	4817	3
1807	4818	4
445	4819	3
1404	4820	5
1311	4821	2
1749	4822	2
796	4823	2
972	4824	7
1835	4824	8
404	4825	2
1042	4826	4
169	4827	5
1444	4828	2
1745	4829	2
1343	4830	3
1273	4831	3
1679	4832	4
824	4833	4
855	4834	5
1211	4835	4
785	4836	5
1760	4837	3
1400	4838	4
1321	4839	3
1127	4840	5
1275	4841	3
262	4842	3
629	4843	5
1677	4844	4
1067	4845	3
1813	4846	5
1554	4847	2
873	4848	4
1789	4849	5
1381	4850	4
435	4851	4
833	4852	3
213	4853	4
381	4854	7
539	4854	7
1721	4855	2
1834	4856	2
1038	4857	5
900	4858	4
1559	4859	6
416	4859	8
1591	4860	3
1478	4861	2
1442	4862	4
1301	4863	5
1726	4864	4
644	4865	2
1721	4866	5
603	4867	3
1325	4868	9
1770	4868	8
796	4869	4
1544	4870	5
687	4871	2
1640	4872	4
1632	4873	5
878	4874	3
1078	4875	3
1543	4876	4
1524	4877	3
1531	4878	5
352	4879	3
170	4880	5
988	4881	5
1318	4882	4
143	4883	6
387	4883	7
70	4884	3
1593	4885	7
548	4885	6
857	4886	7
326	4886	7
439	4887	5
1324	4888	8
414	4888	7
1670	4889	5
1124	4890	5
193	4891	6
645	4891	9
1038	4892	3
378	4893	2
996	4894	6
248	4894	8
1215	4895	4
1119	4896	4
1566	4897	5
435	4898	2
1402	4899	2
442	4900	4
1130	4901	5
1094	4902	3
1388	4903	9
151	4903	6
1336	4904	2
1593	4905	4
1691	4906	2
1787	4907	5
1499	4908	2
976	4909	5
582	4910	5
987	4911	5
1298	4912	3
1792	4913	3
224	4914	4
807	4915	3
1828	4916	4
726	4917	4
22	4918	5
1200	4919	4
838	4920	6
1567	4920	6
424	4921	4
772	4922	5
660	4923	2
150	4924	3
1224	4925	4
1746	4926	5
966	4927	4
1782	4928	4
1194	4929	4
561	4930	5
910	4931	4
665	4932	5
196	4933	5
635	4935	3
1687	4936	3
243	4937	4
531	4938	4
140	4939	4
1430	4940	3
747	4941	4
729	4942	4
318	4943	9
38	4943	9
608	4944	4
1842	4945	5
1749	4946	3
1040	4947	5
235	4948	2
1749	4949	5
1443	4950	4
1671	4951	4
922	4952	2
1558	4953	4
1428	4954	8
721	4955	3
404	4956	3
570	4957	5
805	4958	4
50	4959	4
445	4960	5
759	4961	4
1614	4962	4
1302	4963	4
791	4964	5
763	4965	7
303	4966	2
1111	4967	4
981	4968	5
806	4969	3
262	4970	5
960	4971	3
1397	4972	5
88	4973	3
876	4975	2
264	4976	2
826	4977	9
27	4977	9
1592	4978	4
701	4979	5
309	4980	5
1749	4981	4
1470	4982	2
1485	4983	5
1301	4984	4
70	4985	5
1418	4986	3
1232	4988	5
1238	4989	4
860	4990	2
1345	4991	7
600	4991	7
97	4992	2
549	4993	3
1483	4994	2
1138	4995	4
1157	4996	4
1570	4997	2
1643	4998	2
1692	4999	3
708	5000	4
384	5001	4
646	5002	5
105	5003	3
520	5004	4
1833	5005	2
65	5006	5
796	5007	3
277	5008	3
1751	5009	4
324	5010	4
1350	5011	5
1287	5012	5
183	5013	3
1429	5014	4
378	5015	5
856	5016	4
1768	5017	5
950	5019	3
1581	5020	2
1586	5021	3
1754	5022	3
117	5023	5
1339	5024	3
1581	5025	4
817	5026	4
1783	5027	4
71	5028	4
1525	5029	4
987	5030	4
1744	5031	4
411	5032	3
904	5033	2
960	5034	2
833	5035	4
1807	5036	2
1699	5037	4
1405	5038	2
1404	5039	9
1654	5039	7
810	5041	4
1461	5042	3
876	5043	3
1612	5044	3
1373	5045	5
366	5046	4
1610	5047	5
1699	5048	5
464	5049	3
1578	5050	3
639	5051	4
579	5052	4
633	5053	2
1252	5054	4
1682	5055	5
1273	5056	2
1189	5057	2
1386	5058	5
1253	5059	4
783	5060	7
658	5060	9
1418	5061	4
1024	5062	3
590	5063	5
377	5064	4
1612	5065	2
767	5066	5
878	5067	2
15	5068	4
729	5069	3
15	5070	5
1653	5071	4
1617	5072	5
1638	5073	2
1308	5074	2
717	5075	5
496	5076	4
1014	5077	5
1763	5078	5
59	5079	2
1634	5080	6
703	5080	6
1185	5081	2
873	5082	5
389	5083	4
1584	5084	5
584	5085	4
479	5086	3
44	5087	9
546	5087	8
760	5088	5
424	5089	3
1109	5090	2
678	5091	4
937	5092	8
417	5092	7
774	5094	2
1496	5095	5
1553	5096	3
1084	5097	7
1819	5097	7
1241	5098	5
1453	5099	2
703	5100	5
1570	5101	4
918	5102	2
1435	5103	3
460	5104	3
655	5105	2
388	5106	6
372	5106	8
136	5107	5
1691	5108	4
721	5110	4
1013	5111	5
1348	5112	4
921	5113	4
1546	5114	4
365	5115	21
183	5115	4
1041	5116	5
53	5117	7
267	5117	7
1505	5118	4
1677	5119	3
1268	5120	4
1224	5121	5
1203	5122	3
918	5123	5
1061	5124	3
1634	5125	4
660	5126	3
1817	5127	4
1803	5128	5
1469	5129	4
1430	5130	5
1195	5131	4
150	5132	5
768	5133	3
1098	5134	6
1111	5134	7
1461	5135	4
522	5136	4
722	5137	4
7	5138	5
1392	5139	7
515	5139	6
1713	5140	3
1632	5142	7
1549	5143	5
1328	5144	3
1725	5145	5
1782	5146	5
744	5147	9
1172	5147	9
306	5148	5
1182	5149	4
1098	5150	2
1420	5152	3
1838	5153	2
986	5154	4
1420	5156	2
1794	5157	2
1183	5158	4
1766	5159	3
1402	5160	5
1652	5161	4
397	5162	3
1145	5163	2
1456	5164	9
429	5164	8
655	5165	4
1459	5166	4
71	5167	3
1433	5168	3
454	5169	3
1804	5170	3
1034	5171	3
968	5172	5
1193	5173	5
1481	5174	7
323	5174	7
1140	5175	3
1419	5176	4
476	5177	4
602	5178	2
716	5179	4
1560	5180	3
1643	5181	3
655	5182	5
680	5183	5
629	5184	3
1298	5185	4
398	5186	5
1105	5187	4
1101	5188	9
1473	5188	8
290	5189	4
1623	5190	4
550	5191	2
216	5192	2
93	5193	2
1299	5195	5
1452	5196	4
1708	5197	8
66	5197	6
1680	5198	5
996	5199	5
936	5200	2
1234	5201	5
1773	5202	5
935	5204	2
1472	5205	4
764	5206	5
467	5207	4
1091	5208	6
1279	5208	8
1739	5209	4
1426	5210	5
1302	5211	3
335	5212	4
655	5213	3
983	5214	2
693	5215	5
397	5216	5
1057	5217	4
1836	5218	5
1311	5219	4
722	5220	2
269	5221	5
872	5222	5
664	5223	4
938	5224	3
987	5225	2
751	5226	6
1689	5226	7
729	5227	5
1198	5228	5
658	5229	5
109	5230	5
1174	5231	5
1442	5232	3
786	5233	5
719	5235	4
981	5236	3
113	5237	5
1556	5238	2
1181	5239	3
631	5240	2
679	5241	9
474	5241	9
435	5242	3
1302	5243	2
1154	5244	2
1398	5245	2
326	5246	2
929	5247	3
468	5248	4
1466	5250	5
1137	5251	3
1797	5252	2
1044	5253	5
72	5254	5
1815	5255	8
502	5255	6
1610	5256	4
1396	5257	5
1350	5258	4
1682	5259	3
1293	5260	3
520	5261	5
197	5262	5
1615	5263	3
1145	5264	8
579	5264	9
733	5265	4
1772	5266	4
1362	5267	4
169	5268	3
1556	5269	5
153	5270	3
1510	5271	5
33	5272	5
950	5273	5
1434	5274	3
1431	5275	8
408	5275	8
1618	5276	7
191	5276	9
1261	5277	4
1207	5278	2
94	5279	2
479	5280	9
579	5280	7
924	5281	6
453	5281	7
1163	5282	4
264	5284	5
1120	5285	5
480	5287	3
1512	5288	3
1739	5289	2
505	5290	3
587	5291	3
999	5292	7
854	5292	23
1490	5292	9
770	5293	9
393	5293	7
286	5295	9
184	5295	9
989	5296	5
1768	5297	4
516	5298	2
1632	5299	4
12	5300	5
431	5301	4
1213	5302	4
1069	5303	3
1339	5304	2
862	5305	3
1716	5307	2
823	5308	7
787	5308	9
1638	5309	5
1316	5310	5
1385	5311	3
1181	5312	2
641	5313	4
1427	5314	7
1565	5314	7
1320	5315	2
1336	5316	4
1260	5317	2
72	5318	2
677	5319	8
524	5320	4
1175	5321	9
627	5321	6
492	5322	3
1396	5323	2
1711	5324	3
738	5325	4
1217	5326	5
1520	5327	3
1750	5328	2
1511	5329	4
922	5330	4
1483	5331	4
1845	5332	5
698	5333	4
1776	5334	6
517	5334	7
1489	5335	9
628	5335	6
1797	5336	5
1049	5337	2
390	5338	2
1349	5339	6
643	5339	9
1476	5340	8
662	5340	6
773	5341	7
437	5341	7
1134	5342	5
340	5343	2
1253	5344	8
1804	5344	6
1746	5345	3
783	5346	5
1820	5347	3
869	5348	4
766	5349	5
641	5350	2
1358	5351	3
1133	5352	3
1442	5353	8
632	5353	7
1718	5354	3
997	5355	5
872	5356	3
375	5357	4
993	5358	3
518	5359	6
671	5359	6
1523	5360	7
513	5360	7
627	5361	5
1240	5362	5
980	5363	6
1464	5363	8
473	5364	5
23	5365	2
490	5366	3
285	5367	2
552	5368	5
1155	5369	3
1478	5370	3
1426	5371	4
1446	5372	5
329	5373	2
1819	5374	4
1105	5375	3
440	5376	3
1739	5377	5
715	5378	3
970	5379	8
1430	5379	9
1761	5380	5
1462	5381	6
270	5381	7
778	5382	5
1565	5383	2
95	5384	4
375	5385	2
687	5386	3
1647	5387	5
1305	5388	3
413	5389	5
1080	5390	3
1634	5391	5
23	5392	9
636	5392	6
230	5393	2
1314	5394	5
1540	5395	5
1062	5396	4
1617	5397	6
421	5397	7
1736	5398	4
1395	5399	2
1552	5400	5
1155	5401	5
1671	5402	5
483	5403	4
1415	5404	5
1353	5405	5
841	5406	3
690	5407	3
1384	5408	8
48	5408	6
396	5409	5
40	5410	3
1455	5411	8
1663	5411	8
663	5412	4
159	5413	3
1795	5414	5
910	5415	6
1387	5415	9
683	5416	3
969	5417	5
1498	5418	2
1246	5419	4
862	5420	2
1398	5421	5
1626	5422	4
783	5423	4
1610	5424	3
427	5425	4
1757	5426	5
1255	5427	4
1590	5428	4
699	5429	3
744	5430	5
783	5431	3
628	5432	5
1465	5433	3
701	5434	3
1234	5435	2
1222	5436	4
1196	5437	5
1724	5438	4
1446	5439	3
401	5440	5
191	5441	8
18	5441	7
659	5442	5
892	5443	3
351	5444	5
180	5445	5
274	5446	4
1265	5447	2
453	5448	4
745	5449	5
1708	5450	4
1109	5451	3
1448	5452	3
1195	5453	3
844	5454	5
1320	5455	3
1222	5456	5
738	5457	2
1571	5458	4
1727	5459	5
1067	5460	4
1353	5461	3
324	5462	2
215	5463	7
432	5463	7
153	5464	2
1448	5465	5
888	5466	3
759	5467	5
1602	5468	4
1142	5469	6
93	5469	9
638	5470	5
1124	5471	4
1065	5472	4
1314	5473	2
514	5474	4
1302	5475	5
1468	5476	5
1468	5477	4
878	5478	5
920	5479	3
810	5480	5
499	5481	5
114	5482	5
1325	5483	4
327	5484	2
1185	5485	3
1328	5486	5
1275	5487	5
1301	5488	3
689	5489	3
70	5490	4
509	5491	5
1710	5492	5
965	5493	5
1094	5494	4
1805	5495	5
1738	5496	5
1428	5497	6
180	5498	4
171	5499	3
445	5500	4
1801	5501	5
1244	5502	7
1605	5502	9
641	5503	3
1720	5504	2
1174	5505	8
200	5505	6
802	5506	6
380	5506	8
974	5507	2
321	5508	5
66	5509	4
1405	5510	5
455	5511	5
1126	5512	6
1366	5512	9
1609	5514	2
1330	5515	3
1107	5516	5
1448	5517	4
1446	5518	2
1243	5519	4
1731	5520	2
461	5521	2
1303	5522	5
587	5524	5
681	5525	3
1259	5526	9
286	5526	7
377	5527	5
1713	5528	4
64	5529	3
1076	5530	5
603	5532	2
1707	5533	5
404	5534	5
1046	5535	4
1313	5536	3
1803	5537	3
1140	5538	4
1373	5539	2
1200	5540	5
1082	5541	4
1304	5542	5
1245	5543	2
1791	5544	4
208	5545	5
150	5546	2
1081	5547	4
972	5548	6
1835	5548	7
628	5549	4
1542	5550	5
302	5551	5
290	5552	3
549	5553	2
150	5554	4
1059	5555	2
288	5556	5
1648	5557	9
1578	5557	9
1624	5558	6
513	5558	9
722	5559	5
1022	5560	8
1663	5560	7
1788	5561	5
1710	5562	4
851	5563	5
371	5564	3
1724	5565	2
1695	5566	3
796	5567	5
1745	5568	4
1321	5569	2
221	5570	3
1738	5571	3
1200	5572	3
1200	5573	6
17	5573	6
211	5574	3
1264	5575	6
911	5576	5
982	5577	5
1653	5578	2
659	5579	3
1841	5580	5
690	5581	4
1548	5582	5
464	5583	2
1241	5584	4
626	5585	2
920	5586	12
1208	5586	12
1741	5586	10
314	5586	9
192	5586	10
644	5586	10
236	5587	3
951	5588	2
799	5589	3
1082	5590	5
1381	5591	5
689	5592	2
341	5594	8
682	5594	6
1531	5595	3
393	5596	3
804	5597	5
876	5598	5
579	5599	3
1194	5600	3
1137	5601	4
1195	5602	5
171	5603	5
1144	5604	3
1038	5605	4
1092	5606	4
766	5607	3
683	5608	5
723	5609	6
446	5609	8
1069	5610	7
580	5610	8
1178	5611	6
41	5611	9
798	5612	4
469	5613	3
1768	5614	2
377	5615	3
1433	5616	5
1711	5617	4
72	5618	3
1265	5619	3
1553	5620	9
145	5621	3
1327	5622	2
1522	5623	2
1212	5624	2
230	5625	3
1247	5626	5
606	5627	5
488	5628	4
1318	5629	5
88	5631	4
785	5632	2
412	5633	4
946	5634	8
814	5634	7
1485	5635	2
558	5636	5
1683	5637	5
715	5638	2
872	5639	2
1575	5640	5
486	5641	5
479	5642	4
237	5643	5
671	5644	5
1729	5645	3
736	5646	9
1118	5646	8
1311	5647	5
1452	5648	5
1180	5649	7
388	5649	9
539	5650	4
221	5651	4
562	5652	5
1764	5653	3
611	5654	3
1554	5655	4
847	5656	3
524	5657	3
1179	5658	3
1616	5659	4
1651	5660	2
1295	5661	5
1779	5662	5
1653	5663	5
1658	5664	2
1299	5665	3
1450	5666	8
215	5666	9
947	5667	4
515	5668	5
324	5669	3
1522	5670	5
834	5671	2
928	5672	5
1126	5673	9
93	5673	6
1549	5674	3
1466	5675	6
406	5675	9
547	5676	5
1168	5677	2
669	5678	3
1740	5679	5
1454	5680	4
851	5681	8
1756	5681	7
823	5682	5
1499	5683	4
1193	5684	2
74	5685	4
1107	5686	8
682	5686	7
1720	5687	5
693	5688	4
768	5689	4
469	5690	5
978	5691	5
74	5692	3
1500	5693	3
862	5694	7
305	5694	6
876	5695	4
1336	5696	5
1353	5697	2
391	5698	3
461	5699	3
1402	5700	3
306	5701	3
1364	5702	5
1601	5703	7
578	5703	7
1139	5704	4
1044	5705	6
94	5705	7
853	5706	4
480	5707	5
1078	5708	5
1134	5709	4
1402	5710	4
1058	5711	5
1797	5712	3
938	5713	2
442	5714	2
993	5715	4
1631	5716	2
453	5717	5
1234	5718	3
1746	5719	4
440	5720	4
1816	5721	4
1420	5722	4
743	5723	5
774	5724	5
561	5725	4
1236	5726	5
455	5727	2
1760	5728	5
277	5729	5
750	5730	9
661	5730	9
577	5731	2
355	5732	2
1212	5733	3
533	5735	5
1417	5736	4
1805	5737	2
1185	5738	5
943	5739	4
1420	5740	5
1339	5742	4
146	5743	5
895	5744	5
807	5745	5
1653	5746	3
725	5747	4
668	5748	3
774	5749	4
1088	5750	11
1199	5750	11
1660	5750	11
676	5750	9
1035	5751	12
1252	5751	9
1409	5751	12
1354	5751	15
1662	5751	15
821	5752	13
1089	5752	8
969	5752	11
1621	5752	10
285	5752	12
850	5753	8
1281	5753	15
1363	5753	10
1758	5753	15
1490	5753	13
262	5754	13
562	5754	10
456	5754	8
674	5754	12
536	5754	10
1763	5755	11
270	5755	9
120	5755	14
300	5755	10
699	5755	12
1155	5756	12
1112	5756	10
1413	5756	15
179	5756	6
176	5756	10
789	5757	14
1479	5757	12
361	5757	12
130	5757	9
622	5757	11
999	5758	10
1384	5758	10
1433	5758	9
1553	5758	10
599	5758	12
887	5759	15
863	5759	11
86	5759	12
11	5759	12
1031	5760	10
1327	5760	9
1730	5760	12
128	5760	15
499	5760	15
1542	5761	14
1763	5761	12
610	5761	8
583	5761	13
1394	5762	14
300	5762	8
273	5762	10
136	5762	11
886	5763	14
1331	5763	10
1573	5763	13
62	5763	10
572	5763	9
909	5764	12
1085	5764	8
902	5764	11
1296	5764	11
1340	5764	13
1149	5765	11
1822	5765	14
268	5765	15
181	5765	13
640	5765	9
1358	5766	15
1718	5766	12
304	5766	8
588	5766	14
459	5766	12
1086	5767	12
1170	5767	10
264	5767	10
302	5767	13
126	5767	7
1071	5768	10
979	5768	11
867	5768	8
1588	5768	15
80	5768	15
1827	5769	13
102	5769	12
321	5769	14
703	5769	7
543	5769	15
163	5770	8
240	5770	10
492	5770	11
677	5770	13
1033	5771	13
1425	5771	14
205	5771	8
591	5771	10
760	5772	11
1537	5772	10
512	5772	6
955	5773	11
173	5773	7
160	5773	11
748	5774	11
1035	5774	13
1577	5774	6
330	5774	10
1228	5775	11
85	5775	8
399	5775	14
585	5775	12
1666	5776	13
1789	5776	13
217	5776	8
570	5776	13
1451	5777	15
1592	5777	11
2	5777	15
543	5777	9
760	5778	12
1504	5778	9
1608	5778	12
41	5778	14
834	5779	7
1479	5779	13
360	5779	13
7	5779	15
802	5780	14
1012	5780	11
1425	5780	10
1766	5780	6
142	5781	12
450	5781	8
620	5781	15
503	5781	15
1294	5782	11
1630	5782	15
108	5782	14
372	5782	7
909	5783	15
1806	5783	8
188	5783	10
560	5783	10
926	5784	12
816	5784	14
1697	5784	14
671	5784	8
1569	5785	8
361	5785	14
231	5785	14
569	5785	12
1018	5786	8
1096	5786	11
1686	5786	11
1662	5786	12
835	5787	11
773	5787	14
367	5787	6
650	5787	10
5	5788	13
1	5788	12
501	5788	14
574	5788	7
1260	5789	13
1317	5789	10
424	5789	6
710	5789	14
840	5790	15
890	5790	12
1285	5790	10
403	5790	9
45	5791	14
567	5791	9
545	5791	11
430	5791	15
842	5792	7
1259	5792	12
1561	5792	13
661	5792	11
1021	5793	15
1260	5793	12
1475	5793	9
499	5793	14
213	5794	10
452	5794	11
488	5794	12
610	5794	6
1488	5795	9
1589	5795	14
164	5795	12
30	5795	13
743	5796	14
1162	5796	12
1528	5796	9
179	5796	10
1332	5797	13
1152	5797	12
1519	5797	8
1722	5797	15
1423	5798	14
1229	5798	13
1355	5798	7
213	5798	12
1069	5799	14
1716	5799	12
225	5799	7
263	5799	12
789	5800	12
1422	5800	10
39	5800	9
477	5800	15
986	5801	8
1127	5801	10
1689	5801	15
432	5801	11
975	5802	12
812	5802	13
782	5802	11
192	5802	7
739	5803	9
845	5803	14
1325	5803	14
1322	5803	13
864	5804	9
1704	5804	10
427	5804	15
517	5805	12
650	5805	9
367	5805	10
767	5806	10
959	5806	14
1250	5806	8
881	5807	13
1141	5807	9
238	5807	15
1769	5808	12
130	5808	8
275	5808	15
899	5809	13
789	5809	8
103	5809	12
1133	5810	12
1669	5810	14
447	5810	6
1098	5811	11
1111	5811	9
249	5811	13
1041	5812	9
1183	5812	10
1561	5812	10
994	5813	9
826	5813	15
123	5813	13
1736	5814	10
347	5814	12
482	5814	9
1479	5815	11
448	5815	13
678	5815	7
1464	5816	15
1828	5816	9
611	5816	10
431	5817	14
568	5817	7
691	5817	11
867	5818	9
1473	5818	13
402	5818	14
752	5819	12
1611	5819	7
1565	5819	11
1808	5820	7
507	5820	13
648	5820	10
1548	5821	10
133	5821	6
421	5821	15
1146	5822	8
575	5822	12
684	5822	13
1267	5823	10
1486	5823	15
48	5823	8
1165	5824	14
1795	5824	8
86	5824	11
1135	5825	8
1660	5825	14
128	5825	13
1783	5826	13
1813	5826	7
311	5826	13
1054	5827	13
1184	5827	8
296	5827	14
986	5828	12
320	5828	8
520	5828	15
1119	5829	13
70	5829	6
585	5829	14
895	5830	12
1160	5830	13
1725	5830	6
751	5831	13
1457	5831	9
137	5831	13
1128	5832	13
1153	5832	9
1659	5832	10
920	5833	10
1076	5833	12
1222	5833	9
837	5834	10
1190	5834	15
1575	5834	8
1645	5835	12
1546	5835	15
1736	5835	7
818	5836	15
712	5836	15
577	5836	8
1469	5837	6
243	5837	15
668	5837	12
1090	5838	10
1268	5838	9
1010	5839	8
1736	5839	13
220	5839	13
924	5840	10
1248	5840	10
1568	5840	8
339	5841	13
696	5841	12
695	5841	7
1789	5842	7
34	5842	14
725	5842	13
1292	5843	10
1477	5843	10
263	5843	7
60	5844	7
596	5844	15
512	5844	14
737	5845	11
1596	5845	14
1736	5845	9
1735	5846	15
1538	5846	11
1693	5846	7
1203	5847	13
1212	5847	11
175	5847	6
1603	5848	15
1725	5848	7
652	5848	11
1775	5849	10
322	5849	11
508	5849	8
1287	5850	10
1398	5850	9
332	5850	12
863	5851	8
1701	5851	13
642	5851	10
1463	5852	13
1380	5852	13
285	5852	8
814	5853	6
835	5853	10
629	5853	10
129	5854	6
188	5854	12
124	5854	10
1277	5855	10
1374	5855	10
1590	5855	7
1058	5856	8
899	5856	12
1257	5857	8
1201	5857	15
1740	5857	11
944	5858	12
1127	5858	7
1784	5858	11
884	5859	10
1337	5859	11
1698	5859	8
1049	5860	6
1274	5860	13
1837	5860	13
1624	5861	15
154	5861	6
1461	5862	12
1533	5862	13
644	5862	8
189	5863	7
211	5863	13
725	5863	11
1589	5864	11
1609	5864	12
1692	5864	7
988	5865	12
146	5865	15
653	5865	7
185	5866	11
43	5866	6
61	5866	14
1373	5867	7
233	5867	14
358	5867	13
744	5868	8
1437	5868	12
1502	5868	15
873	5869	14
692	5869	9
421	5869	12
831	5870	14
357	5870	7
375	5870	10
834	5871	14
1589	5871	6
574	5871	11
980	5872	12
1354	5872	9
369	5872	14
925	5873	12
1061	5873	10
1460	5873	6
1015	5874	14
1206	5874	10
624	5874	7
1284	5875	14
1756	5875	8
300	5875	11
1774	5876	15
401	5876	7
661	5877	13
608	5877	10
622	5877	7
930	5878	8
1323	5878	11
1736	5878	12
1359	5879	11
1437	5879	6
718	5879	14
745	5880	9
90	5880	11
373	5880	14
770	5881	10
1451	5881	7
1263	5881	10
902	5882	14
884	5882	12
316	5882	7
812	5883	10
1634	5883	9
707	5883	11
1093	5884	6
1728	5884	11
728	5884	10
1457	5885	7
58	5885	11
78	5885	13
1028	5886	11
242	5886	7
429	5886	15
1027	5887	12
1026	5887	12
759	5887	6
821	5888	9
240	5888	11
367	5888	11
956	5889	15
295	5889	7
270	5889	11
913	5890	14
1261	5890	7
1624	5890	14
855	5891	6
1363	5891	15
1704	5891	11
1212	5892	6
57	5892	13
373	5892	11
1502	5893	11
1747	5893	14
268	5893	6
1174	5894	15
1341	5894	9
101	5894	10
914	5895	10
1410	5895	13
1373	5895	9
1160	5896	8
466	5896	12
599	5896	13
1514	5897	14
653	5897	8
622	5897	14
315	5898	11
623	5898	6
559	5898	10
1086	5899	9
153	5899	15
406	5899	12
1151	5900	8
1831	5900	11
68	5900	12
1071	5901	7
1401	5901	11
1109	5901	10
1702	5902	14
399	5902	12
628	5902	9
1146	5903	13
482	5903	15
684	5903	8
1395	5904	14
1741	5904	12
121	5904	8
1088	5905	10
1733	5905	9
553	5905	11
1250	5906	7
1588	5906	13
637	5906	10
115	5907	8
227	5907	10
439	5907	15
113	5908	12
512	5908	13
575	5908	7
1009	5909	10
1762	5909	14
104	5909	8
818	5910	8
1657	5910	12
731	5910	12
768	5911	14
1816	5911	13
1570	5911	7
1132	5912	10
187	5912	15
395	5912	9
1250	5913	9
1645	5913	14
475	5913	15
914	5914	13
1622	5914	6
1500	5914	13
1584	5915	7
560	5915	13
576	5915	12
216	5916	8
99	5916	12
164	5916	15
1284	5917	6
91	5917	13
491	5917	11
1747	5918	11
20	5918	7
881	5919	11
1347	5919	6
167	5919	14
1195	5920	14
1367	5920	9
1627	5920	14
1067	5921	10
1778	5921	11
153	5921	8
1806	5922	10
160	5922	13
90	5922	8
1228	5923	9
388	5923	10
714	5923	12
442	5924	15
453	5924	9
882	5925	14
209	5925	8
587	5925	15
227	5926	14
245	5926	8
859	5927	14
1440	5927	6
13	5927	15
1012	5928	6
1235	5928	13
1630	5928	13
1422	5929	7
1795	5929	14
214	5929	12
1281	5930	10
1728	5930	9
114	5930	14
1135	5931	15
226	5931	9
696	5931	11
1022	5932	13
1005	5932	9
517	5932	15
1055	5933	15
465	5933	12
592	5933	6
952	5934	11
1267	5934	14
584	5934	7
816	5935	15
1221	5935	9
298	5935	12
1232	5936	10
63	5936	14
723	5936	9
753	5937	8
1449	5937	15
1431	5937	13
1843	5938	12
300	5938	14
587	5938	8
1534	5939	9
1731	5939	15
528	5939	14
1211	5940	12
349	5940	10
402	5940	8
913	5941	10
1650	5941	8
1567	5942	14
316	5942	9
413	5942	13
933	5943	8
130	5943	12
513	5943	13
1208	5944	10
1818	5944	11
644	5944	9
1688	5945	10
1605	5945	11
542	5945	9
\.

COPY countries (name, continent, area, population, gdp) FROM stdin;
Afghanistan	South Asia	652225	26000000	\N
Albania	Europe	28728	3200000	6656000000
Algeria	Middle East	2400000	32900000	75012000000
Andorra	Europe	468	64000	\N
Angola	Africa	1250000	14500000	14935000000
Antigua and Barbuda	Americas	442	77000	770000000
Argentina	South America	2800000	39300000	146196000000
Armenia	Europe	29743	3000000	3360000000
Australia	Asia-Pacific	7700000	20300000	546070000000
Austria	Europe	83871	8100000	261630000000
Azerbaijan	Europe	86600	8500000	\N
Bahamas	Americas	13939	321000	4789320000
Bahrain	Middle East	717	754000	9357140000
Bangladesh	South Asia	143998	152600000	67144000000
Barbados	Americas	430	272000	2518720000
Belarus	Europe	207595	9800000	20776000000
Belgium	Europe	30528	10300000	319609000000
Belize	Americas	22965	266000	\N
Benin	Africa	112622	7100000	3763000000
Bhutan	South Asia	38364	2400000	1824000000
Bolivia	South America	1100000	9100000	\N
Bosnia-Hercegovina	Europe	51129	4200000	8568000000
Botswana	Africa	581730	1800000	7812000000
Brazil	South America	8550000	182800000	564852000000
Brunei	Asia-Pacific	5765	374000	\N
Bulgaria	Europe	110994	7800000	21372000000
Burkina Faso	Africa	274200	13800000	4968000000
Burma	Asia-Pacific	676552	50700000	\N
Burundi	Africa	27816	7300000	\N
Cambodia	Asia-Pacific	181035	14800000	4736000000
Cameroon	Africa	465458	16600000	13280000000
Canada	North America	9900000	32000000	908480000000
Cape Verde	Africa	4033	482000	853140000
Central African Republic	Africa	622984	3900000	\N
Chad	Africa	1280000	9100000	2366000000
Chile	South America	756096	16200000	79542000000
China	Asia-Pacific	9600000	1300000000	1677000000000
Colombia	South America	1140000	45600000	\N
Comoros	Africa	1862	812000	\N
Costa Rica	Americas	51100	4300000	\N
Croatia	Europe	56594	4400000	28996000000
Cuba	Americas	110860	11300000	\N
Cyprus	Europe	9250	807000	14187060000
Czech Republic	Europe	78866	10200000	93330000000
Democratic Republic of Congo	Africa	2340000	56000000	6720000000
Denmark	Europe	43098	5400000	219510000000
Djibouti	Africa	23200	721000	\N
Dominica	Americas	751	71000	259150000
Dominican Republic	Americas	48072	9000000	\N
East Timor	Asia-Pacific	14609	857000	\N
Ecuador	South America	272045	13400000	\N
Egypt	Middle East	1000000	74900000	98119000000
El Salvador	Americas	21041	6700000	15745000000
Equatorial Guinea	Africa	28051	521000	484530000
Eritrea	Africa	117400	4561599	\N
Estonia	Europe	45227	1300000	9113000000
Ethiopia	Africa	1130000	74200000	8162000000
Fiji	Asia-Pacific	18376	854000	\N
Finland	Europe	338145	5200000	170508000000
Former Yugoslav Republic of Macedonia	Europe	25713	2000000	4700000000
France	Europe	543965	60700000	1826463000000
Gabon	Africa	267667	1400000	\N
Georgia	Europe	69700	5000000	5200000000
Germany	Europe	357027	82500000	2484900000000
Ghana	Africa	238533	21800000	8284000000
Greece	Europe	131957	11000000	182710000000
Grenada	Americas	344	103000	\N
Guatemala	Americas	108890	13000000	\N
Guinea	Africa	245857	8800000	4048000000
Guinea-Bissau	Africa	36125	1600000	256000000
Guyana	South America	214969	768000	\N
Haiti	Americas	27750	8500000	\N
Honduras	Americas	112492	7200000	7416000000
Hungary	Europe	93030	9800000	81046000000
Iceland	Europe	103000	294000	11354280000
India	South Asia	3100000	1100000000	682000000000
Indonesia	Asia-Pacific	1900000	225300000	256842000000
Iran	Middle East	1650000	70700000	162610000000
Iraq	Middle East	438317	26500000	\N
Ireland	Europe	70182	4000000	137120000000
Israel and Palestinian territories	Middle East	20770	3800000	4256000000
Italy	Europe	301338	57200000	1494064000000
Ivory Coast	Africa	322462	17100000	13167000000
Jamaica	Americas	10991	2700000	7830000000
Japan	Asia-Pacific	377864	127900000	4755322000000
Jordan	Middle East	89342	5700000	12198000000
Kazakhstan	Asia-Pacific	2700000	15400000	\N
Kenya	Africa	582646	32800000	15088000000
Kiribati	Asia-Pacific	810	85000	82450000
Kuwait	Middle East	17818	2700000	48519000000
Kyrgyzstan	Asia-Pacific	199900	5300000	\N
Laos	Asia-Pacific	236800	5900000	2301000000
Latvia	Europe	64589	2300000	\N
Lebanon	Middle East	10452	3800000	18924000000
Lesotho	Africa	30355	1800000	1332000000
Liberia	Africa	99067	3600000	396000000
Libya	Africa	1770000	5800000	25810000000
Liechtenstein	Europe	160	34000	\N
Lithuania	Europe	65300	3400000	19516000000
Luxembourg	Europe	2586	465000	26146950000
Madagascar	Africa	587041	18400000	5520000000
Malawi	Africa	118484	12600000	2142000000
Malaysia	Asia-Pacific	329847	25300000	\N
Mali	Africa	1250000	13800000	4968000000
Malta	Europe	316	397000	4863250000
Marshall Islands	Asia-Pacific	181	57000	135090000
Mauritania	Middle East	1040000	3100000	1302000000
Mauritius	Africa	2040	1200000	5568000000
Mexico	North America	1960000	106400000	720328000000
Micronesia	Asia-Pacific	700	111000	\N
Moldova	Europe	33800	4300000	3053000000
Monaco	Europe	2	32000	\N
Mongolia	Asia-Pacific	1560000	2700000	\N
Morocco	Middle East	710850	31600000	48032000000
Mozambique	Africa	812379	19500000	4875000000
Namibia	Africa	824292	2000000	4740000000
Nauru	Asia-Pacific	21	9900	\N
Nepal	South Asia	147181	26300000	6838000000
New Zealand	Asia-Pacific	270534	4000000	81240000000
Nicaragua	Americas	120254	5700000	4503000000
Niger	Africa	1270000	12900000	2967000000
Nigeria	Africa	923768	130200000	50778000000
North Korea	Asia-Pacific	122762	22900000	\N
Norway	Europe	323759	4600000	239338000000
Oman	Middle East	309500	3000000	23670000000
Pakistan	South Asia	796095	161100000	96660000000
Palau	Asia-Pacific	508	20000	\N
Panama	Americas	75517	3200000	\N
Papua New Guinea	Asia-Pacific	462840	5900000	3422000000
Paraguay	South America	406752	6200000	\N
Peru	South America	1280000	28000000	\N
Poland	Europe	312685	38500000	234465000000
Portugal	Europe	92345	10500000	150675000000
Qatar	Middle East	11437	628000	\N
Republic of Congo	Africa	342000	3039126	\N
Romania	Europe	238391	22200000	64824000000
Russia	Europe	17000000	141500000	482515000000
Rwanda	Africa	26338	8600000	1892000000
Samoa	Asia-Pacific	2831	182000	\N
San Marino	Europe	61	27000	\N
Sao Tome and Principe	Africa	1001	169000	62530000
Saudi Arabia	Middle East	2240000	25600000	267008000000
Senegal	Africa	196722	10600000	7102000000
Serbia and Montenegro	Europe	102173	10500000	27510000000
Seychelles	Africa	455	76000	\N
Sierra Leone	Africa	71740	5300000	1060000000
Singapore	Asia-Pacific	660	4400000	106568000000
Slovakia	Europe	49033	5400000	34992000000
Slovenia	Europe	20273	2000000	29620000000
Solomon Islands	Asia-Pacific	27556	504000	277200000
Somalia	Africa	637657	10700000	\N
South Africa	Africa	1220000	45300000	164439000000
South Korea	Asia-Pacific	99313	48200000	673836000000
Spain	Europe	505988	44100000	935361000000
Sri Lanka	South Asia	65610	19400000	19594000000
St Kitts and Nevis	Americas	269	46000	\N
St Lucia	Americas	616	152000	655120000
St Vincent and the Grenadines	Americas	389	121000	441650000
Sudan	Middle East	2500000	35000000	18550000000
Surinam	South America	163265	442000	\N
Swaziland	Africa	17364	1100000	1826000000
Sweden	Europe	449964	8900000	318353000000
Switzerland	Europe	41284	7100000	342433000000
Syria	Middle East	185180	18600000	22134000000
Taiwan	Asia-Pacific	36188	22700000	302364000000
Tajikistan	Asia-Pacific	143100	6300000	\N
Tanzania	Africa	945087	38400000	\N
Thailand	Asia-Pacific	513115	64100000	162814000000
The Gambia	Africa	11295	1500000	\N
The Maldives	South Asia	298	338000	848380000
The Netherlands	Europe	41864	16300000	516710000000
The Philippines	Asia-Pacific	300000	82800000	96876000000
Togo	Africa	56785	5100000	1938000000
Tonga	Asia-Pacific	748	106000	\N
Trinidad and Tobago	Americas	5128	1300000	\N
Tunisia	Middle East	164150	10000000	26300000000
Turkey	Europe	779452	73300000	274875000000
Turkmenistan	Asia-Pacific	488100	5000000	\N
Tuvalu	Asia-Pacific	26	10000	\N
Uganda	Africa	241038	27600000	7452000000
Ukraine	Europe	603700	47800000	60228000000
United Arab Emirates	Middle East	77700	3100000	\N
United Kingdom	Europe	242514	59600000	2022824000000
United States of America	North America	9800000	295000000	12213000000000
Uruguay	South America	176215	3500000	\N
Uzbekistan	Asia-Pacific	447400	26900000	\N
Vanuatu	Asia-Pacific	12190	222000	297480000
Vatican	Europe	0	\N	\N
Venezuela	South America	881050	26600000	\N
Vietnam	Asia-Pacific	329247	83600000	45980000000
Yemen	Middle East	536869	21500000	12255000000
Zambia	Africa	752614	11000000	4950000000
Zimbabwe	Africa	390759	12900000	6192000000
\.

COPY depts (id, name) FROM stdin;
1	Computing
2	Design
3	Engineering
\.

COPY movies (id, title, yr, score, votes, director_id) FROM stdin;
1	Star Wars	1977	8.80000000000000071	53567	360
2	Shawshank Redemption, The	1994	9	44974	1040
3	Pulp Fiction	1994	8.59999999999999964	43993	444
4	Titanic	1997	7.20000000000000018	43371	198
5	Star Wars: Episode V - The Empire Strikes Back	1980	8.59999999999999964	39446	651
6	Usual Suspects, The	1995	8.69999999999999929	35027	639
7	Schindler's List	1993	8.80000000000000071	34251	18
8	Saving Private Ryan	1998	8.5	34113	18
9	Braveheart	1995	8.30000000000000071	32870	22
10	American Beauty	1999	8.80000000000000071	32547	2542
11	Raiders of the Lost Ark	1981	8.59999999999999964	31750	18
12	Godfather, The	1972	9	31225	28
13	Star Wars: Episode VI - Return of the Jedi	1983	8	30178	1020
14	Blade Runner	1982	8.30000000000000071	29877	110
15	Silence of the Lambs, The	1991	8.5	29582	281
16	Forrest Gump	1994	7.79999999999999982	29400	67
17	Star Wars: Episode I - The Phantom Menace	1999	7.29999999999999982	28641	360
18	Sixth Sense, The	1999	8.5	27626	966
19	Independence Day	1996	6	26259	290
20	Terminator 2: Judgment Day	1991	7.90000000000000036	25767	198
21	Se7en	1995	8.09999999999999964	25158	414
22	Fargo	1996	8.19999999999999929	25044	111
23	2001: A Space Odyssey	1968	8.30000000000000071	24536	82
24	Aliens	1986	8.19999999999999929	23965	198
25	Truman Show, The	1998	7.79999999999999982	23665	86
26	Back to the Future	1985	7.79999999999999982	23306	67
27	Casablanca	1942	8.80000000000000071	23283	675
28	One Flew Over the Cuckoo's Nest	1975	8.69999999999999929	22868	408
29	Good Will Hunting	1997	7.90000000000000036	22734	271
30	Fifth Element, The	1997	7	22365	389
31	Twelve Monkeys	1995	7.79999999999999982	22342	59
32	Gladiator	2000	8.30000000000000071	21955	110
33	Fight Club	1999	8.5	21391	414
34	Clockwork Orange, A	1971	8.19999999999999929	21216	82
35	Alien	1979	8.19999999999999929	20998	110
36	Princess Bride, The	1987	8.19999999999999929	20931	37
37	Indiana Jones and the Last Crusade	1989	7.79999999999999982	20897	18
38	Fugitive, The	1993	7.79999999999999982	20843	291
39	Reservoir Dogs	1992	8.19999999999999929	20343	444
40	Citizen Kane	1941	8.80000000000000071	20269	253
41	Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb	1964	8.69999999999999929	20034	82
42	Die Hard	1988	7.90000000000000036	19929	196
43	Goodfellas	1990	8.5	19430	78
44	Scream	1996	7.20000000000000018	19350	133
45	Apocalypse Now	1979	8.30000000000000071	19335	28
46	Terminator, The	1984	7.79999999999999982	18995	198
47	As Good As It Gets	1997	7.79999999999999982	18856	574
48	Dead Poets Society	1989	7.70000000000000018	18769	86
49	Monty Python and the Holy Grail	1975	8.30000000000000071	18640	59
50	Trainspotting	1996	7.79999999999999982	18428	597
51	Rock, The	1996	7	18013	678
52	Shakespeare in Love	1998	7.90000000000000036	17918	1011
53	Apollo 13	1995	7.59999999999999964	17797	21
54	Psycho	1960	8.59999999999999964	17734	11
55	Contact	1997	7.59999999999999964	17390	67
56	There's Something About Mary	1998	7.29999999999999982	17352	2459
57	Toy Story	1995	7.90000000000000036	16971	1044
58	Armageddon	1998	5.79999999999999982	16581	678
59	Blair Witch Project, The	1999	6.59999999999999964	16204	2248
60	Rain Man	1988	7.79999999999999982	15933	38
61	Godfather: Part II, The	1974	8.80000000000000071	15487	28
62	Face/Off	1997	7.20000000000000018	14744	204
63	Shining, The	1980	8.09999999999999964	14653	82
64	Amadeus	1984	8.19999999999999929	14351	408
65	Taxi Driver	1976	8.40000000000000036	14090	78
66	E.T. the Extra-Terrestrial	1982	7.70000000000000018	14062	18
67	Blues Brothers, The	1980	7.5	13979	62
68	Star Trek: First Contact	1996	7.20000000000000018	13948	500
69	Full Metal Jacket	1987	8.09999999999999964	13863	82
70	Being John Malkovich	1999	8.30000000000000071	13809	1485
71	Clerks	1994	7.90000000000000036	13803	445
72	Wizard of Oz, The	1939	8.30000000000000071	13444	1151
73	Green Mile, The	1999	8.30000000000000071	13409	1040
74	Vita &#232; bella, La	1997	8.59999999999999964	13403	820
75	Austin Powers: International Man of Mystery	1997	7	13372	604
76	Ferris Bueller's Day Off	1986	7.59999999999999964	13326	144
77	Starship Troopers	1997	6.59999999999999964	13205	201
78	Groundhog Day	1993	7.70000000000000018	13093	108
79	Mission: Impossible	1996	6.40000000000000036	13029	31
80	Heat	1995	7.70000000000000018	13016	1106
81	English Patient, The	1996	7.09999999999999964	12995	621
82	American History X	1998	8.30000000000000071	12977	2663
83	Top Gun	1986	6.40000000000000036	12851	107
84	Speed	1994	7	12715	421
85	Twister	1996	5.90000000000000036	12597	421
86	Batman	1989	7.09999999999999964	12512	148
87	Rear Window	1954	8.69999999999999929	12484	11
88	Eyes Wide Shut	1999	7.29999999999999982	12455	82
89	Brazil	1985	8	12319	59
90	Big Lebowski, The	1998	7.59999999999999964	12266	111
91	True Lies	1994	7	12109	198
92	X-Men	2000	7.79999999999999982	12093	639
93	Full Monty, The	1997	7.40000000000000036	11852	2757
94	North by Northwest	1959	8.59999999999999964	11588	11
95	Chasing Amy	1997	7.59999999999999964	11563	445
96	Hunt for Red October, The	1990	7.5	11251	196
97	Vertigo	1958	8.5	11231	11
98	Dogma	1999	7.59999999999999964	11133	445
99	Mission: Impossible II	2000	6.29999999999999982	11117	204
100	Fish Called Wanda, A	1988	7.70000000000000018	11075	2247
101	American Pie	1999	7.09999999999999964	10908	2859
102	Austin Powers: The Spy Who Shagged Me	1999	6.5	10891	604
103	Indiana Jones and the Temple of Doom	1984	6.90000000000000036	10674	18
104	When Harry Met Sally...	1989	7.59999999999999964	10663	37
105	Gone with the Wind	1939	8.09999999999999964	10628	1151
106	Stand by Me	1986	7.79999999999999982	10579	37
107	Batman & Robin	1997	3.5	10577	105
108	Ghostbusters	1984	7.29999999999999982	10543	109
109	Dances with Wolves	1990	7.59999999999999964	10522	10
110	Sleepy Hollow	1999	7.5	10514	148
111	South Park: Bigger, Longer and Uncut	1999	7.70000000000000018	10471	270
112	Three Kings	1999	7.70000000000000018	10319	1070
113	Platoon	1986	7.90000000000000036	10272	69
114	From Dusk Till Dawn	1996	6.59999999999999964	10152	666
115	Mummy, The	1999	6.59999999999999964	10125	1103
116	Toy Story 2	1999	8.5	10020	2043
117	Air Force One	1997	6.5	9941	140
118	Unforgiven	1992	7.90000000000000036	9903	2
119	Breakfast Club, The	1985	7.40000000000000036	9760	144
120	Field of Dreams	1989	7.59999999999999964	9717	993
121	To Kill a Mockingbird	1962	8.5	9707	2586
122	Untouchables, The	1987	7.79999999999999982	9592	31
123	Graduate, The	1967	8.09999999999999964	9558	47
124	Thin Red Line, The	1998	7.20000000000000018	9555	686
125	Game, The	1997	7.5	9552	414
126	Godzilla	1998	4.20000000000000018	9464	290
127	Boogie Nights	1997	7.5	9458	1037
128	Abyss, The	1989	7.29999999999999982	9434	198
129	Romeo + Juliet	1996	6.59999999999999964	9274	1069
130	Total Recall	1990	7.09999999999999964	9261	201
131	Grosse Pointe Blank	1997	7.40000000000000036	9211	2103
132	X Files, The	1998	6.79999999999999982	9114	2673
133	Close Encounters of the Third Kind	1977	7.70000000000000018	9107	18
134	Few Good Men, A	1992	7.40000000000000036	9077	37
135	Exorcist, The	1973	7.90000000000000036	8984	264
136	Devil's Advocate, The	1997	7	8983	674
137	Scream 2	1997	6.20000000000000018	8970	133
138	Pleasantville	1998	7.5	8969	2118
139	Deep Impact	1998	6	8950	589
140	Con Air	1997	6.29999999999999982	8917	1114
141	Grease	1978	6.59999999999999964	8857	383
142	Natural Born Killers	1994	6.29999999999999982	8744	69
143	Sling Blade	1996	8.09999999999999964	8740	298
144	True Romance	1993	7.5	8657	107
145	GoldenEye	1995	6.70000000000000018	8484	2539
146	Bug's Life, A	1998	7.70000000000000018	8481	1044
147	Airplane!	1980	7.59999999999999964	8431	189
148	Back to the Future Part II	1989	6.59999999999999964	8411	67
149	Deer Hunter, The	1978	8.09999999999999964	8393	2645
150	Boot, Das	1981	8.5	8392	140
151	Gattaca	1997	7.40000000000000036	8388	2020
152	Alien: Resurrection	1997	6	8363	2235
153	Beauty and the Beast	1991	7.79999999999999982	8306	2126
154	Chinatown	1974	8.40000000000000036	8280	90
155	Casino	1995	7.59999999999999964	8247	78
156	World Is Not Enough, The	1999	6.59999999999999964	8226	199
157	Raising Arizona	1987	7.59999999999999964	8185	111
158	Army of Darkness	1993	7.20000000000000018	8165	141
159	12 Angry Men	1957	8.59999999999999964	8158	80
160	Batman Forever	1995	5.29999999999999982	8130	105
161	Sting, The	1973	8.19999999999999929	8108	276
162	Glory	1989	8.09999999999999964	8079	382
163	Raging Bull	1980	8.40000000000000036	8029	78
164	Dark City	1998	7.5	8024	1047
165	Wallace & Gromit: The Wrong Trousers	1993	8.5	8024	572
166	Beetlejuice	1988	6.90000000000000036	8019	148
167	Highlander	1986	7.09999999999999964	8013	577
168	Pretty Woman	1990	6.5	7993	129
169	Notting Hill	1999	7.29999999999999982	7977	2760
170	Go	1999	7.79999999999999982	7935	1163
171	Sound of Music, The	1965	7.59999999999999964	7913	286
172	Crow, The	1994	6.90000000000000036	7869	1047
173	Patriot, The	2000	7.29999999999999982	7826	290
174	Enemy of the State	1998	7.20000000000000018	7817	107
175	Babe	1995	7.59999999999999964	7811	2353
176	Talented Mr. Ripley, The	1999	7.20000000000000018	7797	621
177	Who Framed Roger Rabbit	1988	7.29999999999999982	7789	67
178	Tomorrow Never Dies	1997	6.5	7683	407
179	Dead Man Walking	1995	7.70000000000000018	7636	25
180	Out of Sight	1998	7.59999999999999964	7555	689
181	Sleepless in Seattle	1993	6.79999999999999982	7551	1091
182	Die Hard: With a Vengeance	1995	6.79999999999999982	7544	196
183	Aladdin	1992	7.5	7537	1152
184	Dumb & Dumber	1994	6.20000000000000018	7444	2825
185	Wedding Singer, The	1998	6.79999999999999982	7431	1054
186	Insider, The	1999	8.19999999999999929	7429	1106
187	Negotiator, The	1998	7.20000000000000018	7420	1035
188	Perfect Storm, The	2000	6.59999999999999964	7414	140
189	Bridge on the River Kwai, The	1957	8.40000000000000036	7395	1080
190	Four Weddings and a Funeral	1994	7.20000000000000018	7394	585
191	Ransom	1996	6.70000000000000018	7377	21
192	Back to the Future Part III	1990	6.40000000000000036	7337	67
193	Rocky Horror Picture Show, The	1975	6.5	7288	2325
194	Rushmore	1998	7.59999999999999964	7269	1034
195	Spaceballs	1987	6.40000000000000036	7225	29
196	Analyze This	1999	6.79999999999999982	7224	108
197	Die Hard 2	1990	6.59999999999999964	7197	210
198	Young Frankenstein	1974	8	7186	29
199	Goldfinger	1964	7.70000000000000018	7180	636
200	Clueless	1995	6.70000000000000018	7159	403
201	Thelma & Louise	1991	7.20000000000000018	7153	110
202	Ronin	1998	7	7144	676
203	Predator	1987	7.09999999999999964	7136	196
204	Cruel Intentions	1999	6.70000000000000018	7081	2765
205	Batman Returns	1992	6.20000000000000018	7063	148
206	Swingers	1996	7.5	7038	1163
207	Basic Instinct	1992	6.5	7011	201
208	Annie Hall	1977	8.19999999999999929	6989	1
209	Star Trek: The Wrath of Khan	1982	7.40000000000000036	6969	571
210	Waterworld	1995	5.29999999999999982	6934	378
211	Ben-Hur	1959	8.09999999999999964	6927	620
212	Animal House	1978	7.40000000000000036	6925	62
213	Blade	1998	6.70000000000000018	6885	2861
214	Dune	1984	6.09999999999999964	6884	139
215	Galaxy Quest	1999	7.5	6841	1101
216	Shine	1996	7.5	6837	1135
217	Simple Plan, A	1998	7.70000000000000018	6763	141
218	Ghost	1990	6.70000000000000018	6741	1116
219	Big	1988	7.20000000000000018	6741	361
220	Edward Scissorhands	1990	7.29999999999999982	6697	148
221	Christmas Story, A	1983	8.09999999999999964	6693	579
222	Singin' in the Rain	1952	8.5	6662	428
223	Time to Kill, A	1996	6.90000000000000036	6658	105
224	You've Got Mail	1998	6.40000000000000036	6654	1091
225	Butch Cassidy and the Sundance Kid	1969	8.09999999999999964	6637	276
226	Halloween	1978	7.5	6621	23
227	Stargate	1994	6.20000000000000018	6604	290
228	Ed Wood	1994	7.79999999999999982	6587	148
229	Wild Things	1998	6.79999999999999982	6569	974
230	Elizabeth	1998	7.70000000000000018	6562	2755
231	Dracula	1992	6.90000000000000036	6551	28
232	My Best Friend's Wedding	1997	6.5	6543	1169
233	Robin Hood: Prince of Thieves	1991	6.29999999999999982	6540	378
234	High Fidelity	2000	7.90000000000000036	6535	292
235	Chicken Run	2000	8	6534	2802
236	Sense and Sensibility	1995	7.70000000000000018	6476	273
237	Some Like It Hot	1959	8.40000000000000036	6445	79
238	Much Ado About Nothing	1993	7.5	6443	48
239	Home Alone	1990	6.09999999999999964	6430	156
240	Ace Ventura: Pet Detective	1994	6.09999999999999964	6414	586
241	Shichinin no samurai	1954	9	6357	208
242	While You Were Sleeping	1995	6.59999999999999964	6353	411
243	Witness	1985	7.59999999999999964	6332	86
244	I Know What You Did Last Summer	1997	5.29999999999999982	6305	2420
245	Alien&#179;	1992	5.79999999999999982	6293	414
246	Player, The	1992	7.79999999999999982	6278	155
247	Wag the Dog	1997	6.90000000000000036	6244	38
248	Tombstone	1993	7.20000000000000018	6171	631
249	Buono, il brutto, il cattivo, Il	1966	8.5	6161	268
250	Erin Brockovich	2000	7.59999999999999964	6152	689
251	End of Days	1999	5.5	6095	103
252	Star Trek: Insurrection	1998	6.40000000000000036	6088	500
253	Sleepers	1996	6.79999999999999982	6052	38
254	Antz	1998	7.20000000000000018	6045	2072
255	City of Angels	1998	6.29999999999999982	6022	1139
256	Event Horizon	1997	5.40000000000000036	5993	653
257	Birds, The	1963	7.79999999999999982	5969	11
258	Superman	1978	6.90000000000000036	5958	209
259	Mrs. Doubtfire	1993	6.40000000000000036	5956	156
260	Entrapment	1999	6.20000000000000018	5940	669
261	Rocky	1976	7.59999999999999964	5933	683
262	Goonies, The	1985	6.70000000000000018	5908	209
263	Blazing Saddles	1974	7.59999999999999964	5876	29
264	This Is Spinal Tap	1984	7.90000000000000036	5854	37
265	Hook	1991	5.59999999999999964	5852	18
266	Donnie Brasco	1997	7.5	5832	585
267	What's Eating Gilbert Grape	1993	7.5	5808	387
268	Scent of a Woman	1992	7.20000000000000018	5799	595
269	Philadelphia	1993	7.29999999999999982	5790	281
270	Crimson Tide	1995	7.09999999999999964	5784	107
271	Great Escape, The	1963	8.19999999999999929	5783	2473
272	Wayne's World	1992	6.59999999999999964	5756	1021
273	Broken Arrow	1996	5.79999999999999982	5751	204
274	8MM	1999	6	5744	105
275	Beverly Hills Cop	1984	7	5717	595
276	Excalibur	1981	7.40000000000000036	5716	293
277	Election	1999	7.70000000000000018	5713	2199
278	Unbreakable	2000	7.5	5701	966
279	Get Shorty	1995	7	5693	422
280	Star Trek: Generations	1994	6	5674	2282
281	Dangerous Liaisons	1988	7.70000000000000018	5651	292
282	Dazed and Confused	1993	7.09999999999999964	5643	205
283	Gandhi	1982	7.79999999999999982	5643	235
284	Blue Velvet	1986	7.59999999999999964	5628	139
285	Sneakers	1992	7	5627	993
286	RoboCop	1987	6.90000000000000036	5596	201
287	Cider House Rules, The	1999	7.70000000000000018	5588	387
288	Third Man, The	1949	8.59999999999999964	5576	1003
289	Payback	1999	7	5566	2427
290	Fantasia	1940	7.90000000000000036	5552	1167
291	Happy Gilmore	1996	6.59999999999999964	5539	330
292	Piano, The	1993	7.29999999999999982	5526	575
293	Saint, The	1997	5.70000000000000018	5522	212
294	Desperado	1995	6.59999999999999964	5510	666
295	Eraser	1996	6	5504	1122
296	Strange Days	1995	6.90000000000000036	5489	641
297	Good Morning, Vietnam	1987	7	5485	38
298	In the Line of Fire	1993	7.29999999999999982	5481	140
299	African Queen, The	1951	8.19999999999999929	5468	312
300	Phenomenon	1996	6.40000000000000036	5456	411
301	Thomas Crown Affair, The	1999	6.79999999999999982	5444	196
302	Fisher King, The	1991	7.29999999999999982	5441	59
303	Central do Brasil	1998	8.09999999999999964	5429	2560
304	Arlington Road	1999	7.20000000000000018	5422	1897
305	Mission to Mars	2000	4.79999999999999982	5420	31
306	Willy Wonka & the Chocolate Factory	1971	7.40000000000000036	5392	2740
307	Fried Green Tomatoes	1991	7.29999999999999982	5388	691
308	Deep Blue Sea	1999	6	5336	210
309	Heathers	1989	7.40000000000000036	5327	371
310	Wild Wild West	1999	4	5323	422
311	Conspiracy Theory	1997	6.5	5322	209
312	Cape Fear	1991	7	5319	78
313	Hamlet	1996	7.70000000000000018	5317	48
314	Gremlins	1984	6.59999999999999964	5297	150
315	Tootsie	1982	7.5	5291	92
316	Waterboy, The	1998	5.5	5272	1054
317	Scream 3	2000	6.09999999999999964	5268	133
318	Net, The	1995	5.59999999999999964	5263	1172
319	Firm, The	1993	6.5	5255	92
320	That Thing You Do!	1996	6.59999999999999964	5253	8
321	Rush Hour	1998	6.70000000000000018	5246	1094
322	Gone in Sixty Seconds	2000	6	5234	2362
323	Nightmare Before Christmas, The	1993	7.5	5226	1036
324	Nuovo cinema Paradiso	1988	8.19999999999999929	5178	2142
325	Bound	1996	7.5	5127	2024
326	West Side Story	1961	7.70000000000000018	5101	2295
327	Quiz Show	1994	7.40000000000000036	5094	36
328	WarGames	1983	6.79999999999999982	5074	66
329	Scary Movie	2000	5.79999999999999982	5059	1361
330	In & Out	1997	6.20000000000000018	5055	123
331	Wo hu zang long	2000	9	5016	273
332	Spartacus	1960	8	5006	82
333	Right Stuff, The	1983	8	5006	288
334	Outbreak	1995	6.5	4999	140
335	Evil Dead II	1987	7.40000000000000036	4994	141
336	Sphere	1998	5.09999999999999964	4991	38
337	Caddyshack	1980	6.79999999999999982	4989	108
338	Cable Guy, The	1996	5.40000000000000036	4985	242
339	American President, The	1995	7	4975	37
340	My Fair Lady	1964	7.79999999999999982	4969	628
341	Crocodile Dundee	1986	6.5	4962	2823
342	Once Upon a Time in America	1984	8	4959	268
343	Backdraft	1991	6.5	4949	21
344	Clear and Present Danger	1994	6.90000000000000036	4943	212
345	Ghostbusters II	1989	5.29999999999999982	4919	109
346	U-571	2000	6.90000000000000036	4917	1120
347	Birdcage, The	1996	6.5	4902	47
348	Sliding Doors	1998	7	4886	1940
349	Star Trek IV: The Voyage Home	1986	7	4879	193
350	Scarface	1983	7.40000000000000036	4877	31
351	People vs. Larry Flynt, The	1996	7.20000000000000018	4873	408
352	Mr. Holland's Opus	1995	7	4865	149
353	Haunting, The	1999	4.79999999999999982	4835	421
354	Bone Collector, The	1999	6.20000000000000018	4810	212
355	In the Name of the Father	1993	7.70000000000000018	4793	581
356	Patriot Games	1992	6.79999999999999982	4774	212
357	Dirty Dancing	1987	5.79999999999999982	4769	662
358	Ever After	1998	7.20000000000000018	4764	654
359	Bowfinger	1999	6.79999999999999982	4759	123
360	Thing, The	1982	7.5	4751	23
361	Hudsucker Proxy, The	1994	7.29999999999999982	4743	111
362	Planet of the Apes	1968	7.59999999999999964	4742	405
363	Elephant Man, The	1980	8	4728	139
364	Any Given Sunday	1999	6.70000000000000018	4722	69
365	Ice Storm, The	1997	7.5	4718	273
366	Nikita	1990	7.59999999999999964	4714	389
367	Naked Gun: From the Files of Police Squad!, The	1988	7.29999999999999982	4707	573
368	What Dreams May Come	1998	6.20000000000000018	4686	2500
369	Demolition Man	1993	6.09999999999999964	4682	1182
370	Showgirls	1995	3.5	4672	201
371	American Graffiti	1973	7.70000000000000018	4669	360
372	Awakenings	1990	7.40000000000000036	4662	361
373	Fear and Loathing in Las Vegas	1998	6.5	4658	59
374	Breaking the Waves	1996	7.70000000000000018	4645	615
375	Private Parts	1997	6.59999999999999964	4644	425
376	Patton	1970	8.09999999999999964	4637	405
377	Cool Hand Luke	1967	8.09999999999999964	4635	1029
378	Postino, Il	1994	7.70000000000000018	4630	1154
379	Whole Nine Yards, The	2000	6.70000000000000018	4626	262
380	Avengers, The	1998	3.39999999999999991	4623	412
381	Heavenly Creatures	1994	7.79999999999999982	4592	326
382	Patch Adams	1998	6.20000000000000018	4569	586
383	Wallace & Gromit: A Close Shave	1995	8.19999999999999929	4561	572
384	10 Things I Hate About You	1999	7.09999999999999964	4539	2129
385	Snake Eyes	1998	5.70000000000000018	4536	31
386	Remains of the Day, The	1993	7.79999999999999982	4528	576
387	October Sky	1999	8	4510	424
388	Addams Family, The	1991	6.40000000000000036	4499	422
389	American Psycho	2000	7	4487	2531
390	Breakfast at Tiffany's	1961	7.70000000000000018	4483	65
391	Boys Don't Cry	1999	8	4481	2172
392	Miller's Crossing	1990	7.90000000000000036	4453	111
393	Name der Rose, Der	1986	7.5	4453	1131
394	Dragonheart	1996	6.20000000000000018	4432	376
395	Bringing Out the Dead	1999	7	4431	78
396	Deliverance	1972	7.79999999999999982	4418	293
397	Delicatessen	1991	7.70000000000000018	4394	995
398	Shallow Grave	1994	7.40000000000000036	4387	597
399	Charlie's Angels	2000	6.90000000000000036	4374	2358
400	All the President's Men	1976	7.79999999999999982	4361	275
401	Mulan	1998	7.40000000000000036	4360	2651
402	Star Trek: The Motion Picture	1979	5.5	4358	286
403	Conan the Barbarian	1982	6.20000000000000018	4356	693
404	Akira	1988	7.40000000000000036	4321	2045
405	Double Jeopardy	1999	6	4321	685
406	Twins	1988	6	4318	109
407	Speed 2: Cruise Control	1997	3.20000000000000018	4313	421
408	Dave	1993	7.09999999999999964	4305	109
409	Rebel Without a Cause	1955	7.79999999999999982	4296	1706
410	Star Trek VI: The Undiscovered Country	1991	6.70000000000000018	4287	571
411	Faculty, The	1998	6.29999999999999982	4287	666
412	Pi	1998	7.5	4283	1136
413	Big Daddy	1999	6.09999999999999964	4275	330
414	Say Anything...	1989	7.5	4257	391
415	Ace Ventura: When Nature Calls	1995	4.5	4250	948
416	Midnight Cowboy	1969	7.90000000000000036	4250	677
417	Gods and Monsters	1998	7.79999999999999982	4241	2365
418	She's All That	1999	6	4240	2491
419	Nutty Professor, The	1996	6	4234	586
420	Pitch Black	2000	6.59999999999999964	4216	1071
421	Bill & Ted's Excellent Adventure	1989	6.5	4214	149
422	Monty Python's The Meaning of Life	1983	7.20000000000000018	4212	59
423	Highlander II: The Quickening	1991	3.20000000000000018	4211	577
424	Final Destination	2000	6.79999999999999982	4196	2426
425	Crying Game, The	1992	7.29999999999999982	4192	153
426	Bad Boys	1995	6.29999999999999982	4190	678
427	Poltergeist	1982	7.20000000000000018	4182	1123
428	Cop Land	1997	6.70000000000000018	4173	1099
429	What Lies Beneath	2000	6.79999999999999982	4162	67
430	Falling Down	1993	6.90000000000000036	4161	105
431	Coming to America	1988	6.5	4147	62
432	Stigmata	1999	6.09999999999999964	4141	2557
433	eXistenZ	1999	6.90000000000000036	4130	97
434	Evita	1996	6.29999999999999982	4129	68
435	Trois couleurs: Rouge	1994	8.19999999999999929	4113	398
436	Six Days Seven Nights	1998	5.70000000000000018	4107	109
437	Godfather: Part III, The	1990	7	4105	28
438	Star Trek III: The Search for Spock	1984	6.09999999999999964	4094	193
439	13th Warrior, The	1999	6.20000000000000018	4089	196
440	Sweet Hereafter, The	1997	8	4067	665
441	Cliffhanger	1993	6	4064	210
442	Sunset Blvd.	1950	8.59999999999999964	4050	79
443	Smoke	1995	7.5	4049	664
444	Mystery Men	1999	6.09999999999999964	4043	2187
445	Pink Floyd The Wall	1982	7.20000000000000018	4043	68
446	Cell, The	2000	6.5	4037	2528
447	Misery	1990	7.40000000000000036	4026	37
448	Happiness	1998	7.79999999999999982	4011	1121
449	My Cousin Vinny	1992	7.09999999999999964	4011	262
450	Born on the Fourth of July	1989	6.90000000000000036	4002	69
451	Office Space	1999	7.09999999999999964	3997	582
452	Courage Under Fire	1996	6.90000000000000036	3987	382
453	Mr. Smith Goes to Washington	1939	8.40000000000000036	3977	392
454	Color Purple, The	1985	7.40000000000000036	3973	18
455	Arsenic and Old Lace	1944	8.09999999999999964	3970	392
456	Romancing the Stone	1984	6.79999999999999982	3967	67
457	Secrets & Lies	1996	7.79999999999999982	3967	583
458	Craft, The	1996	5.90000000000000036	3966	657
459	Primal Fear	1996	7.29999999999999982	3953	630
460	Cit&#233; des enfants perdus, La	1995	7.70000000000000018	3946	995
461	Evil Dead, The	1982	7.09999999999999964	3941	141
462	General's Daughter, The	1999	6.20000000000000018	3939	1114
463	Tarzan	1999	7.59999999999999964	3937	2334
464	Snow White and the Seven Dwarfs	1937	7.79999999999999982	3931	1117
465	Frequency	2000	7.59999999999999964	3928	630
466	Planes, Trains & Automobiles	1987	7.09999999999999964	3925	144
467	Henry V	1989	8	3921	48
468	Trading Places	1983	7.20000000000000018	3910	62
469	Beach, The	2000	5.79999999999999982	3908	597
470	Point Break	1991	6.29999999999999982	3907	641
471	Doctor Zhivago	1965	7.70000000000000018	3903	1080
472	Star Trek V: The Final Frontier	1989	4.59999999999999964	3880	128
473	All About Eve	1950	8.59999999999999964	3876	1111
474	Being There	1979	7.90000000000000036	3872	971
475	Searching for Bobby Fischer	1993	7.59999999999999964	3870	1043
476	High Noon	1952	8.19999999999999929	3864	617
477	Running Man, The	1987	6.20000000000000018	3864	890
478	Philadelphia Story, The	1940	8.19999999999999929	3856	628
479	Dr. No	1962	7.09999999999999964	3850	388
480	Trois couleurs: Bleu	1993	7.90000000000000036	3848	398
481	Better Off Dead...	1985	7.09999999999999964	3843	2674
482	Working Girl	1988	6.5	3821	47
483	Wild Bunch, The	1969	8.09999999999999964	3814	1072
484	Ghost and the Darkness, The	1996	6.40000000000000036	3812	672
485	Harold and Maude	1971	7.70000000000000018	3811	971
486	On the Waterfront	1954	8.30000000000000071	3800	655
487	Clue	1985	6.29999999999999982	3794	262
488	Beavis and Butt-head Do America	1996	5.90000000000000036	3770	582
489	Opposite of Sex, The	1998	7	3767	2382
490	Bodyguard, The	1992	5.20000000000000018	3757	1118
491	Runaway Bride	1999	6	3753	129
492	Wall Street	1987	7	3736	69
493	Witches of Eastwick, The	1987	6.29999999999999982	3736	979
494	Hackers	1995	5.70000000000000018	3734	988
495	Midnight Run	1988	7.40000000000000036	3732	595
496	Fly, The	1986	6.90000000000000036	3729	97
497	U.S. Marshals	1998	6.20000000000000018	3716	1064
498	Dog Day Afternoon	1975	7.79999999999999982	3715	80
499	Bulworth	1998	7.09999999999999964	3700	60
500	Amistad	1997	7.20000000000000018	3700	18
501	Time Bandits	1981	6.79999999999999982	3698	59
502	Truth About Cats & Dogs, The	1996	6.59999999999999964	3690	371
503	Doors, The	1991	6.29999999999999982	3681	69
504	Day the Earth Stood Still, The	1951	7.79999999999999982	3676	286
505	Waking Ned Devine	1998	7.5	3671	2166
506	Prince of Egypt, The	1998	7.20000000000000018	3669	2472
507	Hurricane, The	1999	7.70000000000000018	3665	81
508	Frighteners, The	1996	6.79999999999999982	3662	326
509	Very Bad Things	1998	5.79999999999999982	3657	806
510	Ran	1985	8.5	3654	208
511	City Slickers	1991	6.70000000000000018	3648	415
512	Empire of the Sun	1987	7.29999999999999982	3647	18
513	Splash	1984	6.40000000000000036	3646	21
514	Fast Times at Ridgemont High	1982	6.90000000000000036	3640	403
515	Almost Famous	2000	8.59999999999999964	3639	391
516	Spanish Prisoner, The	1997	7.59999999999999964	3633	606
517	Naked Gun 2 1/2: The Smell of Fear, The	1991	6.09999999999999964	3626	573
518	Paths of Glory	1957	8.80000000000000071	3620	82
519	Ten Commandments, The	1956	7.70000000000000018	3618	1906
520	Dead Again	1991	7.20000000000000018	3616	48
521	Superman II	1980	6.29999999999999982	3609	274
522	Touch of Evil	1958	8.5	3607	253
523	Girl, Interrupted	1999	7.09999999999999964	3605	1099
524	Rounders	1998	7	3598	1062
525	Flatliners	1990	6.09999999999999964	3593	105
526	Bonnie and Clyde	1967	7.90000000000000036	3589	2059
527	Shaft	2000	6.40000000000000036	3579	396
528	Species	1995	5.29999999999999982	3577	146
529	Carrie	1976	7.09999999999999964	3577	31
530	Beverly Hills Cop II	1987	5.59999999999999964	3574	107
531	Short Cuts	1993	7.59999999999999964	3569	155
532	Hot Shots!	1991	6.09999999999999964	3551	189
533	Hollow Man	2000	5.59999999999999964	3540	201
534	Sister Act	1992	5.90000000000000036	3535	662
535	Empire Records	1995	6	3520	1025
536	Congo	1995	4.29999999999999982	3512	614
537	Battlefield Earth	2000	2.29999999999999982	3507	2806
538	Striptease	1996	3.79999999999999982	3506	375
539	Braindead	1992	7.20000000000000018	3505	326
540	Cube	1997	7.29999999999999982	3504	2585
541	Todo sobre mi madre	1999	8.30000000000000071	3501	394
542	Cocoon	1985	6.59999999999999964	3500	21
543	Glengarry Glen Ross	1992	7.59999999999999964	3498	423
544	Perfect Murder, A	1998	6.40000000000000036	3495	291
545	48 Hrs.	1982	6.70000000000000018	3492	143
546	Nightmare on Elm Street, A	1984	6.90000000000000036	3490	133
547	Carlito's Way	1993	7.40000000000000036	3490	31
548	Grand bleu, Le	1988	7.20000000000000018	3490	389
549	Boyz N the Hood	1991	7.70000000000000018	3489	396
550	Sixteen Candles	1984	6.79999999999999982	3484	144
551	Rebecca	1940	8.19999999999999929	3476	11
552	Adventures of Priscilla, Queen of the Desert, The	1994	7.09999999999999964	3474	1138
553	Sabrina	1995	6.20000000000000018	3453	92
554	Home Alone 2: Lost in New York	1992	4.59999999999999964	3447	156
555	Duck Soup	1933	8.40000000000000036	3447	992
556	Room with a View, A	1986	7.5	3441	576
557	Dante's Peak	1997	5.70000000000000018	3439	146
558	Ninth Gate, The	1999	6.5	3435	90
559	Cocktail	1988	5.09999999999999964	3434	146
560	I Still Know What You Did Last Summer	1998	4	3423	1129
561	Easy Rider	1969	7.09999999999999964	3422	125
562	Death Becomes Her	1992	5.40000000000000036	3420	67
563	Three Men and a Baby	1987	5.59999999999999964	3405	193
564	Bean	1997	5.29999999999999982	3396	1864
565	Treasure of the Sierra Madre, The	1948	8.5	3392	312
566	Big Trouble in Little China	1986	6.40000000000000036	3390	23
567	Dick Tracy	1990	5.5	3387	60
568	Wild at Heart	1990	6.79999999999999982	3382	139
569	Barton Fink	1991	7.20000000000000018	3380	111
570	Straight Story, The	1999	8.40000000000000036	3353	139
571	Stir of Echoes	1999	7.20000000000000018	3342	2271
572	Volcano	1997	5.29999999999999982	3334	1118
573	Dead Man	1995	7.40000000000000036	3333	175
574	Adventures of Baron Munchausen, The	1988	6.70000000000000018	3319	59
575	Bull Durham	1988	7.20000000000000018	3311	642
576	Rainmaker, The	1997	6.90000000000000036	3309	28
577	Three Amigos!	1986	5.59999999999999964	3309	62
578	Tron	1982	6.09999999999999964	3306	2575
579	From Russia with Love	1963	7.20000000000000018	3302	388
580	C'era una volta il West	1969	8.5	3297	268
581	Driving Miss Daisy	1989	7.29999999999999982	3288	685
582	Double Indemnity	1944	8.5	3283	79
583	Papillon	1973	7.59999999999999964	3281	405
584	Big Sleep, The	1946	8.19999999999999929	3274	197
585	Never Been Kissed	1999	6.09999999999999964	3271	633
586	Do the Right Thing	1989	7.59999999999999964	3268	206
587	Tremors	1990	6.79999999999999982	3258	415
588	Pelican Brief, The	1993	6.20000000000000018	3251	275
589	Modern Times	1936	8.40000000000000036	3249	145
590	Under Siege	1992	6.20000000000000018	3247	291
591	Hudson Hawk	1991	4.90000000000000036	3244	371
592	Crash	1996	5.5	3241	97
593	Scrooged	1988	6.29999999999999982	3239	209
594	Escape from New York	1981	6.70000000000000018	3238	23
595	Four Rooms	1995	5.70000000000000018	3232	2163
596	Fletch	1985	6.40000000000000036	3231	418
597	Reality Bites	1994	6.09999999999999964	3226	242
598	G.I. Jane	1997	5.59999999999999964	3226	110
599	Midnight in the Garden of Good and Evil	1997	6.29999999999999982	3226	2
600	Primary Colors	1998	6.90000000000000036	3225	47
601	Blood Simple	1984	7.70000000000000018	3223	111
602	Dawn of the Dead	1978	7.5	3220	379
603	Edtv	1999	6.59999999999999964	3215	21
604	Siege, The	1998	5.90000000000000036	3211	382
605	Shanghai Noon	2000	7.20000000000000018	3207	2633
606	First Blood	1982	6.5	3207	954
607	Rocky IV	1985	4.79999999999999982	3200	5
608	Honey, I Shrunk the Kids	1989	5.79999999999999982	3198	424
609	Father of the Bride	1991	6.29999999999999982	3178	397
610	Vampires	1998	5.59999999999999964	3178	23
611	Weird Science	1985	6	3175	144
612	Risky Business	1983	6.70000000000000018	3164	2556
613	Moonraker	1979	5.79999999999999982	3161	390
614	Anaconda	1997	4.20000000000000018	3160	1053
615	Billy Madison	1995	6	3154	1055
616	Beautiful Girls	1996	7.09999999999999964	3150	1048
617	Urban Legend	1998	5.09999999999999964	3150	2430
618	Client, The	1994	6.40000000000000036	3145	105
619	Copycat	1995	6.5	3142	669
620	U Turn	1997	6.40000000000000036	3137	69
621	Christmas Vacation	1989	6.59999999999999964	3137	412
622	Arachnophobia	1990	6.09999999999999964	3134	614
623	Fatal Attraction	1987	6.59999999999999964	3132	283
624	Tommy Boy	1995	6.20000000000000018	3130	384
625	Roxanne	1987	6.90000000000000036	3128	272
626	Dirty Harry	1971	7.40000000000000036	3126	346
627	Peacemaker, The	1997	5.79999999999999982	3120	589
628	Road Trip	2000	6.79999999999999982	3115	2619
629	Pump Up the Volume	1990	6.59999999999999964	3114	1025
630	Days of Thunder	1990	5.20000000000000018	3114	107
631	Robin Hood: Men in Tights	1993	5.29999999999999982	3093	29
632	Fallen	1998	6.59999999999999964	3088	630
633	Top Secret!	1984	6.59999999999999964	3079	189
634	Civil Action, A	1998	6.40000000000000036	3077	1043
635	Postman, The	1997	5.29999999999999982	3076	10
636	2010	1984	6.40000000000000036	3071	103
637	Color of Money, The	1986	6.70000000000000018	3068	78
638	River Runs Through It, A	1992	7	3066	36
639	Can't Hardly Wait	1998	6.29999999999999982	3058	2168
640	Dirty Rotten Scoundrels	1988	6.70000000000000018	3057	123
641	Mighty Aphrodite	1995	7	3054	1
642	Deconstructing Harry	1997	7.09999999999999964	3049	1
643	First Knight	1995	5.59999999999999964	3045	1116
644	Searchers, The	1956	8.30000000000000071	3042	287
645	Great Expectations	1998	6.20000000000000018	3032	2226
646	Notorious	1946	8.19999999999999929	3030	11
647	Seven Years in Tibet	1997	6.5	3023	1131
648	Mississippi Burning	1988	7.40000000000000036	3021	68
649	Replacement Killers, The	1998	5.79999999999999982	3021	2091
650	Naked Gun 33 1/3: The Final Insult	1994	5.70000000000000018	3021	384
651	Bridges of Madison County, The	1995	6.70000000000000018	3020	2
652	Natural, The	1984	7.20000000000000018	3016	38
653	Casper	1995	5.70000000000000018	3011	1139
654	War of the Roses, The	1989	6.29999999999999982	3011	24
655	Night of the Living Dead	1968	7.5	3010	379
656	Wayne's World 2	1993	5.40000000000000036	3006	2842
657	Absolute Power	1997	6.40000000000000036	3006	2
658	French Kiss	1995	6.29999999999999982	3005	87
659	Bambi	1942	7.59999999999999964	3005	1117
660	Rashomon	1950	8.59999999999999964	3004	208
661	Innerspace	1987	6.29999999999999982	3002	150
662	Devil's Own, The	1997	5.79999999999999982	2999	275
663	Howard the Duck	1986	3.70000000000000018	2990	2779
664	Mononoke Hime	1997	8.5	2989	1051
665	French Connection, The	1971	7.59999999999999964	2986	264
666	Far and Away	1992	6.29999999999999982	2986	21
667	Bringing Up Baby	1938	8.30000000000000071	2983	197
668	Network	1976	7.90000000000000036	2982	80
669	Vacation	1983	6.79999999999999982	2979	108
670	Parenthood	1989	7	2979	21
671	Forbidden Planet	1956	7.5	2967	2217
672	Himmel &#252;ber Berlin, Der	1987	8	2966	269
673	Mortal Kombat	1995	5	2966	653
674	Executive Decision	1996	6.5	2966	1064
675	Police Academy	1984	5.5	2965	377
676	Commando	1985	5.59999999999999964	2964	1073
677	Ghost Dog: The Way of the Samurai	1999	7.79999999999999982	2959	175
678	Romy and Michele's High School Reunion	1997	6	2953	2445
679	What About Bob?	1991	6.40000000000000036	2951	123
680	Perfect World, A	1993	6.79999999999999982	2943	2
681	Dial M for Murder	1954	7.59999999999999964	2942	11
682	'Crocodile' Dundee II	1988	5	2942	2252
683	Strangers on a Train	1951	8.30000000000000071	2937	11
684	Angel Heart	1987	6.90000000000000036	2937	68
685	Emma	1996	6.90000000000000036	2936	2194
686	Die xue shuang xiong	1989	8.19999999999999929	2935	204
687	Plan 9 from Outer Space	1958	3.29999999999999982	2931	2038
688	To Die for	1995	6.70000000000000018	2925	271
689	Fucking &#197;m&#229;l	1998	8.19999999999999929	2919	2803
690	Roman Holiday	1953	8	2918	620
691	Predator 2	1990	5.40000000000000036	2909	672
692	Bill & Ted's Bogus Journey	1991	5.40000000000000036	2908	2793
693	Before Sunrise	1995	7.20000000000000018	2906	205
694	Streetcar Named Desire, A	1951	8.19999999999999929	2904	655
695	Real Genius	1985	6.70000000000000018	2890	1141
696	Halloween H20: 20 Years Later	1998	5.29999999999999982	2884	365
697	Producers, The	1968	7.70000000000000018	2884	29
698	Escape from L.A.	1996	4.70000000000000018	2882	23
699	Tin Cup	1996	6.29999999999999982	2879	642
700	Conversation, The	1974	8.09999999999999964	2876	28
701	Everyone Says I Love You	1996	6.90000000000000036	2867	1
702	American Werewolf in London, An	1981	7.09999999999999964	2865	62
703	Rambo: First Blood Part II	1985	4.79999999999999982	2863	631
704	Rosemary's Baby	1968	7.70000000000000018	2856	90
705	Hannah and Her Sisters	1986	7.70000000000000018	2851	1
706	O Brother, Where Art Thou?	2000	8	2849	111
707	Apartment, The	1960	8.30000000000000071	2846	79
708	Rosencrantz and Guildenstern Are Dead	1990	7.09999999999999964	2844	2675
709	Sex, Lies, and Videotape	1989	6.90000000000000036	2841	689
710	Summer of Sam	1999	6.5	2837	206
711	Spawn	1997	4.59999999999999964	2836	2614
712	Breakdown	1997	6.70000000000000018	2828	1120
713	Chariots of Fire	1981	7.20000000000000018	2826	1063
714	Addams Family Values	1993	6.09999999999999964	2825	422
715	Great Dictator, The	1940	8.30000000000000071	2819	145
716	Commitments, The	1991	7.29999999999999982	2818	68
717	Pee-wee's Big Adventure	1985	6.5	2803	148
718	Muriel's Wedding	1994	7	2803	1169
719	Muppet Movie, The	1979	7.20000000000000018	2801	2462
720	Varsity Blues	1999	6.09999999999999964	2801	2453
721	Once Were Warriors	1994	7.79999999999999982	2799	624
722	Saturday Night Fever	1977	6.40000000000000036	2796	66
723	View to a Kill, A	1985	5.79999999999999982	2790	668
724	Crimes and Misdemeanors	1989	7.90000000000000036	2781	1
725	Barry Lyndon	1975	7.70000000000000018	2772	82
726	For Your Eyes Only	1981	6.70000000000000018	2771	668
727	House on Haunted Hill	1999	5.29999999999999982	2767	2763
728	UHF	1989	6.5	2755	2267
729	Octopussy	1983	6.20000000000000018	2755	668
730	Horse Whisperer, The	1998	6.5	2753	36
731	Big Chill, The	1983	7.20000000000000018	2753	87
732	Transformers: The Movie, The	1986	6.40000000000000036	2746	2684
733	Bronx Tale, A	1993	7.5	2730	3
734	Quiet Man, The	1952	8.09999999999999964	2729	287
735	Stripes	1981	6.79999999999999982	2724	109
736	Rocky III	1982	5.29999999999999982	2708	5
737	Blast from the Past	1999	6.79999999999999982	2695	377
738	Spice World	1997	3	2694	2461
739	Hot Shots! Part Deux	1993	5.5	2685	189
740	Flintstones, The	1994	4.40000000000000036	2685	395
741	First Wives Club, The	1996	5.5	2680	377
742	Young Guns	1988	6.29999999999999982	2673	2305
743	Practical Magic	1998	5.40000000000000036	2668	332
744	Romeo Must Die	2000	6	2667	2023
745	My Own Private Idaho	1991	6.5	2662	271
746	Psycho	1998	5.40000000000000036	2661	271
747	Diamonds Are Forever	1971	6.59999999999999964	2659	636
748	One Fine Day	1996	6.20000000000000018	2659	401
749	Nell	1994	6.29999999999999982	2649	199
750	Officer and a Gentleman, An	1982	6.70000000000000018	2634	674
751	White Men Can't Jump	1992	6.20000000000000018	2634	642
752	Big Hit, The	1998	5.79999999999999982	2632	2167
753	Big Night	1996	7.40000000000000036	2629	1260
754	Cyrano de Bergerac	1990	7.59999999999999964	2629	2233
755	So I Married an Axe Murderer	1993	6.20000000000000018	2629	2745
756	Stepmom	1998	6.29999999999999982	2615	156
757	Cook the Thief His Wife & Her Lover, The	1989	6.90000000000000036	2615	386
758	Dancer in the Dark	2000	8.30000000000000071	2614	615
759	Space Jam	1996	5.20000000000000018	2614	2351
760	Out of Africa	1985	6.70000000000000018	2612	92
761	Rob Roy	1995	6.79999999999999982	2612	374
762	Rocky II	1979	5.90000000000000036	2610	5
763	Quick and the Dead, The	1995	5.90000000000000036	2607	141
764	Regarding Henry	1991	6.5	2603	47
765	Airplane II: The Sequel	1982	5.5	2600	2054
766	Cabaret	1972	7.70000000000000018	2588	1124
767	Bullets Over Broadway	1994	7.59999999999999964	2585	1
768	Beautiful Thing	1996	7.20000000000000018	2585	2084
769	Space Cowboys	2000	7	2583	2
770	Moonstruck	1987	7.09999999999999964	2581	81
771	Never Say Never Again	1983	6.09999999999999964	2579	651
772	Strange Brew	1983	6.40000000000000036	2571	147
773	Doc Hollywood	1991	5.79999999999999982	2564	374
774	Gallipoli	1981	7.70000000000000018	2563	86
775	Disclosure	1994	6	2563	38
776	Spies Like Us	1985	5.59999999999999964	2562	62
777	Sjunde inseglet, Det	1957	8.40000000000000036	2559	420
778	Grapes of Wrath, The	1940	8.30000000000000071	2552	287
779	Indecent Proposal	1993	5.09999999999999964	2552	283
780	Singles	1992	6.5	2548	391
781	Hoosiers	1986	7.40000000000000036	2545	1133
782	Adventures of Buckaroo Banzai Across the 8th Dimension, The	1984	6	2543	2558
783	Frantic	1988	6.5	2543	90
784	Sliver	1993	4.5	2542	212
785	Hustler, The	1961	8.19999999999999929	2541	2605
786	Howards End	1992	7.40000000000000036	2540	576
787	Spy Who Loved Me, The	1977	6.90000000000000036	2534	390
788	Mimic	1997	5.59999999999999964	2534	2178
789	Tango & Cash	1989	5.20000000000000018	2528	1049
790	Night on Earth	1991	7.20000000000000018	2527	175
791	Enter the Dragon	1973	7.20000000000000018	2523	2706
792	Short Circuit	1986	5.79999999999999982	2522	66
793	Gremlins 2: The New Batch	1990	5.59999999999999964	2520	150
794	Mission, The	1986	7.20000000000000018	2516	1170
795	Violon rouge, Le	1998	8	2516	2184
796	Fiddler on the Roof	1971	7.40000000000000036	2513	81
797	Nine 1/2 Weeks	1986	5.20000000000000018	2509	283
798	Strictly Ballroom	1992	7.20000000000000018	2506	1069
799	Harvey	1950	8	2505	2029
800	54	1998	5.29999999999999982	2504	2592
801	You Only Live Twice	1967	6.79999999999999982	2503	390
802	Wolf	1994	5.79999999999999982	2485	47
803	Unbearable Lightness of Being, The	1988	7.20000000000000018	2485	288
804	Dark Crystal, The	1982	6.79999999999999982	2478	952
805	Mystery Science Theater 3000: The Movie	1996	7	2473	1469
806	Rambo III	1988	3.70000000000000018	2468	2804
807	Twin Peaks: Fire Walk with Me	1992	6.09999999999999964	2466	139
808	Small Soldiers	1998	6	2463	150
809	Titan A.E.	2000	6.79999999999999982	2455	409
810	Thunderball	1965	6.79999999999999982	2454	388
811	World According to Garp, The	1982	7	2454	276
812	Outlaw Josey Wales, The	1976	7.59999999999999964	2447	2
813	Dragnet	1987	5.5	2441	2670
814	Superman III	1983	4.29999999999999982	2439	274
815	Friday	1995	6.70000000000000018	2435	1035
816	Forces of Nature	1999	5.70000000000000018	2427	2262
817	One Hundred and One Dalmatians	1961	7.20000000000000018	2423	266
818	Silverado	1985	7	2422	87
819	Thirteenth Floor, The	1999	6.5	2422	2388
820	Paris, Texas	1984	7.40000000000000036	2415	269
821	Rocketeer, The	1991	5.79999999999999982	2415	424
822	Buffy the Vampire Slayer	1992	5.40000000000000036	2414	2181
823	On Her Majesty's Secret Service	1969	6.59999999999999964	2413	2809
824	Repo Man	1984	6.70000000000000018	2401	1041
825	Addicted to Love	1997	6.20000000000000018	2399	332
826	8 1/2	1963	8	2397	399
827	Who's Afraid of Virginia Woolf?	1966	8.19999999999999929	2395	47
828	Daylight	1996	5.40000000000000036	2393	376
829	Rope	1948	7.70000000000000018	2389	11
830	Zero Effect	1998	7.29999999999999982	2387	1927
831	Wonder Boys	2000	7.70000000000000018	2386	607
832	Buffalo '66	1998	7.20000000000000018	2385	819
833	Gods Must Be Crazy, The	1980	6.90000000000000036	2385	1955
834	Midnight Express	1978	7.40000000000000036	2384	68
835	Throw Momma from the Train	1987	5.79999999999999982	2381	24
836	Welcome to the Dollhouse	1995	7.5	2376	1121
837	Ordinary People	1980	7.70000000000000018	2372	36
838	Doctor Dolittle	1998	5.40000000000000036	2365	425
839	Apt Pupil	1998	6.5	2363	639
840	Outsiders, The	1983	6.79999999999999982	2363	28
841	Deuce Bigalow: Male Gigolo	1999	5.5	2359	2620
842	'burbs, The	1989	5.5	2354	150
843	Pretty in Pink	1986	6.20000000000000018	2349	285
844	Peggy Sue Got Married	1986	6.29999999999999982	2336	28
845	Revenge of the Nerds	1984	5.90000000000000036	2335	2257
846	How the Grinch Stole Christmas	2000	6.59999999999999964	2333	21
847	Texas Chain Saw Massacre, The	1974	6.70000000000000018	2333	1123
848	City Lights	1931	8.59999999999999964	2325	145
849	Money Pit, The	1986	5.29999999999999982	2319	320
850	Relic, The	1997	5.20000000000000018	2318	103
851	No Way Out	1987	7	2314	146
852	Golden Child, The	1986	5.20000000000000018	2313	418
853	Exotica	1994	7.09999999999999964	2311	665
854	Heavy Metal	1981	6.20000000000000018	2311	2156
855	Darkman	1990	5.90000000000000036	2310	141
856	Age of Innocence, The	1993	7	2299	78
857	Charade	1963	8	2298	428
858	Desperately Seeking Susan	1985	5.59999999999999964	2297	2615
859	Brassed Off	1996	7.09999999999999964	2297	2596
860	Adventures in Babysitting	1987	6.29999999999999982	2293	156
861	Benny & Joon	1993	6.59999999999999964	2292	412
862	Cool Runnings	1993	6.20000000000000018	2291	411
863	Superman IV: The Quest for Peace	1987	3.10000000000000009	2289	2838
864	Starman	1984	6.70000000000000018	2288	23
865	Presumed Innocent	1990	6.90000000000000036	2279	275
866	Pushing Tin	1999	6	2278	585
867	Robocop 2	1990	4.29999999999999982	2277	651
868	European Vacation	1985	5	2272	403
869	Don Juan DeMarco	1995	6.5	2267	2356
870	Green Card	1990	5.90000000000000036	2263	86
871	Hard Rain	1998	5.5	2260	2631
872	Roger & Me	1989	7.70000000000000018	2259	955
873	Eraserhead	1977	6.59999999999999964	2258	139
874	Terms of Endearment	1983	7.20000000000000018	2256	574
875	George of the Jungle	1997	5.70000000000000018	2253	1075
876	39 Steps, The	1935	8	2250	11
877	Broadcast News	1987	7	2243	574
878	Underground	1995	7.79999999999999982	2242	663
879	Miracle on 34th Street	1947	7.90000000000000036	2237	1061
880	Rising Sun	1993	6	2237	288
881	Frankenstein	1994	5.90000000000000036	2233	48
882	Steel Magnolias	1989	6.70000000000000018	2231	200
883	Hard Day's Night, A	1964	7.59999999999999964	2228	274
884	St. Elmo's Fire	1985	5.79999999999999982	2222	105
885	1941	1979	5.5	2222	18
886	Grumpy Old Men	1993	6.5	2222	599
887	Flash Gordon	1980	5.59999999999999964	2222	2628
888	Hoop Dreams	1994	7.79999999999999982	2220	2571
889	Trzy kolory: Bialy	1994	7.70000000000000018	2213	398
890	Red Dawn	1984	5.59999999999999964	2213	693
891	Random Hearts	1999	4.79999999999999982	2212	92
892	Shadowlands	1993	7.20000000000000018	2204	235
893	After Hours	1985	7.29999999999999982	2199	78
894	Dangerous Minds	1995	5.70000000000000018	2198	2448
895	Up in Smoke	1978	6.20000000000000018	2198	2819
896	Dirty Dozen, The	1967	7.5	2191	1060
897	Specialist, The	1994	4.59999999999999964	2191	1053
898	2 Days in the Valley	1996	6.40000000000000036	2189	1700
899	Three Musketeers, The	1993	5.90000000000000036	2188	149
900	Slap Shot	1977	7	2184	276
901	Fierce Creatures	1997	6.09999999999999964	2182	272
902	Toys	1992	4.5	2179	38
903	Assassins	1995	5.70000000000000018	2173	209
904	Footloose	1984	5.79999999999999982	2167	200
905	Wallace & Gromit: A Grand Day Out	1992	7.70000000000000018	2167	572
906	Uncle Buck	1989	6.09999999999999964	2163	144
907	Shane	1953	7.79999999999999982	2161	1022
908	Nine Months	1995	5.20000000000000018	2153	156
909	Blue Streak	1999	6.09999999999999964	2153	632
910	My Left Foot	1989	7.40000000000000036	2152	581
911	Omen, The	1976	7.09999999999999964	2151	209
912	Anna and the King	1999	7	2150	654
913	Nine to Five	1980	6.20000000000000018	2148	1110
914	Hellraiser	1987	6.29999999999999982	2144	2327
915	Gettysburg	1993	7.40000000000000036	2144	2761
916	Hand That Rocks the Cradle, The	1992	6.20000000000000018	2138	607
917	Three Days of the Condor	1975	7.29999999999999982	2137	92
918	Pocahontas	1995	5.59999999999999964	2130	2630
919	Timecop	1994	5.59999999999999964	2121	103
920	Rio Bravo	1959	8	2119	197
921	Sleeper	1973	7.29999999999999982	2113	1
922	Gold Rush, The	1925	8.30000000000000071	2113	145
923	Body Heat	1981	7.29999999999999982	2112	87
924	Adventures of Robin Hood, The	1938	8.09999999999999964	2111	675
925	Conan the Destroyer	1984	5.20000000000000018	2104	402
926	Bicentennial Man	1999	6.5	2103	156
927	Waiting for Guffman	1996	7.59999999999999964	2097	352
928	Basketball Diaries, The	1995	6.59999999999999964	2092	2634
929	Michael Collins	1996	6.90000000000000036	2092	153
930	Bob Roberts	1992	7.09999999999999964	2084	25
931	Swimming with Sharks	1994	7.20000000000000018	2072	2127
932	Yellow Submarine	1968	6.90000000000000036	2069	2109
933	Turner & Hooch	1989	5.29999999999999982	2057	407
934	Nixon	1995	7	2055	69
935	Porky's	1981	5.09999999999999964	2051	579
936	Coyote Ugly	2000	5.90000000000000036	2051	2478
937	Edge, The	1997	6.90000000000000036	2050	624
938	Double vie de V&#233;ronique, La	1991	7.29999999999999982	2050	398
939	Always	1989	6.20000000000000018	2050	18
940	Boiler Room	2000	7	2049	2419
941	Stuart Little	1999	6.29999999999999982	2045	2623
942	Things to Do in Denver When You're Dead	1995	6.59999999999999964	2045	2114
943	Rudy	1993	6.90000000000000036	2037	1133
944	Some Kind of Wonderful	1987	6.5	2036	285
945	Poseidon Adventure, The	1972	6.59999999999999964	2035	2759
946	History of the World: Part I	1981	6.20000000000000018	2034	29
947	Forever Young	1992	6.09999999999999964	2034	365
948	To Catch a Thief	1955	7.5	2032	11
949	Police Academy 4: Citizens on Patrol	1987	3.10000000000000009	2028	2317
950	Night of the Hunter, The	1955	8.40000000000000036	2027	1183
951	Bad Taste	1987	6.70000000000000018	2026	326
952	His Girl Friday	1940	8.30000000000000071	2023	197
953	Rules of Engagement	2000	6.5	2020	264
954	I.Q.	1994	6.09999999999999964	2019	272
955	Police Academy 5: Assignment: Miami Beach	1988	2.5	2014	2122
956	Alive	1993	6.5	2011	614
957	Sabrina	1954	7.59999999999999964	2011	79
958	Best Years of Our Lives, The	1946	8.5	2010	620
959	Mickey Blue Eyes	1999	5.90000000000000036	2003	2080
960	All Quiet on the Western Front	1930	8.40000000000000036	2002	2138
961	Now and Then	1995	6	1999	2151
962	Snatch	2000	8.09999999999999964	1996	2205
963	Accidental Tourist, The	1988	6.70000000000000018	1995	87
964	For Love of the Game	1999	6.59999999999999964	1990	141
965	Drugstore Cowboy	1989	7.5	1988	271
966	Night at the Opera, A	1935	8.19999999999999929	1983	2532
967	Ruthless People	1986	6.79999999999999982	1981	189
968	Barbarella	1968	5.40000000000000036	1980	2752
969	Grifters, The	1990	7.20000000000000018	1978	292
970	Tequila Sunrise	1988	5.79999999999999982	1976	2582
971	Pink Panther, The	1963	7.20000000000000018	1973	65
972	Brady Bunch Movie, The	1995	5.59999999999999964	1972	425
973	Chain Reaction	1996	5.09999999999999964	1971	291
974	Yojimbo	1961	8.59999999999999964	1961	208
975	In the Heat of the Night	1967	7.90000000000000036	1961	81
976	Billy Elliot	2000	8.30000000000000071	1960	2784
977	Powder	1995	5.90000000000000036	1958	2540
978	Virgin Suicides, The	1999	7.40000000000000036	1957	1471
979	F/X	1986	6.59999999999999964	1952	1007
980	Mosquito Coast, The	1986	6.40000000000000036	1949	86
981	Hong faan kui	1995	6.59999999999999964	1949	667
982	Stalag 17	1953	8.30000000000000071	1941	79
983	Nosferatu, eine Symphonie des Grauens	1922	8.19999999999999929	1941	2035
984	Drop Dead Gorgeous	1999	6.40000000000000036	1941	2676
985	Of Mice and Men	1992	7.59999999999999964	1940	255
986	Multiplicity	1996	5.70000000000000018	1939	108
987	Object of My Affection, The	1998	6.09999999999999964	1939	1149
988	Suicide Kings	1997	6.90000000000000036	1937	2810
989	Towering Inferno, The	1974	6.20000000000000018	1937	2018
990	Purple Rose of Cairo, The	1985	7.5	1937	1
991	Arthur	1981	6.5	1932	2847
992	Hope Floats	1998	5.40000000000000036	1927	157
993	General, The	1927	8.69999999999999929	1926	2343
994	Somewhere in Time	1980	6.70000000000000018	1923	600
995	Rocky V	1990	3.70000000000000018	1923	683
996	Eye of the Beholder	1999	4.20000000000000018	1921	1138
997	Cinderella	1950	7.5	1911	266
998	Under Siege 2: Dark Territory	1995	4.90000000000000036	1909	627
999	Point of No Return	1993	5.70000000000000018	1908	66
1000	Haunting, The	1963	7.70000000000000018	1907	286
1001	Ideal Husband, An	1999	7.29999999999999982	1904	1930
1002	Grand Canyon	1991	6.79999999999999982	1903	87
1003	Barb Wire	1996	3.29999999999999982	1900	2264
1004	Dead Zone, The	1983	7.09999999999999964	1898	97
1005	Accused, The	1988	7.09999999999999964	1886	580
1006	Cookie's Fortune	1999	7.29999999999999982	1885	155
1007	Ref, The	1994	6.79999999999999982	1883	1048
1008	Blues Brothers 2000	1998	4.20000000000000018	1880	62
1009	Red Heat	1988	5.29999999999999982	1878	143
1010	Pet Sematary	1989	5.40000000000000036	1876	2701
1011	Fearless	1993	7.09999999999999964	1872	86
1012	Fabulous Baker Boys, The	1989	6.59999999999999964	1872	2577
1013	Apostle, The	1997	7.20000000000000018	1870	44
1014	Dead Calm	1989	6.90000000000000036	1864	212
1015	Naked Lunch	1991	6.29999999999999982	1863	97
1016	Anastasia	1997	6.59999999999999964	1860	409
1017	Soldier	1998	5.29999999999999982	1858	653
1018	Popeye	1980	4.70000000000000018	1857	155
1019	Arrival, The	1996	6	1855	1071
1020	Withnail and I	1987	6.90000000000000036	1852	1028
1021	Twilight Zone: The Movie	1983	6	1848	150
1022	Police Academy 2: Their First Assignment	1985	4	1848	967
1023	Breaking Away	1979	7.70000000000000018	1846	994
1024	Grease 2	1982	3.29999999999999982	1846	2601
1025	Fools Rush In	1997	5.90000000000000036	1840	654
1026	Nothing to Lose	1997	6.70000000000000018	1836	948
1027	True Crime	1999	6.29999999999999982	1833	2
1028	Flashdance	1983	5.40000000000000036	1830	283
1029	Smokey and the Bandit	1977	6	1822	618
1030	Celebrity	1998	6.20000000000000018	1820	1
1031	Stop! Or My Mom Will Shoot	1992	3	1817	407
1032	Wing Commander	1999	3.70000000000000018	1811	2352
1033	Street Fighter	1994	3.10000000000000009	1809	2581
1034	Black Rain	1989	6.20000000000000018	1809	110
1035	Midsummer Night's Dream, A	1999	6.5	1809	401
1036	Christine	1983	5.90000000000000036	1806	23
1037	Sea of Love	1989	6.59999999999999964	1806	616
1038	C'est arriv&#233; pr&#232;s de chez vous	1992	7.40000000000000036	1806	2783
1039	Prizzi's Honor	1985	7	1803	312
1040	Mortal Kombat: Annihilation	1997	3	1802	2424
1041	Serial Mom	1994	6.20000000000000018	1801	364
1042	Zulu	1964	7.59999999999999964	1797	2341
1043	Bachelor Party	1984	5.5	1796	2715
1044	From Here to Eternity	1953	8	1794	617
1045	Playing by Heart	1998	7.40000000000000036	1793	2777
1046	Freeway	1996	6.70000000000000018	1787	2699
1047	Hamlet	1990	6.90000000000000036	1784	1058
1048	Murder in the First	1995	6.90000000000000036	1782	2570
1049	Dead Men Don't Wear Plaid	1982	6.40000000000000036	1781	221
1050	Bird on a Wire	1990	5.09999999999999964	1781	66
1051	Deep Rising	1998	5.29999999999999982	1780	1103
1052	Disturbing Behavior	1998	5.09999999999999964	1779	2447
1053	Dolores Claiborne	1995	7.20000000000000018	1779	674
1054	Fan, The	1996	5.40000000000000036	1779	107
1055	Simon Birch	1998	7.09999999999999964	1775	2512
1056	Adventures of Ford Fairlane, The	1990	4.70000000000000018	1774	210
1057	Reindeer Games	2000	5.59999999999999964	1772	676
1058	Mis&#233;rables, Les	1998	7.09999999999999964	1768	584
1059	Haine, La	1995	7.59999999999999964	1766	1923
1060	Unendliche Geschichte, Die	1984	6.90000000000000036	1764	140
1061	Where Eagles Dare	1969	7.29999999999999982	1763	2432
1062	On Golden Pond	1981	7.20000000000000018	1759	2518
1063	Down by Law	1986	7.40000000000000036	1758	175
1064	Frankenstein	1931	7.90000000000000036	1755	1097
1065	Red Rock West	1992	7	1752	1062
1066	Naked	1993	7.40000000000000036	1752	583
1067	Friday the 13th	1980	5.5	1749	2509
1068	BASEketball	1998	6	1747	573
1069	Cannonball Run, The	1981	5.09999999999999964	1747	618
1070	Police Academy 6: City Under Siege	1989	2.5	1739	2754
1071	Astronaut's Wife, The	1999	4.59999999999999964	1736	2868
1072	Sleeping Beauty	1959	7.40000000000000036	1735	266
1073	Zelig	1983	7.40000000000000036	1732	1
1074	Andromeda Strain, The	1971	6.90000000000000036	1731	286
1075	Overboard	1987	6	1726	129
1076	Caine Mutiny, The	1954	8	1722	2027
1077	Hero	1992	6.09999999999999964	1719	292
1078	Bottle Rocket	1996	7.29999999999999982	1717	1034
1079	Spy Hard	1996	4.5	1716	2729
1080	Dark Star	1973	6.59999999999999964	1716	23
1081	Odd Couple, The	1968	7.5	1714	1267
1082	Music Man, The	1962	7.5	1714	1137
1083	Cobra	1986	4	1712	631
1084	Dinosaur	2000	6.5	1710	2090
1085	Virus	1999	3.89999999999999991	1709	1174
1086	My Stepmother Is an Alien	1988	4.70000000000000018	1708	320
1087	Hair	1979	6.59999999999999964	1708	408
1088	Secret of My Succe$s, The	1987	6	1705	200
1089	Return to Me	2000	7.29999999999999982	1705	307
1090	Crow: City of Angels, The	1996	3.70000000000000018	1704	2727
1091	Threesome	1994	6	1704	657
1092	End of the Affair, The	1999	7.40000000000000036	1703	153
1093	Willow	1988	6.59999999999999964	1703	21
1094	Shall We Dansu?	1996	7.90000000000000036	1701	2712
1095	Nurse Betty	2000	7.29999999999999982	1700	593
1096	*batteries not included	1987	5.5	1696	2693
1097	Enemy Mine	1985	6.20000000000000018	1695	140
1098	Per un pugno di dollari	1964	7.5	1694	268
1099	Bullitt	1968	7.40000000000000036	1693	994
1100	Sleeping with the Enemy	1991	5.70000000000000018	1692	410
1101	Beaches	1988	5.90000000000000036	1691	129
1102	Earth Girls Are Easy	1989	5	1689	2028
1103	Stagecoach	1939	8.09999999999999964	1689	287
1104	Cutting Edge, The	1992	6.40000000000000036	1688	890
1105	Como agua para chocolate	1992	7.20000000000000018	1686	756
1106	Back to School	1986	5.79999999999999982	1684	1010
1107	Blue Lagoon, The	1980	4.29999999999999982	1681	383
1108	In the Mouth of Madness	1995	6.29999999999999982	1681	23
1109	Hercules	1997	6.79999999999999982	1681	1152
1110	Stakeout	1987	6.5	1680	66
1111	Per qualche dollaro in pi&#249;	1965	7.70000000000000018	1680	268
1112	Flirting with Disaster	1996	7.20000000000000018	1674	1070
1113	Fear	1996	5.79999999999999982	1669	423
1114	Nobody's Fool	1994	7.29999999999999982	1664	660
1115	Story of Us, The	1999	5.59999999999999964	1659	37
1116	Pr&#234;t-&#224;-Porter	1994	4.70000000000000018	1652	155
1117	Bugsy	1991	6.59999999999999964	1648	38
1118	Secret of NIMH, The	1982	7.20000000000000018	1646	409
1119	Big Momma's House	2000	4.79999999999999982	1645	633
1120	Sleuth	1972	7.79999999999999982	1645	1111
1121	Everything You Always Wanted to Know About Sex	1972	6.59999999999999964	1643	1
1122	Heaven Can Wait	1978	6.70000000000000018	1641	60
1123	Another 48 Hrs.	1990	4.90000000000000036	1639	143
1124	In the Company of Men	1997	7.29999999999999982	1635	593
1125	Bronenosets Potyomkin	1925	8.40000000000000036	1634	2128
1126	Priest	1994	7	1632	1159
1127	Tank Girl	1995	4.70000000000000018	1632	1032
1128	Six Degrees of Separation	1993	7	1628	272
1129	Walk in the Clouds, A	1995	6.29999999999999982	1625	756
1130	Amarcord	1974	8.19999999999999929	1624	399
1131	Sure Thing, The	1985	6.79999999999999982	1622	37
1132	City Hall	1996	6.09999999999999964	1622	616
1133	Mr. Mom	1983	6.09999999999999964	1620	2829
1134	Quatre cents coups, Les	1959	8.59999999999999964	1619	505
1135	Halloween II	1981	5.29999999999999982	1612	2618
1136	Mouse Hunt	1997	5.79999999999999982	1612	2132
1137	Bad Lieutenant	1992	6.5	1612	2133
1138	Down and Out in Beverly Hills	1986	6	1611	720
1139	American Werewolf in Paris, An	1997	5.09999999999999964	1611	2086
1140	Pillow Book, The	1996	6.59999999999999964	1606	386
1141	Immortal Beloved	1994	7	1599	1150
1142	Velvet Goldmine	1998	6.20000000000000018	1598	2647
1143	Day of the Jackal, The	1973	7.5	1595	617
1144	Dead Ringers	1988	6.79999999999999982	1595	97
1145	Scrooge	1951	8.19999999999999929	1591	2434
1146	Birdy	1984	7.20000000000000018	1587	68
1147	House of Games	1987	7.5	1581	606
1148	Police Academy 3: Back in Training	1986	3.39999999999999991	1579	967
1149	Crucible, The	1996	6.90000000000000036	1579	1149
1150	Smilla's Sense of Snow	1997	6.20000000000000018	1575	584
1151	Ravenous	1999	6.5	1575	1159
1152	Sommersby	1993	5.90000000000000036	1575	669
1153	200 Cigarettes	1999	5.29999999999999982	1573	2664
1154	Diva	1981	7.29999999999999982	1569	1132
1155	Snow Falling on Cedars	1999	7.09999999999999964	1566	1135
1156	Soapdish	1991	6.09999999999999964	1566	401
1157	Skulls, The	2000	5.29999999999999982	1563	376
1158	Police Academy: Mission to Moscow	1994	1.89999999999999991	1563	1010
1159	Cat on a Hot Tin Roof	1958	7.70000000000000018	1561	2606
1160	China Syndrome, The	1979	7.20000000000000018	1560	2389
1161	Biloxi Blues	1988	6.40000000000000036	1558	47
1162	28 Days	2000	6.29999999999999982	1556	425
1163	Beverly Hills Cop III	1994	4.5	1555	62
1164	Dolce vita, La	1960	8	1555	399
1165	Private Benjamin	1980	6	1553	661
1166	Stalker	1979	7.20000000000000018	1551	658
1167	My Girl	1991	6.20000000000000018	1551	661
1168	Mitt liv som hund	1985	7.59999999999999964	1548	387
1169	Sweet and Lowdown	1999	7.29999999999999982	1548	1
1170	Dick	1999	6.59999999999999964	1543	657
1171	Caddyshack II	1988	3.5	1541	2215
1172	Corruptor, The	1999	6	1540	423
1173	Casino Royale	1967	5.20000000000000018	1529	2690
1174	Night at the Roxbury, A	1998	4.79999999999999982	1526	2236
1175	Pay It Forward	2000	7.29999999999999982	1512	589
1176	River Wild, The	1994	6.20000000000000018	1507	607
1177	Greystoke: The Legend of Tarzan, Lord of the Apes	1984	5.90000000000000036	1505	1063
1178	Videodrome	1983	6.59999999999999964	1504	97
1179	Peter Pan	1953	7.29999999999999982	1504	266
1180	Freshman, The	1990	6.59999999999999964	1503	375
1181	Au revoir les enfants	1987	8.09999999999999964	1503	619
1182	Black Hole, The	1979	5.20000000000000018	1499	2117
1183	Pecker	1998	6.70000000000000018	1494	364
1184	Replacements, The	2000	6.59999999999999964	1493	285
1185	Bridge Too Far, A	1977	6.79999999999999982	1487	235
1186	Mujeres al borde de un ataque de nervios	1988	7.70000000000000018	1486	394
1187	Airheads	1994	5.29999999999999982	1484	371
1188	Color of Night	1994	4.79999999999999982	1481	1039
1189	Soylent Green	1973	6.5	1481	402
1190	All of Me	1984	6.79999999999999982	1479	221
1191	Passenger 57	1992	5.40000000000000036	1479	1885
1192	Mystery, Alaska	1999	6.79999999999999982	1477	604
1193	Strada, La	1954	8.30000000000000071	1475	399
1194	Picnic at Hanging Rock	1975	7.59999999999999964	1475	86
1195	Radio Days	1987	7.29999999999999982	1473	1
1196	Year of Living Dangerously, The	1982	7.20000000000000018	1471	86
1197	Species II	1998	3.5	1470	1001
1198	Teaching Mrs. Tingle	1999	5	1469	2212
1199	Universal Soldier	1992	5	1467	290
1200	Fanny och Alexander	1982	8.19999999999999929	1467	420
1201	Richard III	1995	7.70000000000000018	1467	2526
1202	Requiem for a Dream	2000	8.69999999999999929	1466	1136
1203	Babe: Pig in the City	1998	6.90000000000000036	1465	979
1204	Wyatt Earp	1994	6	1460	87
1205	Return to Paradise	1998	6.79999999999999982	1458	410
1206	Affliction	1997	7	1456	652
1207	Smoke Signals	1998	7.29999999999999982	1454	2355
1208	Mister Roberts	1955	7.90000000000000036	1452	287
1209	In Dreams	1998	5.20000000000000018	1451	153
1210	Husbands and Wives	1992	7.5	1449	1
1211	Westworld	1973	6.79999999999999982	1447	1017
1212	Fantasia/2000	1999	7.90000000000000036	1445	1167
1213	Chongqing senlin	1994	7.70000000000000018	1445	1095
1214	Warriors, The	1979	6.90000000000000036	1444	143
1215	Thin Man, The	1934	8.09999999999999964	1444	2564
1216	Remember the Titans	2000	8	1438	2376
1217	Mrs. Brown	1997	7.5	1434	1011
1218	Pinocchio	1940	7.79999999999999982	1429	2224
1219	Coneheads	1993	5	1427	1096
1220	Stealing Beauty	1996	6.29999999999999982	1423	598
1221	Prophecy, The	1995	6.59999999999999964	1420	2105
1222	Inherit the Wind	1960	8	1420	673
1223	Single White Female	1992	6.20000000000000018	1419	1104
1224	Death and the Maiden	1994	7	1414	90
1225	Three to Tango	1999	6.40000000000000036	1412	2279
1226	Badlands	1973	7.79999999999999982	1410	686
1227	Half Baked	1998	5.79999999999999982	1409	1055
1228	Idle Hands	1999	5.5	1407	2797
1229	Candyman	1992	6.09999999999999964	1403	1150
1230	Da hong deng long gao gao gua	1991	8.30000000000000071	1403	2830
1231	Hana-bi	1997	7.90000000000000036	1402	1484
1232	Outland	1981	6.40000000000000036	1402	103
1233	10	1979	5.5	1395	65
1234	Grande illusion, La	1937	8.59999999999999964	1393	2292
1235	Flubber	1997	4.70000000000000018	1393	632
1236	Nineteen Eighty-Four	1984	6.70000000000000018	1390	1154
1237	And Now for Something Completely Different	1971	7.20000000000000018	1388	59
1238	THX 1138	1970	6.40000000000000036	1388	360
1239	Up Close & Personal	1996	5.79999999999999982	1386	691
1240	Hurlyburly	1998	5.70000000000000018	1385	2039
1241	Oliver!	1968	7.29999999999999982	1381	1003
1242	They Live	1988	6.29999999999999982	1378	23
1243	Money Train	1995	5.09999999999999964	1378	410
1244	Small Time Crooks	2000	6.70000000000000018	1378	1
1245	Dumbo	1941	7.5	1377	2245
1246	To Have and Have Not	1944	7.90000000000000036	1374	197
1247	Shadow of a Doubt	1943	8.30000000000000071	1370	11
1248	Witness for the Prosecution	1957	8.30000000000000071	1370	79
1249	Victor/Victoria	1982	7.09999999999999964	1365	65
1250	Trees Lounge	1996	7	1365	186
1251	Swing Kids	1993	6	1365	2743
1252	All That Jazz	1979	7.5	1362	1124
1253	Teenage Mutant Ninja Turtles	1990	5.20000000000000018	1348	1096
1254	Bloodsport	1988	5.79999999999999982	1348	2689
1255	Topsy-Turvy	1999	7.70000000000000018	1346	583
1256	Diabolique	1996	4.90000000000000036	1345	412
1257	101 Dalmatians	1996	5.70000000000000018	1343	149
1258	Mirror Has Two Faces, The	1996	5.59999999999999964	1343	207
1259	Nashville	1975	7.90000000000000036	1340	155
1260	He Got Game	1998	6.79999999999999982	1339	206
1261	Five Easy Pieces	1970	7.40000000000000036	1338	2467
1262	East of Eden	1955	7.79999999999999982	1337	655
1263	She's the One	1996	6.20000000000000018	1334	485
1264	Eight Men Out	1988	7.29999999999999982	1331	931
1265	Solyaris	1972	7.40000000000000036	1330	658
1266	Body Double	1984	6.29999999999999982	1327	31
1267	Spellbound	1945	7.5	1327	11
1268	This Boy's Life	1993	7.09999999999999964	1325	374
1269	Silent Running	1971	6.79999999999999982	1324	1156
1270	About Last Night...	1986	5.79999999999999982	1324	382
1271	Bride of Chucky	1998	5.5	1323	2824
1272	Nick of Time	1995	6.09999999999999964	1323	66
1273	Freaks	1932	7.70000000000000018	1322	2644
1274	Altered States	1980	6.59999999999999964	1321	909
1275	Amazon Women on the Moon	1987	5.5	1317	150
1276	Serpico	1973	7.5	1317	80
1277	Murder at 1600	1997	6	1314	1178
1278	Blown Away	1994	5.70000000000000018	1314	672
1279	Teen Wolf	1985	5	1310	2758
1280	Pok&#233;mon the First Movie: Mewtwo Strikes Back	1999	4	1308	2625
1281	Big Easy, The	1987	6.59999999999999964	1304	2315
1282	Escape from Alcatraz	1979	7	1303	346
1283	At First Sight	1999	6.09999999999999964	1302	1172
1284	Frankie and Johnny	1991	6.5	1302	129
1285	Rumble Fish	1983	6.70000000000000018	1299	28
1286	Wings of the Dove, The	1997	6.90000000000000036	1296	988
1287	Parent Trap, The	1998	6.90000000000000036	1295	2747
1288	Arizona Dream	1993	6.79999999999999982	1285	663
1289	Sister Act 2: Back in the Habit	1993	4.40000000000000036	1285	537
1290	Santa Clause, The	1994	5.90000000000000036	1284	2452
1291	Caligula	1980	4.29999999999999982	1282	2642
1292	Honeymoon in Vegas	1992	6.09999999999999964	1282	375
1293	Affair to Remember, An	1957	7.09999999999999964	1281	992
1294	To Wong Foo, Thanks for Everything, Julie Newmar	1995	5.5	1281	2399
1295	Gorillas in the Mist	1988	6.70000000000000018	1280	199
1296	White Squall	1996	6.59999999999999964	1280	110
1297	Dirty Work	1998	5.70000000000000018	1280	2464
1298	Party, The	1968	7.29999999999999982	1278	65
1299	Smultronst&#228;llet	1957	8.5	1278	420
1300	Virtuosity	1995	5.40000000000000036	1277	2455
1301	Book of Shadows: Blair Witch 2	2000	4.5	1277	1862
1302	Taxi	1998	6.70000000000000018	1276	2204
1303	Crumb	1994	7.79999999999999982	1273	2696
1304	Fly Away Home	1996	7	1270	2239
1305	Orgazmo	1997	5.70000000000000018	1269	270
1306	Cat People	1982	5.79999999999999982	1267	652
1307	Cool World	1992	4	1265	2849
1308	Children of a Lesser God	1986	7	1265	2787
1309	37&#176;2 le matin	1986	6.90000000000000036	1264	1132
1310	Bonfire of the Vanities, The	1990	4.79999999999999982	1262	31
1311	Tampopo	1986	7.79999999999999982	1259	2011
1312	Guns of Navarone, The	1961	7.40000000000000036	1259	1164
1313	Chaplin	1992	6.79999999999999982	1257	235
1314	Hard Target	1993	5.70000000000000018	1256	204
1315	Nutty Professor II: The Klumps	2000	4.70000000000000018	1251	384
1316	Highlander III: The Sorcerer	1994	3.79999999999999982	1249	2017
1317	Eve's Bayou	1997	7.29999999999999982	1247	1232
1318	Bananas	1971	7	1247	1
1319	Where the Heart Is	2000	6.79999999999999982	1245	2688
1320	When We Were Kings	1996	7.79999999999999982	1241	2111
1321	Seven Brides for Seven Brothers	1954	7.20000000000000018	1238	428
1322	Brewster's Millions	1985	5.5	1236	143
1323	Titus	1999	7.79999999999999982	1236	2025
1324	Prince of Tides, The	1991	6.40000000000000036	1232	207
1325	Sophie's Choice	1982	7.59999999999999964	1231	275
1326	T2 3-D: Battle Across Time	1996	7.79999999999999982	1231	1174
1327	Ulee's Gold	1997	7.20000000000000018	1227	2541
1328	East Is East	1999	7.20000000000000018	1226	2337
1329	Hitcher, The	1986	6.79999999999999982	1223	2493
1330	Night to Remember, A	1958	7.70000000000000018	1221	2776
1331	Anywhere But Here	1999	6.29999999999999982	1219	664
1332	Pale Rider	1985	6.79999999999999982	1218	2
1333	Blowup	1966	7.20000000000000018	1214	2587
1334	Mystic Pizza	1988	6	1212	599
1335	Young Guns II	1990	5.70000000000000018	1209	627
1336	Belle de jour	1967	7.70000000000000018	1208	815
1337	Blind Date	1987	5.29999999999999982	1206	65
1338	Fahrenheit 451	1966	7	1206	505
1339	Ba wang bie ji	1993	7.79999999999999982	1206	2001
1340	Vegas Vacation	1997	4.79999999999999982	1204	2775
1341	Best in Show	2000	8	1203	352
1342	When a Man Loves a Woman	1994	6.5	1203	2795
1343	Murder by Death	1976	6.79999999999999982	1202	2588
1344	Straw Dogs	1971	7.20000000000000018	1200	1072
1345	Fail-Safe	1964	7.79999999999999982	1199	80
1346	Spitfire Grill, The	1996	6.70000000000000018	1196	2116
1347	Hilary and Jackie	1998	7.70000000000000018	1196	2186
1348	Henry: Portrait of a Serial Killer	1986	7.20000000000000018	1194	974
1349	Shooting Fish	1997	6.70000000000000018	1190	2833
1350	Crna macka, beli macor	1998	8.09999999999999964	1189	663
1351	Cutthroat Island	1995	5.20000000000000018	1188	210
1352	Father of the Bride Part II	1995	5.5	1188	397
1353	Bis ans Ende der Welt	1991	6.5	1185	269
1354	Shadow, The	1994	5.29999999999999982	1184	577
1355	Sgt. Bilko	1996	5.09999999999999964	1181	262
1356	Nightmare on Elm Street 3: Dream Warriors, A	1987	5.70000000000000018	1177	1122
1357	Reine Margot, La	1994	7.5	1176	2613
1358	RoboCop 3	1993	3.10000000000000009	1175	2311
1359	Dangerous Beauty	1998	7.09999999999999964	1174	2492
1360	Weekend at Bernie's	1989	5.40000000000000036	1173	954
1361	Phantoms	1998	5	1172	1127
1362	Dead Pool, The	1988	5.70000000000000018	1168	2293
1363	Presidio, The	1988	5.70000000000000018	1162	103
1364	Shaft	1971	6.5	1160	2134
1365	Murder on the Orient Express	1974	6.90000000000000036	1158	80
1366	Englishman Who Went Up a Hill But Came Down a Mountain, The	1995	6.5	1155	2323
1367	Diner	1982	7.40000000000000036	1154	38
1368	Your Friends & Neighbors	1998	6.40000000000000036	1153	593
1369	White Christmas	1954	7	1153	675
1370	Tucker: The Man and His Dream	1988	6.79999999999999982	1152	28
1371	Sirens	1994	6	1152	1926
1372	Bring It On	2000	6.5	1152	2808
1373	Secret Garden, The	1993	7.09999999999999964	1150	997
1374	Forget Paris	1995	6.29999999999999982	1150	158
1375	Supernova	2000	3.89999999999999991	1149	143
1376	Mulholland Falls	1996	5.70000000000000018	1148	624
1377	Cradle Will Rock	1999	7.20000000000000018	1147	25
1378	Striking Distance	1993	5.29999999999999982	1145	1090
1379	Anatomy of a Murder	1959	8.19999999999999929	1143	1406
1380	New Nightmare	1994	6.20000000000000018	1142	133
1381	&#192; bout de souffle	1960	8	1141	1689
1382	Doom Generation, The	1995	4.90000000000000036	1141	2152
1383	Extreme Measures	1996	6.09999999999999964	1139	199
1384	Way of the Gun, The	2000	7	1137	2324
1385	Something Wild	1986	6.59999999999999964	1135	281
1386	Romper Stomper	1992	7.09999999999999964	1133	2101
1387	Angela's Ashes	1999	7	1131	68
1388	Don't Tell Mom the Babysitter's Dead	1991	5.09999999999999964	1127	149
1389	Halloween III: Season of the Witch	1982	3.39999999999999991	1126	2680
1390	Red Sonja	1985	4.09999999999999964	1124	402
1391	Gingerbread Man, The	1998	5.90000000000000036	1123	155
1392	Mumford	1999	7.20000000000000018	1121	87
1393	Encino Man	1992	4.79999999999999982	1120	632
1394	Casualties of War	1989	6.59999999999999964	1119	31
1395	Giant	1956	7.59999999999999964	1116	1022
1396	Three Musketeers, The	1973	7.40000000000000036	1116	274
1397	Seventh Sign, The	1988	5.79999999999999982	1115	2232
1398	Auntie Mame	1958	7.5	1113	1137
1399	Short Circuit 2	1988	4.29999999999999982	1110	2006
1400	Muse, The	1999	5.79999999999999982	1110	247
1401	Phantom, The	1996	5.09999999999999964	1107	1115
1402	Enfants du paradis, Les	1945	8.40000000000000036	1106	2573
1403	Other Sister, The	1999	6.29999999999999982	1104	129
1404	Pacific Heights	1990	6.20000000000000018	1102	677
1405	Walkabout	1971	7.5	1101	1076
1406	Aguirre, der Zorn Gottes	1972	8.09999999999999964	1101	1886
1407	Nothing But Trouble	1991	3.39999999999999991	1100	15
1408	Bitter Moon	1992	6.70000000000000018	1100	90
1409	Grumpier Old Men	1995	6.29999999999999982	1100	285
1410	House of the Spirits, The	1993	6	1099	584
1411	Time Machine, The	1960	7.29999999999999982	1097	2149
1412	Catch-22	1970	6.90000000000000036	1094	47
1413	Hanging Up	2000	4.5	1093	94
1414	Can't Buy Me Love	1987	6.09999999999999964	1091	2574
1415	Trust	1990	7.70000000000000018	1090	982
1416	Boondock Saints, The	1999	7.40000000000000036	1089	2641
1417	Babettes g&#230;stebud	1987	7.90000000000000036	1088	2221
1418	Nattevagten	1994	7.59999999999999964	1085	1166
1419	Air America	1990	5.20000000000000018	1085	407
1420	Ultimo tango a Parigi	1972	6.90000000000000036	1081	598
1421	How to Make an American Quilt	1995	6.09999999999999964	1081	2299
1422	Runaway Train	1985	7	1081	1049
1423	Problem Child 2	1991	2.70000000000000018	1080	395
1424	Fright Night	1985	6.5	1079	562
1425	Higher Learning	1995	6.29999999999999982	1078	396
1426	Defending Your Life	1991	7.09999999999999964	1078	247
1427	Annie	1982	5.29999999999999982	1077	312
1428	Slums of Beverly Hills	1998	6.40000000000000036	1076	2543
1429	Days of Heaven	1978	7.79999999999999982	1076	686
1430	Newsies	1992	5.20000000000000018	1075	991
1431	Picture Perfect	1997	5.79999999999999982	1075	2139
1432	Batman: Mask of the Phantasm	1993	6.90000000000000036	1075	2089
1433	High Plains Drifter	1972	7.09999999999999964	1075	2
1434	Cheech & Chong's Next Movie	1980	5.20000000000000018	1074	721
1435	Adam's Rib	1949	7.79999999999999982	1073	628
1436	'Breaker' Morant	1980	7.79999999999999982	1072	685
1437	Brokedown Palace	1999	6.09999999999999964	1071	580
1438	Tea with Mussolini	1999	6.90000000000000036	1071	1058
1439	Super Mario Bros.	1993	3.39999999999999991	1071	1175
1440	Firefox	1982	5.29999999999999982	1070	2
1441	Stranger Than Paradise	1984	7.40000000000000036	1069	175
1442	Bedazzled	2000	6.40000000000000036	1065	108
1443	Yin shi nan nu	1994	7.79999999999999982	1063	273
1444	Detroit Rock City	1999	6.20000000000000018	1061	977
1445	Untamed Heart	1993	6.5	1061	2661
1446	Antonia	1995	7.79999999999999982	1061	2501
1447	Young Sherlock Holmes	1985	6.29999999999999982	1059	38
1448	Tommy	1975	5.90000000000000036	1059	909
1449	School Ties	1992	6.70000000000000018	1059	1007
1450	One True Thing	1998	7.40000000000000036	1058	998
1451	Boys on the Side	1995	6.20000000000000018	1058	200
1452	Buena Vista Social Club	1999	7.40000000000000036	1057	269
1453	Clash of the Titans	1981	5.70000000000000018	1056	2468
1454	Hellbound: Hellraiser II	1988	5.59999999999999964	1056	2655
1455	Holy Man	1998	5.20000000000000018	1055	149
1456	Bachelor, The	1999	5.09999999999999964	1055	2112
1457	Down Periscope	1996	5.29999999999999982	1055	2425
1458	Happy, Texas	1999	6.70000000000000018	1054	2598
1459	Guess Who's Coming to Dinner	1967	7.20000000000000018	1054	673
1460	Fearless Vampire Killers, The	1967	6.79999999999999982	1051	90
1461	Assault on Precinct 13	1976	7.20000000000000018	1050	23
1462	Chase, The	1994	5.29999999999999982	1046	977
1463	Mod Squad, The	1999	3.60000000000000009	1045	2725
1464	Great Outdoors, The	1988	5.5	1044	285
1465	Hairspray	1988	6.5	1044	364
1466	Shootist, The	1976	7.40000000000000036	1044	346
1467	Un coeur en hiver	1992	7.70000000000000018	1044	2296
1468	Europa	1991	7.59999999999999964	1042	615
1469	Running on Empty	1988	7.09999999999999964	1042	80
1470	Nightmare on Elm Street Part 2: Freddy's Revenge, A	1985	4.40000000000000036	1041	1173
1471	Paper, The	1994	6.29999999999999982	1040	21
1472	Holy Smoke	1999	5.79999999999999982	1039	575
1473	Near Dark	1987	7	1039	641
1474	With Honors	1994	6.20000000000000018	1036	2208
1475	Clockers	1995	6.90000000000000036	1035	206
1476	Vanishing, The	1993	5.90000000000000036	1035	2162
1477	Getaway, The	1994	5.59999999999999964	1034	146
1478	Belle &#233;poque	1992	7.29999999999999982	1033	2015
1479	Road to Wellville, The	1994	5	1033	68
1480	Peter's Friends	1992	6.59999999999999964	1033	48
1481	Torch Song Trilogy	1988	6.70000000000000018	1032	2567
1482	Trouble with Harry, The	1955	7.29999999999999982	1031	11
1483	American in Paris, An	1951	7.5	1030	2597
1484	Muppet Christmas Carol, The	1992	6.90000000000000036	1030	1493
1485	Secret of Roan Inish, The	1994	7.5	1030	931
1486	Adventures of Rocky & Bullwinkle, The	2000	4.79999999999999982	1028	2466
1487	Child's Play	1988	5.59999999999999964	1028	562
1488	Help!	1965	6.79999999999999982	1027	274
1489	Rage: Carrie 2, The	1999	4.79999999999999982	1026	1160
1490	Oscar	1991	5.29999999999999982	1024	62
1491	Desperate Measures	1998	5.5	1024	1104
1492	Frenzy	1972	7.29999999999999982	1022	11
1493	Drop Dead Fred	1991	4.29999999999999982	1022	2046
1494	My Blue Heaven	1990	5.90000000000000036	1022	200
1495	Sid and Nancy	1986	7	1020	1041
1496	What Ever Happened to Baby Jane?	1962	7.79999999999999982	1020	1060
1497	Freejack	1992	4.79999999999999982	1019	627
1498	Alice in Wonderland	1951	7.20000000000000018	1018	266
1499	Vie r&#234;v&#233;e des anges, La	1998	8.09999999999999964	1017	2073
1500	Butcher Boy, The	1997	7.20000000000000018	1017	153
1501	Carne tr&#233;mula	1997	7.5	1016	394
1502	Red Corner	1997	6	1016	691
1503	Tonari no Totoro	1988	7.90000000000000036	1014	1051
1504	Rollerball	1975	6.20000000000000018	1013	81
1505	Outside Providence	1999	6.29999999999999982	1010	2626
1506	Verdict, The	1982	7.5	1010	80
1507	PCU	1994	5.79999999999999982	1009	730
1508	Noises Off...	1992	6.79999999999999982	1006	612
1509	City Slickers II: The Legend of Curly's Gold	1994	5	1006	2860
1510	Sydney	1996	7.5	1006	1037
1511	Clay Pigeons	1998	6.70000000000000018	1005	2283
1512	Suspiria	1977	7.09999999999999964	1004	2259
1513	Excess Baggage	1997	4.59999999999999964	1003	1182
1514	Mighty Ducks, The	1992	5.70000000000000018	1003	149
1515	Creepshow	1982	5.90000000000000036	1001	379
1516	Basquiat	1996	6.5	1001	2390
1517	Baraka	1992	7.59999999999999964	1000	2846
1518	Heartbreak Ridge	1986	6.09999999999999964	1000	2
1519	On Deadly Ground	1994	3.70000000000000018	999	171
1520	Circle of Friends	1995	6.79999999999999982	999	2610
1521	Dracula: Dead and Loving It	1995	4.40000000000000036	999	29
1522	Andrei Rublyov	1969	8.40000000000000036	996	658
1523	HouseSitter	1992	6	995	123
1524	Free Willy	1993	5.20000000000000018	993	1115
1525	Nightmare on Elm Street 4: The Dream Master, A	1988	4.79999999999999982	992	210
1526	Trick	1999	7.70000000000000018	992	2314
1527	Fog, The	1980	6.20000000000000018	991	23
1528	Twilight	1998	6.09999999999999964	988	660
1529	Colors	1988	6.29999999999999982	988	125
1530	Bambi Meets Godzilla	1969	7.5	985	2544
1531	Sholay	1975	7.5	985	2848
1532	D.O.A.	1988	6.09999999999999964	983	1175
1533	War of the Worlds, The	1953	7.09999999999999964	983	2260
1534	Midnight Clear, A	1991	7.5	981	644
1535	Winslow Boy, The	1999	7.5	979	606
1536	Tesis	1996	7.79999999999999982	977	985
1537	Saving Grace	2000	7.29999999999999982	977	2503
1538	Wrongfully Accused	1998	5.29999999999999982	976	2593
1539	Cry-Baby	1990	5.90000000000000036	972	364
1540	Mighty, The	1998	7.5	972	2770
1541	1492: Conquest of Paradise	1992	6	970	110
1542	Beneath the Planet of the Apes	1970	5.5	969	2692
1543	Utomlyonnye solntsem	1994	7.70000000000000018	968	1503
1544	New York Stories	1989	6.20000000000000018	968	1
1545	Henry & June	1990	6.29999999999999982	963	288
1546	Deep End of the Ocean, The	1999	6.09999999999999964	962	2734
1547	Mighty Joe Young	1998	5.90000000000000036	962	415
1548	Blow Out	1981	7	961	31
1549	Sandlot, The	1993	6.70000000000000018	959	2273
1550	Dressed to Kill	1980	6.90000000000000036	958	31
1551	Beethoven	1992	5.09999999999999964	958	395
1552	Re-Animator	1985	6.70000000000000018	957	2561
1553	Fletch Lives	1989	5.09999999999999964	955	418
1554	Hsi yen	1993	7.70000000000000018	954	273
1555	Thunderheart	1992	6.5	953	199
1556	Dellamorte Dellamore	1994	7.09999999999999964	953	2659
1557	Nightwatch	1998	6	953	1166
1558	Pred dozhdot	1994	7.59999999999999964	952	2643
1559	Play It Again, Sam	1972	7.29999999999999982	952	200
1560	Harry and the Hendersons	1987	5.29999999999999982	951	1059
1561	Bio-Dome	1996	3.60000000000000009	951	2275
1562	Quick Change	1990	6.59999999999999964	950	2061
1563	My Dinner with Andr&#233;	1981	7.20000000000000018	950	619
1564	Wicker Man, The	1973	7.29999999999999982	949	2863
1565	Boomerang	1992	5.29999999999999982	949	2852
1566	Dragon: The Bruce Lee Story	1993	6.79999999999999982	946	376
1567	Bulletproof	1996	5.5	945	2094
1568	Bride of Frankenstein	1935	8.09999999999999964	945	1097
1569	Cabin Boy	1994	4.29999999999999982	944	2110
1570	Quadrophenia	1979	6.70000000000000018	944	2196
1571	Mifunes sidste sang	1999	7.40000000000000036	940	2594
1572	Baby Geniuses	1999	2.20000000000000018	939	579
1573	Next Best Thing, The	2000	5	939	677
1574	Coma	1978	6.40000000000000036	939	1017
1575	Night Shift	1982	6.29999999999999982	936	21
1576	Blue in the Face	1995	6.40000000000000036	936	2552
1577	Out-of-Towners, The	1999	5	936	1075
1578	Take the Money and Run	1969	7.20000000000000018	936	1
1579	Screamers	1995	5.5	935	2347
1580	Watership Down	1978	7.20000000000000018	935	2551
1581	Freddy's Dead: The Final Nightmare	1991	4.20000000000000018	935	1032
1582	Screamers	1995	5.5	935	2346
1583	House of Yes, The	1997	6.70000000000000018	934	2510
1584	Road House	1989	5.20000000000000018	932	1090
1585	New Jack City	1991	6.09999999999999964	932	727
1586	Chitty Chitty Bang Bang	1968	6.09999999999999964	932	2002
1587	Down to You	2000	4.59999999999999964	931	2176
1588	Mystery Train	1989	7.09999999999999964	930	175
1589	Return of the Pink Panther, The	1974	6.59999999999999964	929	65
1590	Palmetto	1998	5.40000000000000036	929	980
1591	Ngo hai sui	1998	6.90000000000000036	926	2406
1592	Beloved	1998	5.79999999999999982	926	281
1593	Subway	1985	6.40000000000000036	925	389
1594	Black Sheep	1996	4.90000000000000036	924	1021
1595	Power of One, The	1992	6.20000000000000018	923	683
1596	Fair Game	1995	3.89999999999999991	922	2021
1597	Boxing Helena	1993	3.89999999999999991	921	2339
1598	Dennis the Menace	1993	4.79999999999999982	921	2716
1599	Brothers McMullen, The	1995	6.59999999999999964	920	485
1600	Drowning Mona	2000	5.29999999999999982	920	2704
1601	Problem Child	1990	3.60000000000000009	918	330
1602	Children of the Corn	1984	4.59999999999999964	918	2206
1603	Capricorn One	1978	6.20000000000000018	917	103
1604	Postcards from the Edge	1990	6.29999999999999982	917	47
1605	Cocoon: The Return	1988	4.79999999999999982	917	2250
1606	Romeo Is Bleeding	1993	6.09999999999999964	915	1001
1607	Silkwood	1983	6.90000000000000036	915	47
1608	Hunger, The	1983	6.20000000000000018	914	107
1609	Shot in the Dark, A	1964	7.40000000000000036	914	65
1610	1900	1976	7.59999999999999964	913	598
1611	Chamber, The	1996	5.59999999999999964	913	423
1612	Fame	1980	6.29999999999999982	912	68
1613	American Tail, An	1986	6.40000000000000036	911	409
1614	Friday the 13th Part 2	1981	4.40000000000000036	907	365
1615	D&#238;ner de cons, Le	1998	7.70000000000000018	906	2169
1616	Big Kahuna, The	1999	7.09999999999999964	905	2474
1617	Beastmaster, The	1982	5.09999999999999964	904	2373
1618	Taps	1981	6.20000000000000018	903	616
1619	Highlander: Endgame	2000	5.20000000000000018	901	2418
1620	American Movie: The Making of Northwestern	1999	7.70000000000000018	901	2342
1621	Cadillac Man	1990	5.20000000000000018	901	146
1622	Zardoz	1974	5.40000000000000036	900	293
1623	Blechtrommel, Die	1979	7.90000000000000036	900	980
1624	High Anxiety	1977	6.29999999999999982	898	29
1625	Beverly Hills Ninja	1997	4.79999999999999982	898	330
1626	Next Friday	2000	4.90000000000000036	897	2853
1627	Tin Men	1987	6.29999999999999982	894	38
1628	Silent Movie	1976	6	893	29
1629	She's So Lovely	1997	5.79999999999999982	893	1495
1630	Funny Farm	1988	5.20000000000000018	891	276
1631	True Grit	1969	7.09999999999999964	891	2040
1632	Abre los ojos	1997	8	891	985
1633	Simply Irresistible	1999	4.79999999999999982	891	2515
1634	Death Race 2000	1975	5.59999999999999964	890	1329
1635	Final Countdown, The	1980	6.5	889	489
1636	Home Fries	1998	5	888	1101
1637	Above the Law	1988	5.20000000000000018	888	291
1638	Dead Man on Campus	1998	5.5	888	2125
1639	Supergirl	1984	3.70000000000000018	888	600
1640	Cure, The	1995	6.90000000000000036	887	836
1641	Cannonball Run II	1984	3.5	887	618
1642	Fathers' Day	1997	4.59999999999999964	886	109
1643	Persona	1966	8	885	420
1644	Russia House, The	1990	6.09999999999999964	885	272
1645	Devil in a Blue Dress	1995	6.70000000000000018	885	998
1646	Over the Top	1987	3.79999999999999982	885	2726
1647	3 Men and a Little Lady	1990	4.5	885	662
1648	Broadway Danny Rose	1984	7.29999999999999982	884	1
1649	Ying huang boon sik	1986	7.40000000000000036	884	204
1650	Xanadu	1980	4.29999999999999982	884	2517
1651	Plunkett & Macleane	1999	6.40000000000000036	883	2385
1652	Visiteurs, Les	1993	6.29999999999999982	882	2280
1653	Fl&#229;klypa Grand Prix	1975	7.79999999999999982	881	2400
1654	Drop Zone	1994	5.5	880	66
1655	Seven Year Itch, The	1955	7.09999999999999964	880	79
1656	Thing From Another World, The	1951	7.29999999999999982	878	2345
1657	I Love You to Death	1990	6	878	87
1658	Repulsion	1965	7.90000000000000036	877	90
1659	Rosewood	1997	6.70000000000000018	876	396
1660	Firestarter	1984	5.59999999999999964	875	1073
1661	To Live and Die in L.A.	1985	6.59999999999999964	874	264
1662	Reds	1981	6.90000000000000036	873	60
1663	Flight of the Navigator	1986	6.29999999999999982	873	383
1664	High Art	1998	7.29999999999999982	872	2867
1665	Bed of Roses	1996	6.20000000000000018	872	2621
1666	Feeling Minnesota	1996	5.29999999999999982	870	2578
1667	Monty Python Live at the Hollywood Bowl	1982	7.09999999999999964	869	2691
1668	She's Having a Baby	1988	5.59999999999999964	868	144
1669	What's Up, Doc?	1972	7.29999999999999982	868	612
1670	Drowning by Numbers	1988	6.90000000000000036	868	386
1671	Stop Making Sense	1984	7.59999999999999964	867	281
1672	One Eight Seven	1997	6.5	867	378
1673	Oscar and Lucinda	1997	6.79999999999999982	866	2140
1674	Amateur	1994	7.09999999999999964	865	982
1675	Something to Talk About	1995	5.79999999999999982	864	387
1676	My Fellow Americans	1996	6.5	864	384
1677	Day of the Dead	1985	6.40000000000000036	864	379
1678	Fandango	1985	6.29999999999999982	864	378
1679	Purple Rain	1984	5.40000000000000036	862	2211
1680	My Dog Skip	2000	7.40000000000000036	862	2284
1681	Universal Soldier: The Return	1999	3.29999999999999982	862	1866
1682	Boxer, The	1997	6.90000000000000036	862	581
1683	Prospero's Books	1991	5.90000000000000036	860	386
1684	Home for the Holidays	1995	6.29999999999999982	859	215
1685	Gorky Park	1983	6.5	858	199
1686	Dream Team, The	1989	6	858	661
1687	Gummo	1997	5.40000000000000036	858	1970
1688	Cotton Club, The	1984	6.09999999999999964	857	28
1689	Renaissance Man	1994	5.79999999999999982	857	361
1690	Only You	1994	6.29999999999999982	855	81
1691	Ridicule	1996	7.20000000000000018	854	2612
1692	Pink Panther Strikes Again, The	1976	6.79999999999999982	852	65
1693	Needful Things	1993	5.70000000000000018	851	2175
1694	Sudden Death	1995	5.09999999999999964	851	103
1695	20,000 Leagues Under the Sea	1954	7.09999999999999964	850	402
1696	Suspicion	1941	7.5	850	11
1697	Stunt Man, The	1980	7.40000000000000036	849	1039
1698	Bad News Bears, The	1976	6.5	847	418
1699	Song of the South	1946	7.20000000000000018	847	2190
1700	Airport	1970	6.29999999999999982	846	1061
1701	Contender, The	2000	7	846	2768
1702	Superstar	1999	4.5	846	1506
1703	Drive Me Crazy	1999	5.09999999999999964	846	2423
1704	Prince of Darkness	1987	6.20000000000000018	844	23
1705	Exorcist II: The Heretic	1977	3.20000000000000018	842	293
1706	I Love Trouble	1994	5.20000000000000018	842	397
1707	Blue Thunder	1983	6	840	66
1708	Amityville Horror, The	1979	5.09999999999999964	839	1029
1709	Blame It on Rio	1984	5.09999999999999964	839	428
1710	Omega Man, The	1971	6.29999999999999982	838	2483
1711	Attack of the Killer Tomatoes!	1978	3.60000000000000009	837	2242
1712	Scanners	1981	6.29999999999999982	837	97
1713	Damien: Omen II	1978	5.5	837	489
1714	Around the World in Eighty Days	1956	6.70000000000000018	836	2698
1715	Indochine	1992	6.90000000000000036	835	2785
1716	Oh, God!	1977	5.90000000000000036	832	221
1717	Body of Evidence	1993	4.09999999999999964	831	2735
1718	Canadian Bacon	1995	5.40000000000000036	829	955
1719	Wait Until Dark	1967	7.5	829	388
1720	Felicia's Journey	1999	7.20000000000000018	827	665
1721	Yume	1990	7.40000000000000036	825	208
1722	Home Alone 3	1997	3.70000000000000018	825	633
1723	Hotaru no haka	1988	8.5	822	2401
1724	1776	1972	7	821	2822
1725	Brainstorm	1983	6.20000000000000018	821	1156
1726	Wilde	1997	7	820	2431
1727	Escape from the Planet of the Apes	1971	5.79999999999999982	819	489
1728	Foul Play	1978	6.5	818	1110
1729	One, Two, Three	1961	7.70000000000000018	818	79
1730	Turbulence	1997	4.20000000000000018	818	2707
1731	Halloween 4: The Return of Michael Myers	1988	5	818	1178
1732	Moscow on the Hudson	1984	6.20000000000000018	818	720
1733	Pallbearer, The	1996	4.90000000000000036	817	2686
1734	See No Evil, Hear No Evil	1989	5.59999999999999964	817	1087
1735	Crush, The	1993	5.29999999999999982	817	2115
1736	Guarding Tess	1994	6.09999999999999964	816	377
1737	Hotel New Hampshire, The	1984	5.79999999999999982	814	2653
1738	Music of the Heart	1999	6.90000000000000036	814	133
1739	Yatgo ho yan	1997	6.40000000000000036	814	1691
1740	Erik the Viking	1989	5.59999999999999964	814	694
1741	Red River	1948	8.40000000000000036	813	197
1742	We're No Angels	1989	5.29999999999999982	812	153
1743	SLC Punk!	1999	7.09999999999999964	811	2479
1744	Boys from Brazil, The	1978	6.5	809	405
1745	Young Einstein	1988	4.79999999999999982	809	999
1746	Hitlerjunge Salomon	1990	7.70000000000000018	808	997
1747	Navy SEALS	1990	5	807	1016
1748	Poison Ivy	1992	5	806	1160
1749	Ikiru	1952	8.80000000000000071	805	208
1750	Hope and Glory	1987	7.59999999999999964	803	293
1751	Cape Fear	1962	7.59999999999999964	803	1164
1752	Yentl	1983	5.70000000000000018	803	207
1753	Bounty, The	1984	6.70000000000000018	802	146
1754	Talk Radio	1988	6.79999999999999982	799	69
1755	Silver Streak	1976	6.5	798	1087
1756	Exit to Eden	1994	3.89999999999999991	797	129
1757	Dobermann	1997	6.59999999999999964	797	2451
1758	Poltergeist II: The Other Side	1986	4.79999999999999982	796	1171
1759	Hush	1998	4.40000000000000036	796	2378
1760	Phantom of the Paradise	1974	6.59999999999999964	796	31
1761	Terminal Velocity	1994	5.40000000000000036	795	2463
1762	Wishmaster	1997	4.90000000000000036	794	2502
1763	Honey, I Blew Up the Kid	1992	4.29999999999999982	793	383
1764	Thomas Crown Affair, The	1968	6.79999999999999982	793	81
1765	...And Justice for All	1979	6.70000000000000018	791	81
1766	Halloween: The Curse of Michael Myers	1995	4.29999999999999982	791	1127
1767	Paper Moon	1973	7.5	790	612
1768	To Be or Not to Be	1942	8.5	789	2014
1769	Toy Soldiers	1991	5.79999999999999982	789	2253
1770	Midsummer Night's Sex Comedy, A	1982	6.20000000000000018	789	1
1771	Death on the Nile	1978	6.5	787	2287
1772	Funny Games	1997	7.40000000000000036	786	2629
1773	Stand and Deliver	1987	7	786	2840
1774	Gung Ho	1986	5.59999999999999964	786	21
1775	Distinguished Gentleman, The	1992	5.70000000000000018	786	262
1776	Good Son, The	1993	5.5	785	410
1777	Milk Money	1994	5.20000000000000018	785	320
1778	Family Business	1989	5.20000000000000018	783	80
1779	Sudden Impact	1983	6.09999999999999964	782	2
1780	Remo Williams: The Adventure Begins...	1985	5.59999999999999964	781	636
1781	Hidden, The	1987	6.90000000000000036	781	1173
1782	SubUrbia	1997	6.40000000000000036	780	205
1783	Scarlet Letter, The	1995	4.20000000000000018	780	1170
1784	SpaceCamp	1986	5.29999999999999982	780	2191
1785	Glimmer Man, The	1996	5	779	2278
1786	Richie Rich	1994	4.29999999999999982	778	599
1787	Double Team	1997	4.20000000000000018	778	2164
1788	Atlantic City	1980	7.79999999999999982	777	619
1789	Educating Rita	1983	6.79999999999999982	777	390
1790	Court Jester, The	1956	8.19999999999999929	777	2717
1791	Teen Wolf Too	1987	2.5	775	2298
1792	Slacker	1991	6.79999999999999982	774	205
1793	Two Girls and a Guy	1997	5.79999999999999982	773	2429
1794	Raw Deal	1986	4.70000000000000018	773	2265
1795	Taking of Pelham One Two Three, The	1974	7.5	773	1119
1796	Psycho II	1983	5.59999999999999964	772	2513
1797	Friday the 13th Part 3: 3D	1982	3.79999999999999982	772	365
1798	Ghosts of Mississippi	1996	6.5	772	37
1799	Great Race, The	1965	6.79999999999999982	772	65
1800	Un chien andalou	1929	8.30000000000000071	772	815
1801	Hearts of Darkness: A Filmmaker's Apocalypse	1991	8.19999999999999929	772	2031
1802	Hoffa	1992	6	771	24
1803	Don't Look Now	1973	7.5	770	1076
1804	Teenage Mutant Ninja Turtles II: The Secret of the Ooze	1991	4.09999999999999964	769	2652
1805	Orlando	1992	6.5	769	2489
1806	Playing God	1997	5.40000000000000036	768	2026
1807	American Gigolo	1980	5.70000000000000018	768	652
1808	Serpent and the Rainbow, The	1988	5.79999999999999982	768	133
1809	U2: Rattle and Hum	1988	6.79999999999999982	767	2807
1810	Used Cars	1980	6.29999999999999982	767	67
1811	Valley Girl	1983	6	767	1141
1812	Shadows and Fog	1992	6.20000000000000018	767	1
1813	Out of Rosenheim	1988	7.20000000000000018	767	2771
1814	Portrait of a Lady, The	1996	5.79999999999999982	767	575
1815	Selena	1997	6.09999999999999964	765	2155
1816	My Beautiful Laundrette	1985	6.79999999999999982	764	292
1817	Project X	1987	5.79999999999999982	763	580
1818	Robin Hood	1973	7.09999999999999964	762	1004
1819	Newton Boys, The	1998	5.79999999999999982	762	205
1820	Money Talks	1997	5.59999999999999964	760	1094
1821	Don't Be a Menace to South Central While Drinking Your Juice in the Hood	1996	5.90000000000000036	760	2599
1822	Billy Bathgate	1991	5.70000000000000018	760	660
1823	Muppets From Space	1999	6.20000000000000018	760	2721
1824	Hocus Pocus	1993	4.90000000000000036	760	991
1825	Thinner	1996	4.90000000000000036	759	562
1826	Restoration	1995	6.79999999999999982	759	401
1827	Hard Way, The	1991	6	758	66
1828	Baby Boom	1987	5.70000000000000018	758	397
1829	Time After Time	1979	7.09999999999999964	757	571
1830	&#161;&#193;tame!	1990	6.70000000000000018	755	394
1831	Angels in the Outfield	1994	5.5	752	1059
1832	Parent Trap, The	1961	6.90000000000000036	752	2433
1833	Santa Claus Conquers the Martians	1964	2.10000000000000009	750	2713
1834	Truly Madly Deeply	1991	6.79999999999999982	749	621
1835	Very Brady Sequel, A	1996	5.29999999999999982	749	2048
1836	Duoluo tianshi	1995	7.40000000000000036	747	1095
1837	Summer School	1987	5.79999999999999982	745	221
1838	Bewegte Mann, Der	1994	6.70000000000000018	743	2589
1839	Streets of Fire	1984	6.09999999999999964	742	143
1840	Heart and Souls	1993	6.79999999999999982	736	415
1841	Barcelona	1994	6.59999999999999964	734	2857
1842	Absence of Malice	1981	6.70000000000000018	734	92
1843	Milagro Beanfield War, The	1988	6.70000000000000018	726	36
1844	End of Violence, The	1997	5.59999999999999964	724	269
1845	Hollywood Knights, The	1980	5.5	721	2016
\.

COPY nobels (yr, subject, winner) FROM stdin;
2008	Chemistry	Martin Chalfie
2008	Chemistry	Osamu Shimomura
2008	Chemistry	Roger Y. Tsien
2008	Economics	Paul Krugman
2008	Literature	Jean-Marie Gustave Le ClÃ©zio
2008	Medicine	FranÃ§oise BarrÃ©-Sinoussi
2008	Medicine	Luc Montagnier
2008	Medicine	Harald zur Hausen
2008	Peace	Martti Ahtisaari
2008	Physics	Makoto Kobayashi
2008	Physics	Toshihide Maskawa
2008	Physics	Yoichiro Nambu
2007	Chemistry	Gerhard Ertl
2007	Economics	Leonid Hurwicz
2007	Economics	Eric S. Maskin
2007	Economics	Roger B. Myerson
2007	Literature	Doris Lessing
2007	Medicine	Mario R. Capecchi
2007	Medicine	Sir Martin J. Evans
2007	Medicine	Oliver Smithies
2007	Peace	Intergovernmental Panel on Climate Change
2007	Peace	Al Gore
2007	Physics	Albert Fert
2007	Physics	Peter GrÃ¼nberg
2006	Chemistry	Roger D. Kornberg
2006	Economics	Edmund S. Phelps
2006	Literature	Orhan Pamuk
2006	Medicine	Andrew Z. Fire
2006	Medicine	Craig C. Mello
2006	Peace	Grameen Bank
2006	Peace	Muhammad Yunus
2006	Physics	John C. Mather
2006	Physics	George F. Smoot
2005	Chemistry	Yves Chauvin
2005	Chemistry	Robert H. Grubbs
2005	Chemistry	Richard R. Schrock
2005	Economics	Robert J. Aumann
2005	Economics	Thomas C. Schelling
2005	Literature	Harold Pinter
2005	Medicine	Barry J. Marshall
2005	Medicine	J. Robin Warren
2005	Peace	International Atomic Energy Agency
2005	Peace	Mohamed ElBaradei
2005	Physics	Roy J. Glauber
2005	Physics	John L. Hall
2005	Physics	Theodor W. HÃ¤nsch
2004	Chemistry	Aaron Ciechanover
2004	Chemistry	Avram Hershko
2004	Chemistry	Irwin Rose
2004	Economics	Finn E. Kydland
2004	Economics	Edward C. Prescott
2004	Literature	Elfriede Jelinek
2004	Medicine	Richard Axel
2004	Medicine	Linda B. Buck
2004	Peace	Wangari Maathai
2004	Physics	David J. Gross
2004	Physics	H. David Politzer
2004	Physics	Frank Wilczek
2003	Chemistry	Peter Agre
2003	Chemistry	Roderick MacKinnon
2003	Economics	Robert F. Engle III
2003	Economics	Clive W.J. Granger
2003	Literature	J. M. Coetzee
2003	Medicine	Paul C. Lauterbur
2003	Medicine	Sir Peter Mansfield
2003	Peace	Shirin Ebadi
2003	Physics	Alexei A. Abrikosov
2003	Physics	Vitaly L. Ginzburg
2003	Physics	Anthony J. Leggett
2002	Chemistry	John B. Fenn
2002	Chemistry	Koichi Tanaka
2002	Chemistry	Kurt WÃ¼thrich
2002	Economics	Daniel Kahneman
2002	Economics	Vernon L. Smith
2002	Literature	Imre KertÃ©sz
2002	Medicine	Sydney Brenner
2002	Medicine	H. Robert Horvitz
2002	Medicine	John E. Sulston
2002	Peace	Jimmy Carter
2002	Physics	Raymond Davis Jr.
2002	Physics	Riccardo Giacconi
2002	Physics	Masatoshi Koshiba
2001	Chemistry	William S. Knowles
2001	Chemistry	Ryoji Noyori
2001	Chemistry	K. Barry Sharpless
2001	Economics	George A. Akerlof
2001	Economics	A. Michael Spence
2001	Economics	Joseph E. Stiglitz
2001	Literature	V. S. Naipaul
2001	Medicine	Leland H. Hartwell
2001	Medicine	Tim Hunt
2001	Medicine	Sir Paul Nurse
2001	Peace	United Nations
2001	Peace	Kofi Annan
2001	Physics	Eric A. Cornell
2001	Physics	Wolfgang Ketterle
2001	Physics	Carl E. Wieman
2000	Chemistry	Alan Heeger
2000	Chemistry	Alan G. MacDiarmid
2000	Chemistry	Hideki Shirakawa
2000	Economics	James J. Heckman
2000	Economics	Daniel L. McFadden
2000	Literature	Gao Xingjian
2000	Medicine	Arvid Carlsson
2000	Medicine	Paul Greengard
2000	Medicine	Eric R. Kandel
2000	Peace	Kim Dae-jung
2000	Physics	Zhores I. Alferov
2000	Physics	Jack S. Kilby
2000	Physics	Herbert Kroemer
1999	Chemistry	Ahmed Zewail
1999	Economics	Robert A. Mundell
1999	Literature	GÃ¼nter Grass
1999	Medicine	GÃ¼nter Blobel
1999	Peace	MÃ©decins Sans FrontiÃ¨res
1999	Physics	Gerardus 't Hooft
1999	Physics	Martinus J.G. Veltman
1998	Chemistry	Walter Kohn
1998	Chemistry	John Pople
1998	Economics	Amartya Sen
1998	Literature	JosÃ© Saramago
1998	Medicine	Robert F. Furchgott
1998	Medicine	Louis J. Ignarro
1998	Medicine	Ferid Murad
1998	Peace	John Hume
1998	Peace	David Trimble
1998	Physics	Robert B. Laughlin
1998	Physics	Horst L. StÃ¶rmer
1998	Physics	Daniel C. Tsui
1997	Chemistry	Paul D. Boyer
1997	Chemistry	Jens C. Skou
1997	Chemistry	John E. Walker
1997	Economics	Robert C. Merton
1997	Economics	Myron S. Scholes
1997	Literature	Dario Fo
1997	Medicine	Stanley B. Prusiner
1997	Peace	International Campaign to Ban Landmines
1997	Peace	Jody Williams
1997	Physics	Steven Chu
1997	Physics	Claude Cohen-Tannoudji
1997	Physics	William D. Phillips
1996	Chemistry	Robert F. Curl Jr.
1996	Chemistry	Sir Harold Kroto
1996	Chemistry	Richard E. Smalley
1996	Economics	James A. Mirrlees
1996	Economics	William Vickrey
1996	Literature	Wislawa Szymborska
1996	Medicine	Peter C. Doherty
1996	Medicine	Rolf M. Zinkernagel
1996	Peace	Carlos Filipe Ximenes Belo
1996	Peace	JosÃ© Ramos-Horta
1996	Physics	David M. Lee
1996	Physics	Douglas D. Osheroff
1996	Physics	Robert C. Richardson
1995	Chemistry	Paul J. Crutzen
1995	Chemistry	Mario J. Molina
1995	Chemistry	F. Sherwood Rowland
1995	Economics	Robert E. Lucas Jr.
1995	Literature	Seamus Heaney
1995	Medicine	Edward B. Lewis
1995	Medicine	Christiane NÃ¼sslein-Volhard
1995	Medicine	Eric F. Wieschaus
1995	Peace	Pugwash Conferences on Science and World Affairs
1995	Peace	Joseph Rotblat
1995	Physics	Martin L. Perl
1995	Physics	Frederick Reines
1994	Chemistry	George A. Olah
1994	Economics	John C. Harsanyi
1994	Economics	John F. Nash Jr.
1994	Economics	Reinhard Selten
1994	Literature	Kenzaburo Oe
1994	Medicine	Alfred G. Gilman
1994	Medicine	Martin Rodbell
1994	Peace	Yasser Arafat
1994	Peace	Shimon Peres
1994	Peace	Yitzhak Rabin
1994	Physics	Bertram N. Brockhouse
1994	Physics	Clifford G. Shull
1993	Chemistry	Kary B. Mullis
1993	Chemistry	Michael Smith
1993	Economics	Robert W. Fogel
1993	Economics	Douglass C. North
1993	Literature	Toni Morrison
1993	Medicine	Richard J. Roberts
1993	Medicine	Phillip A. Sharp
1993	Peace	F.W. de Klerk
1993	Peace	Nelson Mandela
1993	Physics	Russell A. Hulse
1993	Physics	Joseph H. Taylor Jr.
1992	Chemistry	Rudolph A. Marcus
1992	Economics	Gary S. Becker
1992	Literature	Derek Walcott
1992	Medicine	Edmond H. Fischer
1992	Medicine	Edwin G. Krebs
1992	Peace	Rigoberta MenchÃº Tum
1992	Physics	Georges Charpak
1991	Chemistry	Richard R. Ernst
1991	Economics	Ronald H. Coase
1991	Literature	Nadine Gordimer
1991	Medicine	Erwin Neher
1991	Medicine	Bert Sakmann
1991	Peace	Aung San Suu Kyi
1991	Physics	Pierre-Gilles de Gennes
1990	Chemistry	Elias James Corey
1990	Economics	Harry M. Markowitz
1990	Economics	Merton H. Miller
1990	Economics	William F. Sharpe
1990	Literature	Octavio Paz
1990	Medicine	Joseph E. Murray
1990	Medicine	E. Donnall Thomas
1990	Peace	Mikhail Gorbachev
1990	Physics	Jerome I. Friedman
1990	Physics	Henry W. Kendall
1990	Physics	Richard E. Taylor
1989	Chemistry	Sidney Altman
1989	Chemistry	Thomas R. Cech
1989	Economics	Trygve Haavelmo
1989	Literature	Camilo JosÃ© Cela
1989	Medicine	J. Michael Bishop
1989	Medicine	Harold E. Varmus
1989	Peace	The 14th Dalai Lama
1989	Physics	Hans G. Dehmelt
1989	Physics	Wolfgang Paul
1989	Physics	Norman F. Ramsey
1988	Chemistry	Johann Deisenhofer
1988	Chemistry	Robert Huber
1988	Chemistry	Hartmut Michel
1988	Economics	Maurice Allais
1988	Literature	Naguib Mahfouz
1988	Medicine	Sir James W. Black
1988	Medicine	Gertrude B. Elion
1988	Medicine	George H. Hitchings
1988	Peace	United Nations Peacekeeping Forces
1988	Physics	Leon M. Lederman
1988	Physics	Melvin Schwartz
1988	Physics	Jack Steinberger
1987	Chemistry	Donald J. Cram
1987	Chemistry	Jean-Marie Lehn
1987	Chemistry	Charles J. Pedersen
1987	Economics	Robert M. Solow
1987	Literature	Joseph Brodsky
1987	Medicine	Susumu Tonegawa
1987	Peace	Oscar Arias SÃ¡nchez
1987	Physics	J. Georg Bednorz
1987	Physics	K. Alex MÃ¼ller
1986	Chemistry	Dudley R. Herschbach
1986	Chemistry	Yuan T. Lee
1986	Chemistry	John C. Polanyi
1986	Economics	James M. Buchanan Jr.
1986	Literature	Wole Soyinka
1986	Medicine	Stanley Cohen
1986	Medicine	Rita Levi-Montalcini
1986	Peace	Elie Wiesel
1986	Physics	Gerd Binnig
1986	Physics	Heinrich Rohrer
1986	Physics	Ernst Ruska
1985	Chemistry	Herbert A. Hauptman
1985	Chemistry	Jerome Karle
1985	Economics	Franco Modigliani
1985	Literature	Claude Simon
1985	Medicine	Michael S. Brown
1985	Medicine	Joseph L. Goldstein
1985	Peace	International Physicians for the Prevention of Nuclear War
1985	Physics	Klaus von Klitzing
1984	Chemistry	Bruce Merrifield
1984	Economics	Richard Stone
1984	Literature	Jaroslav Seifert
1984	Medicine	Niels K. Jerne
1984	Medicine	Georges J.F. KÃ¶hler
1984	Medicine	CÃ©sar Milstein
1984	Peace	Desmond Tutu
1984	Physics	Carlo Rubbia
1984	Physics	Simon van der Meer
1983	Chemistry	Henry Taube
1983	Economics	Gerard Debreu
1983	Literature	William Golding
1983	Medicine	Barbara McClintock
1983	Peace	Lech Walesa
1983	Physics	Subramanyan Chandrasekhar
1983	Physics	William A. Fowler
1982	Chemistry	Aaron Klug
1982	Economics	George J. Stigler
1982	Literature	Gabriel GarcÃ­a MÃ¡rquez
1982	Medicine	Sune K. BergstrÃ¶m
1982	Medicine	Bengt I. Samuelsson
1982	Medicine	John R. Vane
1982	Peace	Alfonso GarcÃ­a Robles
1982	Peace	Alva Myrdal
1982	Physics	Kenneth G. Wilson
1981	Chemistry	Kenichi Fukui
1981	Chemistry	Roald Hoffmann
1981	Economics	James Tobin
1981	Literature	Elias Canetti
1981	Medicine	David H. Hubel
1981	Medicine	Roger W. Sperry
1981	Medicine	Torsten N. Wiesel
1981	Peace	Office of the United Nations High Commissioner for Refugees
1981	Physics	Nicolaas Bloembergen
1981	Physics	Arthur L. Schawlow
1981	Physics	Kai M. Siegbahn
1980	Chemistry	Paul Berg
1980	Chemistry	Walter Gilbert
1980	Chemistry	Frederick Sanger
1980	Economics	Lawrence R. Klein
1980	Literature	Czeslaw Milosz
1980	Medicine	Baruj Benacerraf
1980	Medicine	Jean Dausset
1980	Medicine	George D. Snell
1980	Peace	Adolfo PÃ©rez Esquivel
1980	Physics	James Cronin
1980	Physics	Val Fitch
1979	Chemistry	Herbert C. Brown
1979	Chemistry	Georg Wittig
1979	Economics	Sir Arthur Lewis
1979	Economics	Theodore W. Schultz
1979	Literature	Odysseus Elytis
1979	Medicine	Allan M. Cormack
1979	Medicine	Godfrey N. Hounsfield
1979	Peace	Mother Teresa
1979	Physics	Sheldon Glashow
1979	Physics	Abdus Salam
1979	Physics	Steven Weinberg
1978	Chemistry	Peter Mitchell
1978	Economics	Herbert A. Simon
1978	Literature	Isaac Bashevis Singer
1978	Medicine	Werner Arber
1978	Medicine	Daniel Nathans
1978	Medicine	Hamilton O. Smith
1978	Peace	Anwar al-Sadat
1978	Peace	Menachem Begin
1978	Physics	Pyotr Kapitsa
1978	Physics	Arno Penzias
1978	Physics	Robert Woodrow Wilson
1977	Chemistry	Ilya Prigogine
1977	Economics	James E. Meade
1977	Economics	Bertil Ohlin
1977	Literature	Vicente Aleixandre
1977	Medicine	Roger Guillemin
1977	Medicine	Andrew V. Schally
1977	Medicine	Rosalyn Yalow
1977	Peace	Amnesty International
1977	Physics	Philip W. Anderson
1977	Physics	Sir Nevill F. Mott
1977	Physics	John H. van Vleck
1976	Chemistry	William Lipscomb
1976	Economics	Milton Friedman
1976	Literature	Saul Bellow
1976	Medicine	Baruch S. Blumberg
1976	Medicine	D. Carleton Gajdusek
1976	Peace	Mairead Corrigan
1976	Peace	Betty Williams
1976	Physics	Burton Richter
1976	Physics	Samuel C.C. Ting
1975	Chemistry	John Cornforth
1975	Chemistry	Vladimir Prelog
1975	Economics	Leonid Vitaliyevich Kantorovich
1975	Economics	Tjalling C. Koopmans
1975	Literature	Eugenio Montale
1975	Medicine	David Baltimore
1975	Medicine	Renato Dulbecco
1975	Medicine	Howard M. Temin
1975	Peace	Andrei Sakharov
1975	Physics	Aage N. Bohr
1975	Physics	Ben R. Mottelson
1975	Physics	James Rainwater
1974	Chemistry	Paul J. Flory
1974	Economics	Gunnar Myrdal
1974	Economics	Friedrich August von Hayek
1974	Literature	Eyvind Johnson
1974	Literature	Harry Martinson
1974	Medicine	Albert Claude
1974	Medicine	Christian de Duve
1974	Medicine	George E. Palade
1974	Peace	SeÃ¡n MacBride
1974	Peace	Eisaku Sato
1974	Physics	Antony Hewish
1974	Physics	Martin Ryle
1973	Chemistry	Ernst Otto Fischer
1973	Chemistry	Geoffrey Wilkinson
1973	Economics	Wassily Leontief
1973	Literature	Patrick White
1973	Medicine	Konrad Lorenz
1973	Medicine	Nikolaas Tinbergen
1973	Medicine	Karl von Frisch
1973	Peace	Le Duc Tho
1973	Peace	Henry Kissinger
1973	Physics	Leo Esaki
1973	Physics	Ivar Giaever
1973	Physics	Brian D. Josephson
1972	Chemistry	Christian Anfinsen
1972	Chemistry	Stanford Moore
1972	Chemistry	William H. Stein
1972	Economics	Kenneth J. Arrow
1972	Economics	John R. Hicks
1972	Literature	Heinrich BÃ¶ll
1972	Medicine	Gerald M. Edelman
1972	Medicine	Rodney R. Porter
1972	Physics	John Bardeen
1972	Physics	Leon N. Cooper
1972	Physics	Robert Schrieffer
1971	Chemistry	Gerhard Herzberg
1971	Economics	Simon Kuznets
1971	Literature	Pablo Neruda
1971	Medicine	Earl W. Sutherland, Jr.
1971	Peace	Willy Brandt
1971	Physics	Dennis Gabor
1970	Chemistry	Luis Leloir
1970	Economics	Paul A. Samuelson
1970	Literature	Alexandr Solzhenitsyn
1970	Medicine	Julius Axelrod
1970	Medicine	Sir Bernard Katz
1970	Medicine	Ulf von Euler
1970	Peace	Norman Borlaug
1970	Physics	Hannes AlfvÃ©n
1970	Physics	Louis NÃ©el
1969	Chemistry	Derek Barton
1969	Chemistry	Odd Hassel
1969	Economics	Ragnar Frisch
1969	Economics	Jan Tinbergen
1969	Literature	Samuel Beckett
1969	Medicine	Max DelbrÃ¼ck
1969	Medicine	Alfred D. Hershey
1969	Medicine	Salvador E. Luria
1969	Peace	International Labour Organization
1969	Physics	Murray Gell-Mann
1968	Chemistry	Lars Onsager
1968	Literature	Yasunari Kawabata
1968	Medicine	Robert W. Holley
1968	Medicine	H. Gobind Khorana
1968	Medicine	Marshall W. Nirenberg
1968	Peace	RenÃ© Cassin
1968	Physics	Luis Alvarez
1967	Chemistry	Manfred Eigen
1967	Chemistry	Ronald G.W. Norrish
1967	Chemistry	George Porter
1967	Literature	Miguel Angel Asturias
1967	Medicine	Ragnar Granit
1967	Medicine	Haldan K. Hartline
1967	Medicine	George Wald
1967	Physics	Hans Bethe
1966	Chemistry	Robert S. Mulliken
1966	Literature	Shmuel Agnon
1966	Literature	Nelly Sachs
1966	Medicine	Charles B. Huggins
1966	Medicine	Peyton Rous
1966	Physics	Alfred Kastler
1965	Chemistry	Robert B. Woodward
1965	Literature	Mikhail Sholokhov
1965	Medicine	FranÃ§ois Jacob
1965	Medicine	AndrÃ© Lwoff
1965	Medicine	Jacques Monod
1965	Peace	United Nations Children's Fund
1965	Physics	Richard P. Feynman
1965	Physics	Julian Schwinger
1965	Physics	Sin-Itiro Tomonaga
1964	Chemistry	Dorothy Crowfoot Hodgkin
1964	Literature	Jean-Paul Sartre
1964	Medicine	Konrad Bloch
1964	Medicine	Feodor Lynen
1964	Peace	Martin Luther King Jr.
1964	Physics	Nicolay G. Basov
1964	Physics	Aleksandr M. Prokhorov
1964	Physics	Charles H. Townes
1963	Chemistry	Giulio Natta
1963	Chemistry	Karl Ziegler
1963	Literature	Giorgos Seferis
1963	Medicine	Sir John Eccles
1963	Medicine	Alan L. Hodgkin
1963	Medicine	Andrew F. Huxley
1963	Peace	International Committee of the Red Cross
1963	Peace	League of Red Cross Societies
1963	Physics	Maria Goeppert-Mayer
1963	Physics	J. Hans D. Jensen
1963	Physics	Eugene Wigner
1962	Chemistry	John C. Kendrew
1962	Chemistry	Max F. Perutz
1962	Literature	John Steinbeck
1962	Medicine	Francis Crick
1962	Medicine	James Watson
1962	Medicine	Maurice Wilkins
1962	Peace	Linus Pauling
1962	Physics	Lev Landau
1961	Chemistry	Melvin Calvin
1961	Literature	Ivo Andric
1961	Medicine	Georg von BÃ©kÃ©sy
1961	Peace	Dag HammarskjÃ¶ld
1961	Physics	Robert Hofstadter
1961	Physics	Rudolf MÃ¶ssbauer
1960	Chemistry	Willard F. Libby
1960	Literature	Saint-John Perse
1960	Medicine	Sir Frank Macfarlane Burnet
1960	Medicine	Peter Medawar
1960	Peace	Albert Lutuli
1960	Physics	Donald A. Glaser
1959	Chemistry	Jaroslav Heyrovsky
1959	Literature	Salvatore Quasimodo
1959	Medicine	Arthur Kornberg
1959	Medicine	Severo Ochoa
1959	Peace	Philip Noel-Baker
1959	Physics	Owen Chamberlain
1959	Physics	Emilio SegrÃ¨
1958	Chemistry	Frederick Sanger
1958	Literature	Boris Pasternak
1958	Medicine	George Beadle
1958	Medicine	Joshua Lederberg
1958	Medicine	Edward Tatum
1958	Peace	Georges Pire
1958	Physics	Pavel A. Cherenkov
1958	Physics	IlÂ´ja M. Frank
1958	Physics	Igor Y. Tamm
1957	Chemistry	Lord Todd
1957	Literature	Albert Camus
1957	Medicine	Daniel Bovet
1957	Peace	Lester Bowles Pearson
1957	Physics	Tsung-Dao Lee
1957	Physics	Chen Ning Yang
1956	Chemistry	Sir Cyril Hinshelwood
1956	Chemistry	Nikolay Semenov
1956	Literature	Juan RamÃ³n JimÃ©nez
1956	Medicine	AndrÃ© F. Cournand
1956	Medicine	Werner Forssmann
1956	Medicine	Dickinson W. Richards
1956	Physics	John Bardeen
1956	Physics	Walter H. Brattain
1956	Physics	William B. Shockley
1955	Chemistry	Vincent du Vigneaud
1955	Literature	HalldÃ³r Laxness
1955	Medicine	Hugo Theorell
1955	Physics	Polykarp Kusch
1955	Physics	Willis E. Lamb
1954	Chemistry	Linus Pauling
1954	Literature	Ernest Hemingway
1954	Medicine	John F. Enders
1954	Medicine	Frederick C. Robbins
1954	Medicine	Thomas H. Weller
1954	Peace	Office of the United Nations High Commissioner for Refugees
1954	Physics	Max Born
1954	Physics	Walther Bothe
1953	Chemistry	Hermann Staudinger
1953	Literature	Winston Churchill
1953	Medicine	Hans Krebs
1953	Medicine	Fritz Lipmann
1953	Peace	George C. Marshall
1953	Physics	Frits Zernike
1952	Chemistry	Archer J.P. Martin
1952	Chemistry	Richard L.M. Synge
1952	Literature	FranÃ§ois Mauriac
1952	Medicine	Selman A. Waksman
1952	Peace	Albert Schweitzer
1952	Physics	Felix Bloch
1952	Physics	E. M. Purcell
1951	Chemistry	Edwin M. McMillan
1951	Chemistry	Glenn T. Seaborg
1951	Literature	PÃ¤r Lagerkvist
1951	Medicine	Max Theiler
1951	Peace	LÃ©on Jouhaux
1951	Physics	John Cockcroft
1951	Physics	Ernest T.S. Walton
1950	Chemistry	Kurt Alder
1950	Chemistry	Otto Diels
1950	Literature	Bertrand Russell
1950	Medicine	Philip S. Hench
1950	Medicine	Edward C. Kendall
1950	Medicine	Tadeus Reichstein
1950	Peace	Ralph Bunche
1950	Physics	Cecil Powell
1949	Chemistry	William F. Giauque
1949	Literature	William Faulkner
1949	Medicine	Walter Hess
1949	Medicine	Egas Moniz
1949	Peace	Lord Boyd Orr
1949	Physics	Hideki Yukawa
1948	Chemistry	Arne Tiselius
1948	Literature	T.S. Eliot
1948	Medicine	Paul MÃ¼ller
1948	Physics	Patrick M.S. Blackett
1947	Chemistry	Sir Robert Robinson
1947	Literature	AndrÃ© Gide
1947	Medicine	Carl Cori
1947	Medicine	Gerty Cori
1947	Medicine	Bernardo Houssay
1947	Peace	Friends Service Council
1947	Peace	American Friends Service Committee
1947	Physics	Edward V. Appleton
1946	Chemistry	John H. Northrop
1946	Chemistry	Wendell M. Stanley
1946	Chemistry	James B. Sumner
1946	Literature	Hermann Hesse
1946	Medicine	Hermann J. Muller
1946	Peace	Emily Greene Balch
1946	Peace	John R. Mott
1946	Physics	Percy W. Bridgman
1945	Chemistry	Artturi Virtanen
1945	Literature	Gabriela Mistral
1945	Medicine	Ernst B. Chain
1945	Medicine	Sir Alexander Fleming
1945	Medicine	Sir Howard Florey
1945	Peace	Cordell Hull
1945	Physics	Wolfgang Pauli
1944	Chemistry	Otto Hahn
1944	Literature	Johannes V. Jensen
1944	Medicine	Joseph Erlanger
1944	Medicine	Herbert S. Gasser
1944	Peace	International Committee of the Red Cross
1944	Physics	Isidor Isaac Rabi
1943	Chemistry	George de Hevesy
1943	Medicine	Henrik Dam
1943	Medicine	Edward A. Doisy
1943	Physics	Otto Stern
1939	Chemistry	Adolf Butenandt
1939	Chemistry	Leopold Ruzicka
1939	Literature	Frans Eemil SillanpÃ¤Ã¤
1939	Medicine	Gerhard Domagk
1939	Physics	Ernest Lawrence
1938	Chemistry	Richard Kuhn
1938	Literature	Pearl Buck
1938	Medicine	Corneille Heymans
1938	Peace	Nansen International Office for Refugees
1938	Physics	Enrico Fermi
1937	Chemistry	Norman Haworth
1937	Chemistry	Paul Karrer
1937	Literature	Roger Martin du Gard
1937	Medicine	Albert Szent-GyÃ¶rgyi
1937	Peace	Robert Cecil
1937	Physics	Clinton Davisson
1937	Physics	George Paget Thomson
1936	Chemistry	Peter Debye
1936	Literature	Eugene O'Neill
1936	Medicine	Sir Henry Dale
1936	Medicine	Otto Loewi
1936	Peace	Carlos Saavedra Lamas
1936	Physics	Carl D. Anderson
1936	Physics	Victor F. Hess
1935	Chemistry	FrÃ©dÃ©ric Joliot
1935	Chemistry	IrÃ¨ne Joliot-Curie
1935	Medicine	Hans Spemann
1935	Peace	Carl von Ossietzky
1935	Physics	James Chadwick
1934	Chemistry	Harold C. Urey
1934	Literature	Luigi Pirandello
1934	Medicine	George R. Minot
1934	Medicine	William P. Murphy
1934	Medicine	George H. Whipple
1934	Peace	Arthur Henderson
1933	Literature	Ivan Bunin
1933	Medicine	Thomas H. Morgan
1933	Peace	Sir Norman Angell
1933	Physics	Paul A.M. Dirac
1933	Physics	Erwin SchrÃ¶dinger
1932	Chemistry	Irving Langmuir
1932	Literature	John Galsworthy
1932	Medicine	Edgar Adrian
1932	Medicine	Sir Charles Sherrington
1932	Physics	Werner Heisenberg
1931	Chemistry	Friedrich Bergius
1931	Chemistry	Carl Bosch
1931	Literature	Erik Axel Karlfeldt
1931	Medicine	Otto Warburg
1931	Peace	Jane Addams
1931	Peace	Nicholas Murray Butler
1930	Chemistry	Hans Fischer
1930	Literature	Sinclair Lewis
1930	Medicine	Karl Landsteiner
1930	Peace	Nathan SÃ¶derblom
1930	Physics	Sir Venkata Raman
1929	Chemistry	Arthur Harden
1929	Chemistry	Hans von Euler-Chelpin
1929	Literature	Thomas Mann
1929	Medicine	Christiaan Eijkman
1929	Medicine	Sir Frederick Hopkins
1929	Peace	Frank B. Kellogg
1929	Physics	Louis de Broglie
1928	Chemistry	Adolf Windaus
1928	Literature	Sigrid Undset
1928	Medicine	Charles Nicolle
1928	Physics	Owen Willans Richardson
1927	Chemistry	Heinrich Wieland
1927	Literature	Henri Bergson
1927	Medicine	Julius Wagner-Jauregg
1927	Peace	Ferdinand Buisson
1927	Peace	Ludwig Quidde
1927	Physics	Arthur H. Compton
1927	Physics	C.T.R. Wilson
1926	Chemistry	The Svedberg
1926	Literature	Grazia Deledda
1926	Medicine	Johannes Fibiger
1926	Peace	Aristide Briand
1926	Peace	Gustav Stresemann
1926	Physics	Jean Baptiste Perrin
1925	Chemistry	Richard Zsigmondy
1925	Literature	George Bernard Shaw
1925	Peace	Sir Austen Chamberlain
1925	Peace	Charles G. Dawes
1925	Physics	James Franck
1925	Physics	Gustav Hertz
1924	Literature	Wladyslaw Reymont
1924	Medicine	Willem Einthoven
1924	Physics	Manne Siegbahn
1923	Chemistry	Fritz Pregl
1923	Literature	William Butler Yeats
1923	Medicine	Frederick G. Banting
1923	Medicine	John Macleod
1923	Physics	Robert A. Millikan
1922	Chemistry	Francis W. Aston
1922	Literature	Jacinto Benavente
1922	Medicine	Archibald V. Hill
1922	Medicine	Otto Meyerhof
1922	Peace	Fridtjof Nansen
1922	Physics	Niels Bohr
1921	Chemistry	Frederick Soddy
1921	Literature	Anatole France
1921	Peace	Hjalmar Branting
1921	Peace	Christian Lange
1921	Physics	Albert Einstein
1920	Chemistry	Walther Nernst
1920	Literature	Knut Hamsun
1920	Medicine	August Krogh
1920	Peace	LÃ©on Bourgeois
1920	Physics	Charles Edouard Guillaume
1919	Literature	Carl Spitteler
1919	Medicine	Jules Bordet
1919	Peace	Woodrow Wilson
1919	Physics	Johannes Stark
1918	Chemistry	Fritz Haber
1918	Physics	Max Planck
1917	Literature	Karl Gjellerup
1917	Literature	Henrik Pontoppidan
1917	Peace	International Committee of the Red Cross
1917	Physics	Charles Glover Barkla
1916	Literature	Verner von Heidenstam
1915	Chemistry	Richard WillstÃ¤tter
1915	Literature	Romain Rolland
1915	Physics	William Bragg
1915	Physics	Lawrence Bragg
1914	Chemistry	Theodore W. Richards
1914	Medicine	Robert BÃ¡rÃ¡ny
1914	Physics	Max von Laue
1913	Chemistry	Alfred Werner
1913	Literature	Rabindranath Tagore
1913	Medicine	Charles Richet
1913	Peace	Henri La Fontaine
1913	Physics	Heike Kamerlingh Onnes
1912	Chemistry	Victor Grignard
1912	Chemistry	Paul Sabatier
1912	Literature	Gerhart Hauptmann
1912	Medicine	Alexis Carrel
1912	Peace	Elihu Root
1912	Physics	Gustaf DalÃ©n
1911	Chemistry	Marie Curie
1911	Literature	Maurice Maeterlinck
1911	Medicine	Allvar Gullstrand
1911	Peace	Tobias Asser
1911	Peace	Alfred Fried
1911	Physics	Wilhelm Wien
1910	Chemistry	Otto Wallach
1910	Literature	Paul Heyse
1910	Medicine	Albrecht Kossel
1910	Peace	Permanent International Peace Bureau
1910	Physics	Johannes Diderik van der Waals
1909	Chemistry	Wilhelm Ostwald
1909	Literature	Selma LagerlÃ¶f
1909	Medicine	Theodor Kocher
1909	Peace	Auguste Beernaert
1909	Peace	Paul Henri d'Estournelles de Constant
1909	Physics	Ferdinand Braun
1909	Physics	Guglielmo Marconi
1908	Chemistry	Ernest Rutherford
1908	Literature	Rudolf Eucken
1908	Medicine	Paul Ehrlich
1908	Medicine	Ilya Mechnikov
1908	Peace	Klas Pontus Arnoldson
1908	Peace	Fredrik Bajer
1908	Physics	Gabriel Lippmann
1907	Chemistry	Eduard Buchner
1907	Literature	Rudyard Kipling
1907	Medicine	Alphonse Laveran
1907	Peace	Ernesto Teodoro Moneta
1907	Peace	Louis Renault
1907	Physics	Albert A. Michelson
1906	Chemistry	Henri Moissan
1906	Literature	GiosuÃ¨ Carducci
1906	Medicine	Camillo Golgi
1906	Medicine	Santiago RamÃ³n y Cajal
1906	Peace	Theodore Roosevelt
1906	Physics	J.J. Thomson
1905	Chemistry	Adolf von Baeyer
1905	Literature	Henryk Sienkiewicz
1905	Medicine	Robert Koch
1905	Peace	Bertha von Suttner
1905	Physics	Philipp Lenard
1904	Chemistry	Sir William Ramsay
1904	Literature	JosÃ© Echegaray
1904	Literature	FrÃ©dÃ©ric Mistral
1904	Medicine	Ivan Pavlov
1904	Peace	Institute of International Law
1904	Physics	Lord Rayleigh
1903	Chemistry	Svante Arrhenius
1903	Literature	BjÃ¸rnstjerne BjÃ¸rnson
1903	Medicine	Niels Ryberg Finsen
1903	Peace	Randal Cremer
1903	Physics	Henri Becquerel
1903	Physics	Pierre Curie
1903	Physics	Marie Curie
1902	Chemistry	Emil Fischer
1902	Literature	Theodor Mommsen
1902	Medicine	Ronald Ross
1902	Peace	Ã‰lie Ducommun
1902	Peace	Albert Gobat
1902	Physics	Hendrik A. Lorentz
1902	Physics	Pieter Zeeman
1901	Chemistry	Jacobus H. van 't Hoff
1901	Literature	Sully Prudhomme
1901	Medicine	Emil von Behring
1901	Peace	Henry Dunant
1901	Peace	FrÃ©dÃ©ric Passy
1901	Physics	Wilhelm Conrad RÃ¶ntgen
\.

COPY routes (num, company, pos, stop_id) FROM stdin;
1	LRT	1	137
1	LRT	2	99
1	LRT	3	59
1	LRT	4	66
1	LRT	5	42
1	LRT	6	48
1	LRT	7	223
1	LRT	8	92
1	LRT	9	205
1	LRT	10	80
1	LRT	11	137
2	LRT	1	173
2	LRT	2	191
2	LRT	3	50
2	LRT	4	137
2	LRT	5	141
2	LRT	6	194
2	LRT	7	115
2	LRT	8	48
2	LRT	9	31
2	LRT	10	31
2	LRT	11	223
2	LRT	12	101
2	LRT	13	115
2	LRT	14	107
2	LRT	15	192
2	LRT	16	54
2	LRT	17	173
2A	LRT	1	173
2A	LRT	2	191
2A	LRT	3	50
2A	LRT	4	137
2A	LRT	5	141
2A	LRT	6	194
2A	LRT	7	115
2A	LRT	8	48
2A	LRT	9	31
2A	LRT	10	109
2A	LRT	11	31
2A	LRT	12	223
2A	LRT	13	101
2A	LRT	14	115
2A	LRT	15	107
2A	LRT	16	192
2A	LRT	17	54
2A	LRT	18	173
3	LRT	1	154
3	LRT	2	62
3	LRT	3	97
3	LRT	4	194
3	LRT	5	115
3	LRT	6	101
3	LRT	7	213
3	LRT	8	244
3	LRT	9	44
3A	LRJ	1	100
3A	LRJ	2	172
3A	LRJ	3	62
3A	LRJ	4	65
3A	LRJ	5	29
3A	LRJ	6	194
3A	LRJ	7	115
3A	LRJ	8	101
3A	LRJ	9	213
3A	LRJ	10	244
3A	LRJ	11	44
4	LRT	1	19
4	LRT	2	177
4	LRT	3	149
4	LRT	4	194
4	LRT	5	115
4	LRT	6	53
4	LRT	7	179
4	LRT	8	85
4	LRT	9	117
5	LRT	1	24
5	LRT	2	46
5	LRT	3	179
5	LRT	4	160
5	LRT	5	103
5	LRT	6	29
5	LRT	7	149
5	LRT	8	177
5	LRT	9	161
5	LRT	10	34
6	LRT	1	137
6	LRT	2	80
6	LRT	3	205
6	LRT	4	92
6	LRT	5	48
6	LRT	6	223
6	LRT	7	42
6	LRT	8	66
6	LRT	9	59
6	LRT	10	99
6	LRT	11	137
7	LRT	1	167
7	LRT	2	137
7	LRT	3	141
7	LRT	4	29
7	LRT	5	142
7	LRT	6	102
7	LRT	7	38
7A	LRT	1	206
7A	LRT	2	239
7A	LRT	3	99
7A	LRT	4	37
7A	LRT	5	15
7A	LRT	6	29
7A	LRT	7	142
7A	LRT	8	102
7A	LRT	9	38
8	LRT	1	96
8	LRT	2	29
8	LRT	3	15
8	LRT	4	37
8	LRT	5	99
8	LRT	6	105
8	LRT	7	162
8	LRT	8	215
9	LRT	1	121
9	LRT	2	96
9	LRT	3	29
9	LRT	4	15
9	LRT	5	37
9	LRT	6	99
9	LRT	7	105
9	LRT	8	162
9	LRT	9	215
10	LRT	1	215
10	LRT	2	162
10	LRT	3	167
10	LRT	4	137
10	LRT	5	141
10	LRT	6	194
10	LRT	7	230
10	LRT	8	53
10	LRT	9	46
10	LRT	10	231
11	LRT	1	167
11	LRT	2	186
11	LRT	3	230
11	LRT	4	160
11	LRT	5	85
11	LRT	6	38
12	LRT	1	173
12	LRT	2	54
12	LRT	3	192
12	LRT	4	107
12	LRT	5	115
12	LRT	6	101
12	LRT	7	223
12	LRT	8	31
12	LRT	9	109
12	LRT	10	31
12	LRT	11	48
12	LRT	12	115
12	LRT	13	194
12	LRT	14	141
12	LRT	15	137
12	LRT	16	50
12	LRT	17	191
12	LRT	18	173
13	LRT	1	148
13	LRT	2	80
13	LRT	3	150
13	LRT	4	39
13	LRT	5	198
13	LRT	6	22
14	LRT	1	215
14	LRT	2	162
14	LRT	3	28
14	LRT	4	99
14	LRT	5	137
14	LRT	6	141
14	LRT	7	29
14	LRT	8	192
14	LRT	9	54
14	LRT	10	173
14	LRT	11	166
14	LRT	12	215
15	LRT	1	226
15	LRT	2	163
15	LRT	3	82
15	LRT	4	191
15	LRT	5	149
15	LRT	6	194
15	LRT	7	230
15	LRT	8	160
15	LRT	9	85
16	LRT	1	167
16	LRT	2	140
16	LRT	3	141
16	LRT	4	194
16	LRT	5	230
16	LRT	6	160
16	LRT	7	179
16	LRT	8	120
16	SMT	1	219
16	SMT	2	48
16	SMT	3	109
16	SMT	4	165
16	SMT	5	32
16	SMT	6	236
16	SMT	7	14
16	SMT	8	5
16	SMT	9	23
17	LRT	1	167
17	LRT	2	137
17	LRT	3	141
17	LRT	4	194
17	LRT	5	230
17	LRT	6	160
17	LRT	7	179
18	SMT	1	219
18	SMT	2	48
18	SMT	3	109
18	SMT	4	165
18	SMT	5	32
18	SMT	6	236
18	SMT	7	14
18	SMT	8	246
19	SMT	1	14
19	SMT	2	68
19	SMT	3	69
19	SMT	4	132
19	SMT	5	236
19	SMT	6	32
19	SMT	7	165
19	SMT	8	48
19	SMT	9	219
19	LRT	1	28
19	LRT	2	59
19	LRT	3	47
19	LRT	4	178
19	LRT	5	39
19	LRT	6	95
19	LRT	7	15
19	LRT	8	37
19	LRT	9	99
19	LRT	10	28
19A	LRT	1	28
19A	LRT	2	59
19A	LRT	3	47
19A	LRT	4	95
19A	LRT	5	37
19A	LRT	6	99
19A	LRT	7	28
20	LRT	1	105
20	LRT	2	59
20	LRT	3	225
20	LRT	4	95
20	LRT	5	149
20	LRT	6	147
20	LRT	7	200
20	LRT	8	191
20	LRT	9	82
21	LRT	1	109
21	LRT	2	31
21	LRT	3	223
21	LRT	4	101
21	LRT	5	115
21	LRT	6	194
21	LRT	7	29
21	LRT	8	222
21	LRT	9	192
21	LRT	10	54
21	LRT	11	108
22	LRT	1	167
22	LRT	2	137
22	LRT	3	141
22	LRT	4	219
22	LRT	5	115
22	LRT	6	101
22	LRT	7	223
22	LRT	8	213
22A	LRT	1	139
22A	LRT	2	141
22A	LRT	3	219
22A	LRT	4	115
22A	LRT	5	101
22A	LRT	6	223
22A	LRT	7	213
22A	LRT	8	201
23	LRT	1	234
23	LRT	2	37
23	LRT	3	112
23	LRT	4	230
23	LRT	5	160
23	LRT	6	51
24	LRT	1	80
24	LRT	2	219
24	LRT	3	230
24	LRT	4	153
24	LRT	5	21
24	LRT	6	36
25	LRT	1	167
25	LRT	2	168
25	LRT	3	137
25	LRT	4	141
25	LRT	5	219
25	LRT	6	115
25	LRT	7	101
25	LRT	8	223
25	LRT	9	213
26	LRT	1	43
26	LRT	2	42
26	LRT	3	48
26	LRT	4	115
26	LRT	5	194
26	LRT	6	199
26	LRT	7	191
26	LRT	8	82
26	LRT	9	163
26	LRT	10	193
26	LRT	11	190
26	LRT	12	212
26A	LRT	1	43
26A	LRT	2	42
26A	LRT	3	48
26A	LRT	4	115
26A	LRT	5	194
26A	LRT	6	149
26A	LRT	7	191
26A	LRT	8	82
26A	LRT	9	163
26A	LRT	10	193
26A	LRT	11	233
27	LRT	1	215
27	LRT	2	59
27	LRT	3	37
27	LRT	4	112
27	LRT	5	230
27	LRT	6	53
27	LRT	7	179
27	LRT	8	120
27	MID	1	246
27	MID	2	20
27	MID	3	145
27	MID	4	157
27	MID	5	77
27	MID	6	213
27	MID	7	219
28	LRT	1	162
28	LRT	2	70
28	LRT	3	59
28	LRT	4	47
28	LRT	5	112
28	LRT	6	92
28	LRT	7	152
28	LRT	8	244
28	LRT	9	44
29	LOW	1	219
29	LOW	2	65
29	LOW	3	62
29	LOW	4	181
29	LOW	5	136
29	LOW	6	76
29	LOW	7	220
29	LOW	8	4
29	LOW	9	125
30	LOW	1	219
30	LOW	2	65
30	LOW	3	62
30	LOW	4	181
30	LOW	5	136
30	LOW	6	76
30	LOW	7	220
30	LOW	8	126
30	LRT	1	100
30	LRT	2	170
30	LRT	3	154
30	LRT	4	62
30	LRT	5	65
30	LRT	6	29
30	LRT	7	194
30	LRT	8	115
30	LRT	9	101
30	LRT	10	213
30	LRT	11	244
30	LRT	12	44
31	LRT	1	89
31	LRT	2	96
31	LRT	3	121
31	LRT	4	142
31	LRT	5	29
31	LRT	6	194
31	LRT	7	115
31	LRT	8	48
31	LRT	9	78
32	LRT	1	173
32	LRT	2	33
32	LRT	3	191
32	LRT	4	50
32	LRT	5	200
32	LRT	6	137
32	LRT	7	167
32	LRT	8	105
32	LRT	9	162
32	LRT	10	70
32	LRT	11	42
32	LRT	12	48
32	LRT	13	31
32	LRT	14	213
32	LRT	15	244
32	LRT	16	46
32	LRT	17	179
32	LRT	18	85
32	LRT	19	121
32	LRT	20	96
32	LRT	21	36
32	LRT	22	54
32	LRT	23	173
33	LRT	1	89
33	LRT	2	36
33	LRT	3	29
33	LRT	4	194
33	LRT	5	115
33	LRT	6	101
33	LRT	7	152
33	LRT	8	245
33	LRT	9	243
33	LRT	10	9
34	LRT	1	213
34	LRT	2	101
34	LRT	3	92
34	LRT	4	39
34	LRT	5	225
34	LRT	6	37
34	LRT	7	26
34	LRT	8	137
34	LRT	9	147
34	LRT	10	149
34	LRT	11	176
34	LRT	12	116
34	LRT	13	92
34	LRT	14	152
34	LRT	15	213
35	LRT	1	213
35	LRT	2	152
35	LRT	3	92
35	LRT	4	116
35	LRT	5	176
35	LRT	6	149
35	LRT	7	147
35	LRT	8	137
35	LRT	9	26
35	LRT	10	37
35	LRT	11	225
35	LRT	12	39
35	LRT	13	92
35	LRT	14	101
35	LRT	15	213
36	LRT	1	109
36	LRT	2	48
36	LRT	3	115
36	LRT	4	194
36	LRT	5	29
36	LRT	6	36
36	LRT	7	55
37	LRT	1	105
37	LRT	2	37
37	LRT	3	112
37	LRT	4	230
37	LRT	5	160
37	LRT	6	51
37	SMT	1	219
37	SMT	2	115
37	SMT	3	48
37	SMT	4	98
37	SMT	5	197
37	SMT	6	131
37	SMT	7	77
37	SMT	8	157
37	SMT	9	145
38	LRT	1	192
38	LRT	2	36
38	LRT	3	242
38	LRT	4	21
38	LRT	5	160
38	LRT	6	164
38	LRT	7	101
38	LRT	8	198
38	LRT	9	52
38	LRT	10	59
38	MID	1	219
38	MID	2	115
38	MID	3	48
38	MID	4	109
38	MID	5	165
38	MID	6	130
38	MID	7	250
38	MID	8	143
38	MID	9	188
38	MID	10	87
38	MID	11	224
40	LRT	1	21
40	LRT	2	153
40	LRT	3	112
40	LRT	4	40
40	LRT	5	196
40	LRT	6	66
40	LRT	7	57
41	LRT	1	41
41	LRT	2	160
41	LRT	3	21
41	LRT	4	153
41	LRT	5	112
41	LRT	6	39
41	LRT	7	196
41	LRT	8	66
41	LRT	9	13
41	LRT	10	57
42	LRT	1	36
42	LRT	2	54
42	LRT	3	71
42	LRT	4	191
42	LRT	5	50
42	LRT	6	147
42	LRT	7	149
42	LRT	8	219
42	LRT	9	242
42	LRT	10	36
43	SMT	1	219
43	SMT	2	196
43	SMT	3	13
43	SMT	4	64
43	SMT	5	218
43	SMT	6	208
43	LRT	1	237
43	LRT	2	163
43	LRT	3	158
43	LRT	4	149
43	LRT	5	194
43	LRT	6	115
43	LRT	7	216
43	LRT	8	128
43	LRT	9	60
43	LRT	10	10
43	LRT	11	11
43	LRT	12	45
44	LRT	1	45
44	LRT	2	11
44	LRT	3	10
44	LRT	4	60
44	LRT	5	128
44	LRT	6	216
44	LRT	7	115
44	LRT	8	194
44	LRT	9	149
44	LRT	10	158
44	LRT	11	163
44	LRT	12	238
45	LRT	1	33
45	LRT	2	71
45	LRT	3	177
45	LRT	4	149
45	LRT	5	112
45	LRT	6	230
45	LRT	7	53
45	LRT	8	46
45	LRT	9	60
45	LRT	10	201
46A	LRT	1	36
46A	LRT	2	242
46A	LRT	3	219
46A	LRT	4	149
46A	LRT	5	147
46A	LRT	6	50
46A	LRT	7	191
46A	LRT	8	71
46A	LRT	9	54
46A	LRT	10	36
47	LRT	1	37
47	LRT	2	112
47	LRT	3	230
47	LRT	4	53
47	LRT	5	46
47	LRT	6	60
47	LRT	7	10
47	LRT	8	45
47	LRT	9	11
47	MID	1	219
47	MID	2	196
47	MID	3	13
47	MID	4	64
47	MID	5	218
47	MID	6	25
47	MID	7	104
47	MID	8	87
48	WIL	1	48
48	WIL	2	56
48	WIL	3	109
48	WIL	4	235
49	SMT	1	191
49	SMT	2	177
49	SMT	3	249
49	SMT	4	155
49	SMT	5	133
51	LRT	1	160
51	LRT	2	103
51	LRT	3	29
51	LRT	4	149
51	LRT	5	177
51	LRT	6	159
51	LRT	7	7
52	LRT	1	173
52	LRT	2	54
52	LRT	3	36
52	LRT	4	96
52	LRT	5	121
52	LRT	6	85
52	LRT	7	179
52	LRT	8	46
52	LRT	9	244
52	LRT	10	213
52	LRT	11	31
52	LRT	12	48
52	LRT	13	42
52	LRT	14	70
52	LRT	15	162
52	LRT	16	105
52	LRT	17	167
52	LRT	18	137
52	LRT	19	200
52	LRT	20	191
52	LRT	21	50
52	LRT	22	33
52	LRT	23	173
53	FS	1	175
53	FS	2	94
53	FS	3	39
53	FS	4	22
53	FS	5	13
53	FS	6	91
53	FS	7	124
53	FS	8	61
55	FS	1	219
55	FS	2	196
55	FS	3	13
55	FS	4	91
55	FS	5	124
55	FS	6	204
55	FS	7	75
55	FS	8	127
55	LRT	1	215
55	LRT	2	59
55	LRT	3	47
55	LRT	4	219
56	FF	1	219
56	FF	2	196
56	FF	3	13
56	FF	4	91
56	FF	5	75
56	FF	6	49
56	FF	7	12
58	LRT	1	109
58	LRT	2	217
58	LRT	3	111
58	LRT	4	128
58	LRT	5	122
59	LRT	1	109
59	LRT	2	217
59	LRT	3	245
60	JM	1	72
60	JM	2	30
61	LRT	1	219
61	LRT	2	115
61	LRT	3	101
61	LRT	4	213
61	LRT	5	60
61	SMT	1	219
61	SMT	2	115
61	SMT	3	101
61	SMT	4	213
61	SMT	5	201
62	LOW	1	219
62	LOW	2	142
62	LOW	3	18
62	LOW	4	184
62	LOW	5	182
62	LOW	6	123
62	LOW	7	93
62	LOW	8	156
63	LRT	1	6
63	LRT	2	33
63	LRT	3	159
63	LRT	4	177
63	LRT	5	149
63	LRT	6	219
63	LRT	7	115
63	LRT	8	48
63	LRT	9	31
63	LRT	10	109
64	SMT	1	39
64	SMT	2	95
64	SMT	3	219
64	SMT	4	29
64	SMT	5	142
64	SMT	6	18
64	SMT	7	184
64	SMT	8	134
64A	SMT	1	39
64A	SMT	2	95
64A	SMT	3	219
64A	SMT	4	29
64A	SMT	5	142
64A	SMT	6	146
64A	SMT	7	18
64A	SMT	8	184
64A	SMT	9	134
65	LRT	1	200
65	LRT	2	147
65	LRT	3	149
65	LRT	4	194
65	LRT	5	115
65	LRT	6	101
65	LRT	7	213
65	LRT	8	201
65	SMT	1	39
65	SMT	2	219
65	SMT	3	29
65	SMT	4	142
65	SMT	5	146
65	SMT	6	18
65	SMT	7	203
65	SMT	8	184
65	SMT	9	67
66	SMT	1	237
66	SMT	2	163
66	SMT	3	191
66	SMT	4	149
66	SMT	5	194
66	SMT	6	115
66	SMT	7	216
66	SMT	8	128
66	SMT	9	60
66	SMT	10	10
66	SMT	11	45
66A	SMT	1	212
66A	SMT	2	190
66A	SMT	3	193
66A	SMT	4	163
66A	SMT	5	191
66A	SMT	6	149
66A	SMT	7	194
66A	SMT	8	115
66A	SMT	9	216
66A	SMT	10	128
66A	SMT	11	60
66A	SMT	12	10
66A	SMT	13	45
69	LRT	1	42
69	LRT	2	48
69	LRT	3	115
69	LRT	4	194
69	LRT	5	29
69	LRT	6	55
74	SMT	1	115
74	SMT	2	194
74	SMT	3	29
74	SMT	4	142
74	SMT	5	146
74	SMT	6	135
74	SMT	7	189
74	SMT	8	27
74	SMT	9	62
75	LRT	1	115
75	LRT	2	194
75	LRT	3	149
75	LRT	4	158
75	LRT	5	163
75	LRT	6	226
75	LRT	7	209
77	SMT	1	115
77	SMT	2	29
77	SMT	3	142
77	SMT	4	27
77	SMT	5	189
79	SMT	1	39
79	SMT	2	194
79	SMT	3	29
79	SMT	4	36
79	SMT	5	65
79	SMT	6	62
79	SMT	7	84
79	SMT	8	27
79	SMT	9	189
79	SMT	10	202
80	LRT	1	189
80	LRT	2	27
80	LRT	3	135
80	LRT	4	142
80	LRT	5	29
80	LRT	6	194
80	LRT	7	225
80	LRT	8	47
80	LRT	9	52
80	LRT	10	70
80	LRT	11	59
80	LRT	12	215
80A	LRT	1	189
80A	LRT	2	27
80A	LRT	3	135
80A	LRT	4	142
80A	LRT	5	29
80A	LRT	6	194
80A	LRT	7	225
80A	LRT	8	47
80A	LRT	9	59
80A	LRT	10	215
80B	LRT	1	189
80B	LRT	2	27
80B	LRT	3	135
80B	LRT	4	142
80B	LRT	5	29
80B	LRT	6	194
80B	LRT	7	225
80B	LRT	8	47
80B	LRT	9	52
80B	LRT	10	70
80B	LRT	11	66
80B	LRT	12	215
80	SMT	1	115
80	SMT	2	194
80	SMT	3	29
80	SMT	4	96
80	SMT	5	62
80	SMT	6	84
80	SMT	7	171
80	SMT	8	100
81	LRT	1	67
81	LRT	2	184
81	LRT	3	142
81	LRT	4	29
81	LRT	5	219
81	LRT	6	47
81	LRT	7	59
81	LRT	8	162
81	LRT	9	219
81	LRT	10	47
81	LRT	11	59
81	LRT	12	162
81A	LRT	1	67
81A	LRT	2	184
81A	LRT	3	146
81A	LRT	4	142
81A	LRT	5	29
81A	LRT	6	219
81A	LRT	7	47
81A	LRT	8	59
81A	LRT	9	162
81A	LRT	10	219
81A	LRT	11	47
81A	LRT	12	59
81A	LRT	13	162
82	LRT	1	202
82	LRT	2	189
82	LRT	3	27
82	LRT	4	62
82	LRT	5	65
82	LRT	6	36
82	LRT	7	29
82	LRT	8	219
82	LRT	9	196
82	LRT	10	13
82	LRT	11	78
84	LRT	1	209
84	LRT	2	191
84	LRT	3	82
84	LRT	4	163
84	LRT	5	237
84	LRT	6	247
84	LRT	7	62
85	LRT	1	42
85	LRT	2	48
85	LRT	3	115
85	LRT	4	194
85	LRT	5	199
85	LRT	6	191
85	LRT	7	163
85	LRT	8	233
85	SMT	1	39
85	SMT	2	194
85	SMT	3	219
85	SMT	4	29
85	SMT	5	36
85	SMT	6	65
85	SMT	7	62
85	SMT	8	154
85	SMT	9	171
85	SMT	10	100
86	LRT	1	42
86	LRT	2	48
86	LRT	3	115
86	LRT	4	194
86	LRT	5	199
86	LRT	6	191
86	LRT	7	163
86	LRT	8	193
86	LRT	9	233
86	SMT	1	43
86	SMT	2	42
86	SMT	3	48
86	SMT	4	115
86	SMT	5	194
86	SMT	6	29
86	SMT	7	36
86	SMT	8	65
86	SMT	9	62
86	SMT	10	154
86A	LRT	1	240
86A	LRT	2	115
86A	LRT	3	48
86A	LRT	4	83
87	LRT	1	209
87	LRT	2	137
87	LRT	3	147
87	LRT	4	149
87	LRT	5	29
87	LRT	6	142
87	LRT	7	146
87	LRT	8	18
87	LRT	9	184
87	LRT	10	134
87	SMT	1	171
87	SMT	2	154
87	SMT	3	62
87	SMT	4	96
87	SMT	5	29
87	SMT	6	219
87	SMT	7	141
87	SMT	8	137
87A	LRT	1	210
87A	LRT	2	147
87A	LRT	3	149
87A	LRT	4	29
87A	LRT	5	142
87A	LRT	6	146
87A	LRT	7	203
93	SMT	1	6
93	SMT	2	166
93	SMT	3	163
93	SMT	4	233
94	LOW	1	156
94	LOW	2	93
94	LOW	3	227
94	LOW	4	96
94	LOW	5	169
94	LOW	6	219
95	LOW	1	219
95	LOW	2	65
95	LOW	3	62
95	LOW	4	84
95	LOW	5	171
95	LOW	6	227
95	LOW	7	93
95	LOW	8	211
95	LOW	9	114
100	LRT	1	240
100	LRT	2	115
100	LRT	3	48
100	LRT	4	83
100	MAC	1	219
100	MAC	2	160
100	MAC	3	184
100	MAC	4	241
100	MAC	5	17
100	MAC	6	2
100	MAC	7	229
100	MAC	8	73
106	SMT	1	115
106	SMT	2	194
106	SMT	3	149
106	SMT	4	158
106	SMT	5	163
106	SMT	6	233
106	SMT	7	110
106	SMT	8	3
106	SMT	9	74
113	SMT	1	219
113	SMT	2	149
113	SMT	3	158
113	SMT	4	163
113	SMT	5	187
113	SMT	6	237
113	SMT	7	233
113	SMT	8	183
124	SMT	1	39
124	SMT	2	95
124	SMT	3	219
124	SMT	4	149
124	SMT	5	158
124	SMT	6	163
124	SMT	7	193
124	SMT	8	151
124	SMT	9	1
124	SMT	10	174
129	SMT	1	215
129	SMT	2	90
129	SMT	3	59
129	SMT	4	47
129	SMT	5	178
129	SMT	6	219
129	SMT	7	191
129	SMT	8	163
129	SMT	9	193
129	SMT	10	190
129	SMT	11	212
134	SMT	1	219
134	SMT	2	29
134	SMT	3	36
134	SMT	4	65
134	SMT	5	163
134	SMT	6	247
134	SMT	7	62
137	SMT	1	219
137	SMT	2	115
137	SMT	3	48
137	SMT	4	235
137	SMT	5	98
137	SMT	6	197
137	SMT	7	63
137	SMT	8	248
142	SMJ	1	6
142	SMJ	2	166
142	SMJ	3	163
142	SMJ	4	65
142	SMJ	5	62
142	SMJ	6	86
142	SMJ	7	119
251	CCC	1	219
251	CCC	2	158
251	CCC	3	110
251	CCC	4	79
251	CCC	5	74
251	CCC	6	16
275	SMT	1	219
275	SMT	2	48
275	SMT	3	165
275	SMT	4	48
275	SMT	5	165
275	SMT	6	32
275	SMT	7	236
275	SMT	8	195
275	SMT	9	145
315	LOW	1	219
315	LOW	2	230
315	LOW	3	160
315	LOW	4	85
315	LOW	5	117
315	LOW	6	35
315	LOW	7	18
315	LOW	8	203
315	LOW	9	8
315	LOW	10	184
455	MID	1	145
455	MID	2	221
455	MID	3	236
455	MID	4	32
455	MID	5	130
455	MID	6	218
455	MID	7	185
455	MID	8	144
A8	SMT	1	232
A8	SMT	2	193
A8	SMT	3	163
A8	SMT	4	191
A8	SMT	5	81
C3	SMT	1	167
C3	SMT	2	137
C3	SMT	3	141
C3	SMT	4	29
C3	SMT	5	192
C3	SMT	6	54
C3	SMT	7	173
C3	SMT	8	129
C33	SMT	1	167
C33	SMT	2	137
C33	SMT	3	141
C33	SMT	4	29
C33	SMT	5	192
C33	SMT	6	54
C33	SMT	7	173
C33	SMT	8	166
C33	SMT	9	163
C33	SMT	10	247
C5	SMT	1	244
C5	SMT	2	213
C5	SMT	3	207
C5	SMT	4	101
C5	SMT	5	115
C5	SMT	6	194
C5	SMT	7	149
C5	SMT	8	80
C5	SMT	9	137
C5	SMT	10	147
C5	SMT	11	200
C12	SMT	1	219
C12	SMT	2	115
C12	SMT	3	48
C12	SMT	4	31
C12	SMT	5	109
C55	SMT	1	245
C55	SMT	2	180
C55	SMT	3	101
C55	SMT	4	115
C55	SMT	5	194
C55	SMT	6	149
C55	SMT	7	200
C70	SMT	1	44
C70	SMT	2	244
C70	SMT	3	213
C70	SMT	4	31
C70	SMT	5	223
C70	SMT	6	101
C70	SMT	7	115
C70	SMT	8	194
C70	SMT	9	29
C70	SMT	10	142
C70	SMT	11	146
C70	SMT	12	228
D25	SMT	1	219
D25	SMT	2	213
D25	SMT	3	131
D25	SMT	4	77
D25	SMT	5	157
D25	SMT	6	145
D25	SMT	7	69
D25	SMT	8	14
D26	SMT	1	219
D26	SMT	2	213
D26	SMT	3	77
D26	SMT	4	157
D26	SMT	5	145
D26	SMT	6	20
D26	SMT	7	246
D26	SMT	8	88
D27	SMT	1	219
D27	SMT	2	213
D27	SMT	3	77
D27	SMT	4	157
D27	SMT	5	145
D27	SMT	6	20
D27	SMT	7	246
D27	SMT	8	113
D27	SMT	9	82
D28	SMT	1	219
D28	SMT	2	213
D28	SMT	3	77
D28	SMT	4	157
D28	SMT	5	145
D28	SMT	6	69
D28	SMT	7	14
R1	ROU	1	106
R1	ROU	2	167
R1	ROU	3	99
R1	ROU	4	37
R1	ROU	5	95
R1	ROU	6	47
R1	ROU	7	59
R1	ROU	8	106
R2	ROU	1	106
R2	ROU	2	59
R2	ROU	3	47
R2	ROU	4	95
R2	ROU	5	37
R2	ROU	6	99
R2	ROU	7	167
R2	ROU	8	106
VL2	VL	1	109
VL2	VL	2	201
VL2	VL	3	60
VL2	VL	4	10
\.

COPY stops (id, name) FROM stdin;
1	Aberlady
2	Abington
3	Amisfield Park
4	Ancrum
5	Armadale
6	ASDA
7	ASDA/Brunstane
8	Auchendinny
9	Baberton
10	Balerno
11	Balerno Church
12	Ballingry
13	Barnton
14	Bathgate
15	Bellevue
16	Berwick upon Tweed
17	Biggar
18	Bilston
19	Bingham
20	Blackburn
21	Blackford
22	Blackhall
23	Blackridge
24	Bonaly Avenue
25	Bo’ness
26	Bonnington
27	Bonnyrigg
28	Boswall
29	Bridges
30	Bristo
31	Broomhouse
32	Broxburn
33	Brunstane
34	Brunstane/ASDA
35	Bush Estate
36	Cameron Toll
37	Canonmills
38	Captains Road
39	Charlotte Square
40	Charlotte Street
41	City Hospital
42	Clermiston
43	Clerwood
44	Clovenstone
45	Cockburn Crescent
46	Colinton
47	Comely Bank
48	Corstorphine
49	Cowdenbeath
50	Craigentinny
51	Craighouse Campus
52	Craigleith
53	Craiglockhart
54	Craigmillar
55	Craigour
56	Craigs Road
57	Cramond
59	Crewe Toll
60	Currie
61	Dalgety Bay
62	Dalkeith
63	Dalmahoy
64	Dalmeny
65	Danderhall
66	Davidsons Mains
67	Deanburn
68	Deans Road/Royston Roundabout
69	Deans South
70	Drylaw
71	Duddingston
72	Dumbiedykes
73	Dumfries
74	Dunbar
75	Dunfermline
76	Earlston
77	East Calder
78	East Craigs
79	East Linton
80	Easter Road
81	Eastern General Hospital
82	Eastfield
83	Edinburgh Airport
84	Eskbank
85	Fairmilehead
86	Fala
87	Falkirk
88	Fauldhouse
89	Ferniehill
90	Ferry Road
91	Forth Bridge
92	Fountainbridge
93	Galashiels
94	George IV Bridge
95	George Street
96	Gilmerton
97	Gilmerton  Bridges
98	Gogar Station
99	Goldenacre
100	Gorebridge
101	Gorgie
102	Gracemount
103	Grange
104	Grangemouth
105	Granton
106	Granton Square
107	Grassmarket
108	Greendykes
109	Gyle
110	Haddington
111	Hailes
112	Hanover Street
113	Harthill
114	Hawick
115	Haymarket
116	High Street
117	Hillend
119	Humbie
120	Hunters Tryst
121	Hyvots Bank
122	Inglis Green Road
123	Innerleithen
124	Inverkeithing
125	Jedburgh
126	Kelso
127	Kelty
128	Kingsknowe
129	Kinnaird Park
130	Kirkliston
131	Kirknewton
132	Knightsridge
133	Lady Neurone
134	Ladywood
135	Lasswade
136	Lauder
137	Leith
139	Leith (Commercial Street)
140	Leith Docks
141	Leith Walk
142	Liberton
143	Linlithgow
144	Linlithgow Cross
145	Livingstone
146	Loanhead
147	Lochend
148	Lochend (Findlay Gardens)
149	London Road
150	London Street
151	Longniddry
152	Longstone
153	Marchmont
154	Mayfield
155	Meadowfield Drive
156	Melrose
157	Mid Calder
158	Milton Road
159	Moantcastle
160	Morningside
161	Mountcastle
162	Muirhouse
163	Musselburgh
164	Myreside
165	Newbridge
166	Newcraighall
167	Newhaven
168	Newhaven Road
169	Newington
170	Newton Grange
171	Newtongrange
172	Newtongrange Mayfield
173	Niddrie
174	North Berwick
175	North Bridge
176	North Road
177	Northfield
178	Orchard Brae
179	Oxgangs
180	Parkhead
181	Pathhead
182	Peebles
183	Pencaitland
184	Penicuik
185	Philipstoun
186	Pilrig -Princes Street
187	Pinkie
188	Polmont
189	Polton Mill
190	Port Seton
191	Portobello
192	Prestonfield
193	Prestonpans
194	Princes Street
195	Pumpherston
196	Queensferry Road
197	Ratho
198	Ravelston
199	Regent Road
200	Restalrig
201	Riccarton Campus
202	Rosewell
203	Roslin
204	Rosyth
205	Royal Mile
206	Royston
207	Saughton
208	Scotstoun
209	Seafield
210	Seafield Garage
211	Selkirk
212	Seton Sands
213	Sighthill
215	Silverknowes
216	Slateford
217	South Gyle
218	South Queensferry
219	St Andrew Square
220	St Boswells
221	St John’s Hospital
222	St Leonards
223	Stenhouse
224	Stirling
225	Stockbridge
226	Stoneybank
227	Stow
228	Straiton Road Sainsbury
229	Thornhill
230	Tollcross
231	Torphin
232	Trances
233	Tranent
234	Trinity
235	Turnhouse
236	Uphall
237	Wallyford
238	Wallyford
239	Wardie
240	Waverley Bridge
241	West Linton
242	West Mains
243	Westburn
244	Wester Hailes
245	Wester Hailes Centre
246	Whitburn
247	Whitecraig
248	Wilkieston
249	Willowbrae
250	Winchburgh
\.

COPY styles (album, style) FROM stdin;
B00004NRTD	Styles > Alternative Rock > Alternative Styles > Rock > General
B000003TAP	Styles > Alternative Rock > Alternative Styles > Rock > General
B000002MY3	Styles > Alternative Rock > Alternative Styles > Rock > General
B00000AG8K	Styles > Alternative Rock > Alternative Styles > Rock > General
B000000WA4	Styles > Alternative Rock > Alternative Styles > Rock > General
B000006NZV	Styles > Alternative Rock > Alternative Styles > Rock > General
B000003TA4	Styles > Alternative Rock > Alternative Styles > Rock > General
B0000027RL	Styles > Alternative Rock > Alternative Styles > Rock > General
B000002LD7	Styles > Alternative Rock > Alternative Styles > Rock > General
B000002MG1	Styles > Alternative Rock > Alternative Styles > Rock > General
B000002UJO	Styles > Alternative Rock > Alternative Styles > Rock > General
B00004SBGD	Styles > Alternative Rock > Alternative Styles > Rock > General
B0000027RL	Styles > Alternative Rock > Alternative Styles > Rock > Grunge
B000003TA4	Styles > Alternative Rock > Alternative Styles > Rock > Grunge
B000000WF0	Styles > Alternative Rock > Alternative Styles > Rock > Space Rock
B000000WDA	Styles > Alternative Rock > British Alternative > Britpop
B000002UJQ	Styles > Alternative Rock > British Alternative > Britpop
B000002UJO	Styles > Alternative Rock > British Alternative > Britpop
B000001E8P	Styles > Alternative Rock > British Alternative > Britpop
B000007Q8H	Styles > Alternative Rock > British Alternative > Britpop
B000000WF0	Styles > Alternative Rock > British Alternative > Britpop
B000002BBY	Styles > Alternative Rock > British Alternative > Britpop
B00004NRTD	Styles > Alternative Rock > British Alternative > Britpop
B000001FGW	Styles > Alternative Rock > British Alternative > Britpop
B00000AF99	Styles > Alternative Rock > British Alternative > General
B000002UJQ	Styles > Alternative Rock > British Alternative > General
B000002BBY	Styles > Alternative Rock > British Alternative > General
B000001Y5Z	Styles > Alternative Rock > General
B000006NZV	Styles > Alternative Rock > General
B0000026V1	Styles > Alternative Rock > General
B000002L9J	Styles > Alternative Rock > General
B000002UJO	Styles > Alternative Rock > General
B00000AFFF	Styles > Alternative Rock > General
B000001E8P	Styles > Alternative Rock > General
B000002VI0	Styles > Alternative Rock > General
B0000027RL	Styles > Alternative Rock > General
B00000AG8K	Styles > Alternative Rock > General
B0000087QO	Styles > Alternative Rock > General
B0000009VO	Styles > Alternative Rock > General
B000002LD7	Styles > Alternative Rock > General
B000001FS3	Styles > Alternative Rock > General
B00004SBGD	Styles > Alternative Rock > General
B000007Q8H	Styles > Alternative Rock > General
B000002UJQ	Styles > Alternative Rock > General
B000003TA4	Styles > Alternative Rock > General
B000000WF0	Styles > Alternative Rock > General
B000002MG1	Styles > Alternative Rock > General
B000002IT2	Styles > Alternative Rock > General
B000000WDA	Styles > Alternative Rock > General
B000000WA4	Styles > Alternative Rock > General
B0000025HU	Styles > Alternative Rock > General
B000001DTM	Styles > Alternative Rock > General
B000003TAP	Styles > Alternative Rock > General
B000002GE7	Styles > Alternative Rock > General
B000002BBY	Styles > Alternative Rock > General
B000002IZ1	Styles > Alternative Rock > General
B00004NRTD	Styles > Alternative Rock > General
B000002G3U	Styles > Alternative Rock > General
B000001Y5Z	Styles > Alternative Rock > Goth & Industrial > Industrial > Alt Industrial
B0000087QO	Styles > Alternative Rock > Hardcore & Punk > American Punk
B0000025HU	Styles > Alternative Rock > Hardcore & Punk > British Punk
B0000009VO	Styles > Alternative Rock > Hardcore & Punk > British Punk
B0000025HU	Styles > Alternative Rock > Hardcore & Punk > Punk
B000000WF0	Styles > Alternative Rock > Indie & Lo-Fi > Indie Pop > Dream Pop
B000002O72	Styles > Alternative Rock > Indie & Lo-Fi > Indie Pop > General
B00004NRTD	Styles > Alternative Rock > Indie & Lo-Fi > Indie Pop > General
B000000WDA	Styles > Alternative Rock > Indie & Lo-Fi > Indie Pop > General
B000001FGW	Styles > Alternative Rock > Indie & Lo-Fi > Indie Pop > General
B000002L9J	Styles > Alternative Rock > Indie & Lo-Fi > Indie Pop > General
B000000WF0	Styles > Alternative Rock > Indie & Lo-Fi > Indie Pop > General
B00000AF99	Styles > Alternative Rock > Indie & Lo-Fi > Indie Pop > General
B000000WF0	Styles > Alternative Rock > Indie & Lo-Fi > Indie Rock
B0000026V1	Styles > Alternative Rock > New Wave & Post-Punk > New Wave
B000002VI0	Styles > Alternative Rock > New Wave & Post-Punk > New Wave
B000002GE7	Styles > Alternative Rock > New Wave & Post-Punk > New Wave
B0000087QO	Styles > Alternative Rock > New Wave & Post-Punk > New Wave
B000002G3U	Styles > Alternative Rock > New Wave & Post-Punk > New Wave
B000002IT2	Styles > Alternative Rock > Singer-Songwriters
B000002I4U	Styles > Blues > General
B000002IKH	Styles > Broadway & Vocalists > Cabaret
B000006OHF	Styles > Broadway & Vocalists > Classic Vocalists
B000002AL7	Styles > Broadway & Vocalists > Classic Vocalists
B00000AEV0	Styles > Broadway & Vocalists > Classic Vocalists
B000002TRT	Styles > Broadway & Vocalists > Classic Vocalists
B0000024RJ	Styles > Broadway & Vocalists > Classic Vocalists
B00000265P	Styles > Broadway & Vocalists > Classic Vocalists
B000002OPK	Styles > Broadway & Vocalists > Classic Vocalists
B0000024SQ	Styles > Broadway & Vocalists > Classic Vocalists
B000006OHD	Styles > Broadway & Vocalists > Classic Vocalists
B0000024V3	Styles > Broadway & Vocalists > Classic Vocalists
B000006OHJ	Styles > Broadway & Vocalists > Classic Vocalists
B0000026W1	Styles > Broadway & Vocalists > Classic Vocalists
B0000047EG	Styles > Broadway & Vocalists > Classic Vocalists
B000006OBP	Styles > Broadway & Vocalists > Classic Vocalists
B000002UWM	Styles > Broadway & Vocalists > Classic Vocalists
B000006ONF	Styles > Broadway & Vocalists > Musicals > Contemporary Musicals
B000001FLC	Styles > Broadway & Vocalists > Musicals > Contemporary Musicals
B00000470C	Styles > Broadway & Vocalists > Musicals > General
B000006ONF	Styles > Broadway & Vocalists > Musicals > General
B000001FLC	Styles > Broadway & Vocalists > Musicals > General
B0000024SQ	Styles > Broadway & Vocalists > Traditional Vocal Pop
B000002IVS	Styles > Broadway & Vocalists > Traditional Vocal Pop
B0000026W1	Styles > Broadway & Vocalists > Traditional Vocal Pop
B000002PEF	Styles > Broadway & Vocalists > Traditional Vocal Pop
B000006OHJ	Styles > Broadway & Vocalists > Traditional Vocal Pop
B000002JOT	Styles > Broadway & Vocalists > Traditional Vocal Pop
B00000470C	Styles > Broadway & Vocalists > Traditional Vocal Pop
B000006OHF	Styles > Broadway & Vocalists > Traditional Vocal Pop
B00000AEV0	Styles > Broadway & Vocalists > Traditional Vocal Pop
B000006OHD	Styles > Broadway & Vocalists > Traditional Vocal Pop
B00000265P	Styles > Broadway & Vocalists > Traditional Vocal Pop
B000006OBP	Styles > Broadway & Vocalists > Traditional Vocal Pop
B000002IKH	Styles > Broadway & Vocalists > Traditional Vocal Pop
B0000032WJ	Styles > Broadway & Vocalists > Traditional Vocal Pop
B000002TRT	Styles > Broadway & Vocalists > Traditional Vocal Pop
B00000AFEZ	Styles > Broadway & Vocalists > Traditional Vocal Pop
B0000024RJ	Styles > Broadway & Vocalists > Traditional Vocal Pop
B0000047EG	Styles > Broadway & Vocalists > Traditional Vocal Pop
B00000DCI5	Styles > Broadway & Vocalists > Traditional Vocal Pop
B000002AL7	Styles > Broadway & Vocalists > Traditional Vocal Pop
B000002OPK	Styles > Broadway & Vocalists > Traditional Vocal Pop
B00000337M	Styles > Broadway & Vocalists > Traditional Vocal Pop
B0000024V3	Styles > Broadway & Vocalists > Traditional Vocal Pop
B000001FLC	Styles > Broadway & Vocalists > Traditional Vocal Pop
B000002WC1	Styles > Broadway & Vocalists > Traditional Vocal Pop
B000007OWW	Styles > Broadway & Vocalists > Traditional Vocal Pop
B000006ONF	Styles > Broadway & Vocalists > Traditional Vocal Pop
B000002USX	Styles > Broadway & Vocalists > Traditional Vocal Pop
B0000046NK	Styles > Broadway & Vocalists > Traditional Vocal Pop
B000002UWM	Styles > Broadway & Vocalists > Traditional Vocal Pop
B000002J09	Styles > Classic Rock > Album-Oriented Rock (AOR)
B000000OU0	Styles > Classic Rock > Album-Oriented Rock (AOR)
B000002U98	Styles > Classic Rock > Album-Oriented Rock (AOR)
B000001DQI	Styles > Classic Rock > Album-Oriented Rock (AOR)
B00000253N	Styles > Classic Rock > Album-Oriented Rock (AOR)
B0000025UW	Styles > Classic Rock > Album-Oriented Rock (AOR)
B0000032WL	Styles > Classic Rock > Album-Oriented Rock (AOR)
B0000025HO	Styles > Classic Rock > Album-Oriented Rock (AOR)
B000002GVO	Styles > Classic Rock > Album-Oriented Rock (AOR)
B000002G3U	Styles > Classic Rock > Album-Oriented Rock (AOR)
B0000060NA	Styles > Classic Rock > Album-Oriented Rock (AOR)
B0000025BL	Styles > Classic Rock > Album-Oriented Rock (AOR)
B000002GVS	Styles > Classic Rock > Album-Oriented Rock (AOR)
B00000J7J4	Styles > Classic Rock > Album-Oriented Rock (AOR)
B000002MFE	Styles > Classic Rock > Album-Oriented Rock (AOR)
B000001DVP	Styles > Classic Rock > Album-Oriented Rock (AOR)
B000002KHF	Styles > Classic Rock > Album-Oriented Rock (AOR)
B000002WD4	Styles > Classic Rock > Album-Oriented Rock (AOR)
B00000255F	Styles > Classic Rock > Album-Oriented Rock (AOR)
B000002U82	Styles > Classic Rock > Album-Oriented Rock (AOR)
B000002LD7	Styles > Classic Rock > Album-Oriented Rock (AOR)
B000001DTM	Styles > Classic Rock > Album-Oriented Rock (AOR)
B000002KGT	Styles > Classic Rock > Album-Oriented Rock (AOR)
B0000025BL	Styles > Classic Rock > Arena Rock
B000002J09	Styles > Classic Rock > Arena Rock
B000005YZM	Styles > Classic Rock > British Invasion
B0000032AP	Styles > Classic Rock > British Invasion
B000002UAO	Styles > Classic Rock > British Invasion
B00000IWQV	Styles > Classic Rock > British Invasion
B000002UAU	Styles > Classic Rock > British Invasion
B000002UAR	Styles > Classic Rock > British Invasion
B000002OX5	Styles > Classic Rock > British Invasion
B000002KHF	Styles > Classic Rock > General
B00000J7J4	Styles > Classic Rock > General
B000002I25	Styles > Classic Rock > General
B00000JJQK	Styles > Classic Rock > General
B000002OX5	Styles > Classic Rock > General
B000002U82	Styles > Classic Rock > General
B000002UAO	Styles > Classic Rock > General
B000002UB6	Styles > Classic Rock > General
B00001R3GI	Styles > Classic Rock > General
B00002MZ41	Styles > Classic Rock > General
B000002U98	Styles > Classic Rock > General
B000000OU0	Styles > Classic Rock > General
B00000255F	Styles > Classic Rock > General
B00000K4ES	Styles > Classic Rock > General
B0000025FN	Styles > Classic Rock > General
B000002P5Y	Styles > Classic Rock > General
B0000032AP	Styles > Classic Rock > General
B000002UAU	Styles > Classic Rock > General
B000002J09	Styles > Classic Rock > General
B0000032WL	Styles > Classic Rock > General
B0000025HO	Styles > Classic Rock > General
B000002UAX	Styles > Classic Rock > General
B000002KGT	Styles > Classic Rock > General
B0000025BL	Styles > Classic Rock > General
B000002GVS	Styles > Classic Rock > General
B000002UB3	Styles > Classic Rock > General
B000002UAR	Styles > Classic Rock > General
B0000025UW	Styles > Classic Rock > General
B000002GVO	Styles > Classic Rock > General
B000002MFE	Styles > Classic Rock > Live Albums > General
B000002U82	Styles > Classic Rock > Psychedelic Rock
B000002P5Y	Styles > Classic Rock > Psychedelic Rock
B000002UB6	Styles > Classic Rock > Psychedelic Rock
B000002UAU	Styles > Classic Rock > Psychedelic Rock
B000002UAO	Styles > Classic Rock > Psychedelic Rock
B000002UAR	Styles > Classic Rock > Psychedelic Rock
B000002UB3	Styles > Classic Rock > Psychedelic Rock
B000002UAX	Styles > Classic Rock > Psychedelic Rock
B00000J7J4	Styles > Classic Rock > Psychedelic Rock
B000005YZM	Styles > Classic Rock > Psychedelic Rock
B00000K4ES	Styles > Classic Rock > Psychedelic Rock
B000002OX5	Styles > Classic Rock > Supergroups
B000002UAO	Styles > Classic Rock > Supergroups
B000002UAX	Styles > Classic Rock > Supergroups
B000002J09	Styles > Classic Rock > Supergroups
B000002UAR	Styles > Classic Rock > Supergroups
B00000K4ES	Styles > Classic Rock > Supergroups
B00001R3GI	Styles > Classic Rock > Supergroups
B000002UAU	Styles > Classic Rock > Supergroups
B000000OU0	Styles > Classic Rock > Supergroups
B000002GVS	Styles > Classic Rock > Supergroups
B000002GVO	Styles > Classic Rock > Supergroups
B000002UB3	Styles > Classic Rock > Supergroups
B000002I25	Styles > Classic Rock > Supergroups
B000002UB6	Styles > Classic Rock > Supergroups
B000002U82	Styles > Classic Rock > Supergroups
B000001GHL	Styles > Classical > Forms & Genres > Symphonies > Romantic
B000001GPX	Styles > Classical > Forms & Genres > Symphonies > Romantic
B0000041XX	Styles > Classical > Forms & Genres > Theatrical, Incidental & Program Music > General
B000001GHL	Styles > Classical > Forms & Genres > Theatrical, Incidental & Program Music > Incidental Music
B00000161Y	Styles > Classical > General
B000001GPX	Styles > Classical > General
B00000AFQT	Styles > Classical > General
B000001GHL	Styles > Classical > General
B000004CXU	Styles > Classical > General
B0000042H4	Styles > Classical > General
B0000041XX	Styles > Classical > General
B000004CXU	Styles > Classical > Historical Periods > Baroque (c.1600-1750) > General
B000001GHL	Styles > Classical > Historical Periods > Classical (c.1770-1830) > General
B00000AFQT	Styles > Classical > Historical Periods > Classical (c.1770-1830) > General
B000001GPX	Styles > Classical > Historical Periods > Classical (c.1770-1830) > General
B000001GHL	Styles > Classical > Historical Periods > Romantic (c.1820-1910) > Ballets & Dances
B000001GHL	Styles > Classical > Historical Periods > Romantic (c.1820-1910) > Forms & Genres > Theatrical, Inci
B000001GHL	Styles > Classical > Symphonies > General
B000001GPX	Styles > Classical > Symphonies > General
B000002ULQ	Styles > Country > Contemporary Country > General
B000008O4G	Styles > Country > Contemporary Country > General
B000002ZDA	Styles > Country > Contemporary Country > General
B000001EW3	Styles > Country > Contemporary Country > General
B000002BZ0	Styles > Country > Contemporary Country > General
B00000DMJG	Styles > Country > Contemporary Country > General
B000008O4G	Styles > Country > Contemporary Country > New Traditionalist
B00000DMJG	Styles > Country > Contemporary Country > New Traditionalist
B000001EW3	Styles > Country > General
B000002LSP	Styles > Country > General
B000002TU5	Styles > Country > General
B00000DMJG	Styles > Country > General
B000002ULQ	Styles > Country > General
B000002BZ0	Styles > Country > General
B000002ZDA	Styles > Country > General
B000008O4G	Styles > Country > General
B00000DMJG	Styles > Country > Live Albums > Contemporary Country
B00000DMJG	Styles > Country > Live Albums > General
B000002ZDA	Styles > Country > Traditional Country > Nashville Sound
B000001DZO	Styles > Dance & DJ > Dance Pop > Euro Dance
B0000026CH	Styles > Dance & DJ > Dance Pop > General
B0000029LG	Styles > Dance & DJ > Dance Pop > General
B00000638D	Styles > Dance & DJ > Dance Pop > General
B000002IZ1	Styles > Dance & DJ > Dance Pop > General
B00000DFTD	Styles > Dance & DJ > Dance Pop > General
B000002LND	Styles > Dance & DJ > Dance Pop > General
B00000F1D3	Styles > Dance & DJ > Dance Pop > General
B000002NJS	Styles > Dance & DJ > Dance Pop > General
B0000028TU	Styles > Dance & DJ > Dance Pop > General
B000002BQK	Styles > Dance & DJ > Dance Pop > General
B000001DZO	Styles > Dance & DJ > Dance Pop > General
B0000025RI	Styles > Dance & DJ > Dance Pop > General
B00000IX6H	Styles > Dance & DJ > Dance Pop > General
B00000IOOE	Styles > Dance & DJ > Dance Pop > General
B00004R84V	Styles > Dance & DJ > Dance Pop > General
B00000G1IL	Styles > Dance & DJ > Dance Pop > General
B00000F1D3	Styles > Dance & DJ > Disco
B000001FDV	Styles > Dance & DJ > Disco
B000002LND	Styles > Dance & DJ > General
B000002NJS	Styles > Dance & DJ > General
B000002WD4	Styles > Folk > Contemporary Folk > General
B00000253N	Styles > Folk > Contemporary Folk > General
B0000024SI	Styles > Folk > Contemporary Folk > General
B000002BZ0	Styles > Folk > Contemporary Folk > General
B000002W6Q	Styles > Folk > Contemporary Folk > General
B000002W6Q	Styles > Folk > Contemporary Folk > Singer-Songwriters
B00000253N	Styles > Folk > Contemporary Folk > Singer-Songwriters
B0000024SI	Styles > Folk > Contemporary Folk > Singer-Songwriters
B000002WD4	Styles > Folk > Contemporary Folk > Singer-Songwriters
B000001Y5Z	Styles > Hard Rock & Metal > Alternative Metal
B000002J09	Styles > Hard Rock & Metal > British Metal
B000002H97	Styles > Hard Rock & Metal > General
B000002J09	Styles > Hard Rock & Metal > General
B000002H33	Styles > Hard Rock & Metal > General
B000002H33	Styles > Hard Rock & Metal > Hard Rock
B000002H97	Styles > Hard Rock & Metal > Hard Rock
B000002H97	Styles > Hard Rock & Metal > Thrash & Speed Metal
B000002H33	Styles > Hard Rock & Metal > Thrash & Speed Metal
B000005J56	Styles > International > Caribbean & Cuba > Cuba
B000005J56	Styles > International > Caribbean & Cuba > General
B000001FY9	Styles > International > Caribbean & Cuba > Jamaica
B000001DZO	Styles > International > Europe > Scandinavia > Sweden
B000005J56	Styles > International > General
B000001FY9	Styles > International > Reggae > General
B000003N7G	Styles > Jazz > Avant Garde & Free Jazz
B000003N7G	Styles > Jazz > Bebop > Hard Bop
B00000337M	Styles > Jazz > General
B0000047EG	Styles > Jazz > General
B000003N7G	Styles > Jazz > General
B000002ADT	Styles > Jazz > General
B000002IKH	Styles > Jazz > General
B0000046NK	Styles > Jazz > General
B00000AFEZ	Styles > Jazz > General
B000005J56	Styles > Jazz > Latin Jazz
B000002I4U	Styles > Jazz > Soul-Jazz & Boogaloo
B000002OPK	Styles > Jazz > Swing Jazz > Swing General
B00000337M	Styles > Jazz > Swing Jazz > Swing General
B00000DCI5	Styles > Jazz > Swing Jazz > Swing General
B000002UWM	Styles > Jazz > Swing Jazz > Swing General
B0000047EG	Styles > Jazz > Vocal Jazz > Vocal Jazz General
B000002UWM	Styles > Jazz > Vocal Jazz > Vocal Jazz General
B0000024RJ	Styles > Jazz > Vocal Jazz > Vocal Jazz General
B0000046NK	Styles > Jazz > Vocal Jazz > Vocal Jazz General
B0000024SQ	Styles > Jazz > Vocal Jazz > Vocal Jazz General
B000002IKH	Styles > Jazz > Vocal Jazz > Vocal Jazz General
B00000337M	Styles > Jazz > Vocal Jazz > Vocal Jazz General
B00000DCI5	Styles > Jazz > Vocal Jazz > Vocal Jazz General
B00000AFEZ	Styles > Jazz > Vocal Jazz > Vocal Jazz General
B000005J56	Styles > Latin Music > General
B00000161Y	Styles > Latin Music > General
B0000028TU	Styles > Latin Music > General
B00000IX6H	Styles > Latin Music > General
B0000028TU	Styles > Latin Music > Latin Pop
B00000IX6H	Styles > Latin Music > Latin Pop
B000004CXU	Styles > Miscellaneous > Holiday > Opera & Vocal
B00000470C	Styles > Miscellaneous > Nostalgia
B000002LRR	Styles > New Age > Celtic New Age
B000002LRR	Styles > New Age > General
B000004CXU	Styles > Opera & Vocal > Divas > Kirkby, Emma
B0000042H4	Styles > Opera & Vocal > General
B0000041XX	Styles > Opera & Vocal > General
B0000041XX	Styles > Opera & Vocal > Languages > French
B0000042H4	Styles > Opera & Vocal > Languages > German
B0000041XX	Styles > Opera & Vocal > Languages > Italian
B0000041XX	Styles > Opera & Vocal > Operettas
B000004CXU	Styles > Opera & Vocal > Oratorios
B0000041XX	Styles > Opera & Vocal > Vocal Non-Opera > Musical Theater
B000004CXU	Styles > Opera & Vocal > Vocal Non-Opera > Oratorios
B00000AFQT	Styles > Opera & Vocal > Vocal Non-Opera > Requiems
B0000042H4	Styles > Opera & Vocal > Voices > Sopranos
B000002WYT	Styles > Pop > Adult Alternative
B00000AFFF	Styles > Pop > Adult Alternative
B00000AG8K	Styles > Pop > Adult Alternative
B000007Q8H	Styles > Pop > Adult Alternative
B00000IOSU	Styles > Pop > Adult Alternative
B000002VT6	Styles > Pop > Adult Alternative
B000002VN7	Styles > Pop > Adult Alternative
B000002IT2	Styles > Pop > Adult Alternative
B000002WQS	Styles > Pop > Adult Alternative
B000002LSP	Styles > Pop > Adult Alternative
B000002O72	Styles > Pop > Adult Alternative
B000002MG1	Styles > Pop > Adult Alternative
B000003TAP	Styles > Pop > Adult Alternative
B000002MY3	Styles > Pop > Adult Alternative
B000001DVP	Styles > Pop > Adult Contemporary > General
B0000028TU	Styles > Pop > Adult Contemporary > General
B00000IOOE	Styles > Pop > Adult Contemporary > General
B000002MFE	Styles > Pop > Adult Contemporary > General
B000001DQI	Styles > Pop > Adult Contemporary > General
B0000029YC	Styles > Pop > Adult Contemporary > General
B0000013G5	Styles > Pop > Adult Contemporary > General
B00000G1IL	Styles > Pop > Adult Contemporary > General
B000002BQK	Styles > Pop > Adult Contemporary > General
B00000F1D3	Styles > Pop > Adult Contemporary > General
B00000J2PH	Styles > Pop > Adult Contemporary > General
B00004R84V	Styles > Pop > Adult Contemporary > General
B000002IVS	Styles > Pop > Adult Contemporary > General
B000002NBY	Styles > Pop > Adult Contemporary > General
B000001EW3	Styles > Pop > Adult Contemporary > General
B00000638D	Styles > Pop > Adult Contemporary > General
B0000025VL	Styles > Pop > Adult Contemporary > General
B000002LND	Styles > Pop > Adult Contemporary > General
B000002NJS	Styles > Pop > Adult Contemporary > General
B0000024V3	Styles > Pop > Adult Contemporary > General
B000001FDV	Styles > Pop > Adult Contemporary > General
B000002KHF	Styles > Pop > Adult Contemporary > General
B000002BHE	Styles > Pop > Adult Contemporary > General
B0000026CH	Styles > Pop > Adult Contemporary > General
B000002C4J	Styles > Pop > Adult Contemporary > General
B0000026W1	Styles > Pop > Adult Contemporary > General
B00001R3O9	Styles > Pop > Compilations > General
B000001DZO	Styles > Pop > Euro Pop > General
B000001DZO	Styles > Pop > Euro Pop > Swedish Pop
B000001DZO	Styles > Pop > General
B000001FLC	Styles > Pop > General
B000001EW3	Styles > Pop > General
B00004R84V	Styles > Pop > General
B00001R3O9	Styles > Pop > General
B000002PEF	Styles > Pop > General
B000006ONF	Styles > Pop > General
B00000IX6H	Styles > Pop > General
B00000AFFF	Styles > Pop > General
B000002ZDA	Styles > Pop > General
B00000638D	Styles > Pop > General
B000007OWW	Styles > Pop > General
B00000G1IL	Styles > Pop > General
B00000DFTD	Styles > Pop > General
B0000025FN	Styles > Pop > Live Albums > Pop Rock
B00000IOSU	Styles > Pop > Live Albums > Singer-Songwriters
B000006OJ7	Styles > Pop > Oldies > General
B00000470C	Styles > Pop > Oldies > General
B00000334M	Styles > Pop > Oldies > General
B000002WFY	Styles > Pop > Oldies > General
B000002WFX	Styles > Pop > Oldies > General
B000002PEF	Styles > Pop > Oldies > General
B0000032AP	Styles > Pop > Pop Rock
B00000JJQK	Styles > Pop > Pop Rock
B000002VI0	Styles > Pop > Pop Rock
B0000028TU	Styles > Pop > Pop Rock
B000002W6Q	Styles > Pop > Pop Rock
B000002WD4	Styles > Pop > Pop Rock
B00000J2PH	Styles > Pop > Pop Rock
B0000026V1	Styles > Pop > Pop Rock
B00000IWQV	Styles > Pop > Pop Rock
B0000026CH	Styles > Pop > Pop Rock
B0000060NA	Styles > Pop > Pop Rock
B000001DQI	Styles > Pop > Pop Rock
B0000087QO	Styles > Pop > Pop Rock
B0000025HO	Styles > Pop > Pop Rock
B000001DVP	Styles > Pop > Pop Rock
B0000025FN	Styles > Pop > Pop Rock
B00000HZEQ	Styles > Pop > Pop Rock
B000002564	Styles > Pop > Pop Rock
B00000F1D3	Styles > Pop > Pop Rock
B000005YZM	Styles > Pop > Pop Rock
B000002U98	Styles > Pop > Pop Rock
B00000DCHI	Styles > Pop > Pop Rock
B00000DCHF	Styles > Pop > Pop Rock
B0000025VL	Styles > Pop > Pop Rock
B000002NBY	Styles > Pop > Pop Rock
B00000334M	Styles > Pop > Pop Rock
B000002MH7	Styles > Pop > Pop Rock
B000002GE7	Styles > Pop > Pop Rock
B000002MY3	Styles > Pop > Pop Rock
B000002KHF	Styles > Pop > Pop Rock
B000002O72	Styles > Pop > Pop Rock
B000002JOT	Styles > Pop > Pop Rock
B000002IZ1	Styles > Pop > Pop Rock
B0000025UW	Styles > Pop > Singer-Songwriters
B000002W6Q	Styles > Pop > Singer-Songwriters
B000002WD4	Styles > Pop > Singer-Songwriters
B000001DVP	Styles > Pop > Singer-Songwriters
B0000009VO	Styles > Pop > Singer-Songwriters
B000002KBX	Styles > Pop > Singer-Songwriters
B00000IOSU	Styles > Pop > Singer-Songwriters
B000002KHF	Styles > Pop > Singer-Songwriters
B000002VT6	Styles > Pop > Singer-Songwriters
B000001DQI	Styles > Pop > Singer-Songwriters
B000002NBY	Styles > Pop > Singer-Songwriters
B00000255F	Styles > Pop > Singer-Songwriters
B00000DCHI	Styles > Pop > Singer-Songwriters
B000002VN7	Styles > Pop > Singer-Songwriters
B00000DCHF	Styles > Pop > Singer-Songwriters
B00000AFFF	Styles > Pop > Singer-Songwriters
B00000J2PH	Styles > Pop > Singer-Songwriters
B000002TU5	Styles > Pop > Soft Rock
B000002564	Styles > Pop > Soft Rock
B00000IOOE	Styles > Pop > Teen Pop
B00000638D	Styles > Pop > Teen Pop
B00000G1IL	Styles > Pop > Teen Pop
B000007OWW	Styles > Pop > Vocal Pop > Classic
B00000265P	Styles > Pop > Vocal Pop > Classic
B000002IKH	Styles > Pop > Vocal Pop > Classic
B000006OHJ	Styles > Pop > Vocal Pop > Classic
B0000024RJ	Styles > Pop > Vocal Pop > Classic
B0000024V3	Styles > Pop > Vocal Pop > Classic
B0000024SQ	Styles > Pop > Vocal Pop > Classic
B0000025VL	Styles > Pop > Vocal Pop > Contemporary
B0000024V3	Styles > Pop > Vocal Pop > Contemporary
B00004R84V	Styles > Pop > Vocal Pop > Contemporary
B000007OWW	Styles > Pop > Vocal Pop > Contemporary
B00000334M	Styles > Pop > Vocal Pop > Contemporary
B000006ONF	Styles > Pop > Vocal Pop > Contemporary
B000002LSP	Styles > Pop > Vocal Pop > Contemporary
B0000032WJ	Styles > Pop > Vocal Pop > Contemporary
B000002IVS	Styles > Pop > Vocal Pop > Contemporary
B000002BQK	Styles > Pop > Vocal Pop > Contemporary
B000001DQI	Styles > Pop > Vocal Pop > Contemporary
B000002W6Q	Styles > Pop > Vocal Pop > Contemporary
B00000AFFF	Styles > Pop > Vocal Pop > Contemporary
B000002VT6	Styles > Pop > Vocal Pop > Contemporary
B0000026CH	Styles > Pop > Vocal Pop > Contemporary
B000002WD4	Styles > Pop > Vocal Pop > Contemporary
B0000029YC	Styles > Pop > Vocal Pop > Contemporary
B0000026W1	Styles > Pop > Vocal Pop > Contemporary
B000002C4J	Styles > Pop > Vocal Pop > Contemporary
B000002WFX	Styles > Pop > Vocal Pop > Contemporary
B000001DVP	Styles > Pop > Vocal Pop > Contemporary
B000002BHE	Styles > Pop > Vocal Pop > Contemporary
B00000IOSU	Styles > Pop > Vocal Pop > Contemporary
B0000013G5	Styles > Pop > Vocal Pop > Contemporary
B000002VN7	Styles > Pop > Vocal Pop > Contemporary
B000002IZ1	Styles > Pop > Vocal Pop > Contemporary
B000002WFY	Styles > Pop > Vocal Pop > Contemporary
B00000470C	Styles > Pop > Vocal Pop > General
B0000024RJ	Styles > Pop > Vocal Pop > General
B0000024SQ	Styles > Pop > Vocal Pop > General
B0000046NK	Styles > Pop > Vocal Pop > General
B000002LSP	Styles > Pop > Vocal Pop > General
B0000047EG	Styles > Pop > Vocal Pop > General
B000006OBP	Styles > Pop > Vocal Pop > General
B000006OHF	Styles > Pop > Vocal Pop > General
B000002JOT	Styles > Pop > Vocal Pop > General
B000006OHJ	Styles > Pop > Vocal Pop > General
B000002IVS	Styles > Pop > Vocal Pop > General
B000001DZO	Styles > Pop > Vocal Pop > General
B00000DCI5	Styles > Pop > Vocal Pop > General
B000007OWW	Styles > Pop > Vocal Pop > General
B000001FLC	Styles > Pop > Vocal Pop > General
B0000024V3	Styles > Pop > Vocal Pop > General
B000002IKH	Styles > Pop > Vocal Pop > General
B00000AEV0	Styles > Pop > Vocal Pop > General
B00000AFEZ	Styles > Pop > Vocal Pop > General
B000006OHD	Styles > Pop > Vocal Pop > General
B000002USX	Styles > Pop > Vocal Pop > General
B000002AL7	Styles > Pop > Vocal Pop > General
B0000026CH	Styles > Pop > Vocal Pop > General
B0000028TU	Styles > Pop > Vocal Pop > General
B000002UWM	Styles > Pop > Vocal Pop > General
B000002OPK	Styles > Pop > Vocal Pop > General
B0000032WJ	Styles > Pop > Vocal Pop > General
B000002WC1	Styles > Pop > Vocal Pop > General
B00000337M	Styles > Pop > Vocal Pop > General
B000002C4J	Styles > Pop > Vocal Pop > General
B000002TRT	Styles > Pop > Vocal Pop > General
B00000265P	Styles > Pop > Vocal Pop > General
B000002BHE	Styles > Pop > Vocal Pop > General
B0000026W1	Styles > Pop > Vocal Pop > General
B0000025VL	Styles > Pop > Vocal Pop > General
B000002I4U	Styles > R&B > Classic R&B
B0000060NA	Styles > R&B > Classic R&B
B0000013G5	Styles > R&B > Contemporary R&B
B000002L68	Styles > R&B > Funk > General
B0000029LG	Styles > R&B > Funk > General
B0000025RI	Styles > R&B > Funk > General
B0000060NA	Styles > R&B > Funk > General
B0000025RI	Styles > R&B > General
B00000ADG2	Styles > R&B > General
B000002L68	Styles > R&B > General
B0000029LG	Styles > R&B > General
B0000013G5	Styles > R&B > General
B000006OJ7	Styles > R&B > General
B0000060NA	Styles > R&B > General
B000002I4U	Styles > R&B > General
B000002BQK	Styles > R&B > General
B00004R84V	Styles > R&B > General
B0000060NA	Styles > R&B > Motown
B00000HZEQ	Styles > R&B > Soul > General
B000002I4U	Styles > R&B > Soul > General
B0000032WJ	Styles > R&B > Soul > General
B000002KHF	Styles > R&B > Soul > General
B0000060NA	Styles > R&B > Soul > General
B00000DFTD	Styles > Rap & Hip-Hop > General
B000002U98	Styles > Rock > Blues Rock
B00000J7J4	Styles > Rock > Blues Rock
B000002MFE	Styles > Rock > Blues Rock
B000002J09	Styles > Rock > Blues Rock
B000002GVO	Styles > Rock > Country Rock
B000002GVS	Styles > Rock > Country Rock
B0000024SI	Styles > Rock > Folk Rock
B00002MZ41	Styles > Rock > Folk Rock
B00000253N	Styles > Rock > Folk Rock
B00000DCHI	Styles > Rock > General
B000002G3U	Styles > Rock > General
B00000J7J4	Styles > Rock > General
B000001DTM	Styles > Rock > General
B000000WF0	Styles > Rock > General
B000001FS3	Styles > Rock > General
B000002MH7	Styles > Rock > General
B0000025UW	Styles > Rock > General
B000002WYT	Styles > Rock > General
B000002WQS	Styles > Rock > General
B000003TAP	Styles > Rock > General
B000002MFE	Styles > Rock > General
B00000DCHF	Styles > Rock > General
B000002WQS	Styles > Rock > Jam Bands > Rock Jam Bands
B000002WYT	Styles > Rock > Jam Bands > Rock Jam Bands
B000002MFE	Styles > Rock > Live Albums > General
B000002MFE	Styles > Rock > Live Albums > Rock Guitarists
B000002WFY	Styles > Rock > Oldies & Retro > General
B00000334M	Styles > Rock > Oldies & Retro > General
B000002WFX	Styles > Rock > Oldies & Retro > General
B00000334M	Styles > Rock > Oldies & Retro > Rockabilly
B000002WFX	Styles > Rock > Oldies & Retro > Rockabilly
B0000026V1	Styles > Rock > Power Pop
B000002U82	Styles > Rock > Progressive > Progressive Rock
B0000025HO	Styles > Rock > Progressive > Progressive Rock
B0000032WL	Styles > Rock > Progressive > Progressive Rock
B00000J7J4	Styles > Rock > Rock Guitarists > General
B000002J09	Styles > Rock > Rock Guitarists > Guitar Gods
B00000J7J4	Styles > Rock > Rock Guitarists > Guitar Gods
B000002P5Y	Styles > Rock > Rock Guitarists > Guitar Gods
B000002MFE	Styles > Rock > Rock Guitarists > Guitar Gods
B0000026V1	Styles > Rock > Roots Rock
B0000025UW	Styles > Rock > Singer-Songwriters
B00000255F	Styles > Rock > Singer-Songwriters
B000003G8E	Styles > Soundtracks > By Decade > 1970s
B000001FDV	Styles > Soundtracks > By Decade > 1970s
B000002L68	Styles > Soundtracks > By Decade > 1980s
B00000IQMT	Styles > Soundtracks > By Decade > 1990s
B0000029YC	Styles > Soundtracks > By Decade > 1990s
B000003G8E	Styles > Soundtracks > General
B00000IQMT	Styles > Soundtracks > General
B0000029YC	Styles > Soundtracks > General
B000006ONF	Styles > Soundtracks > General
B000001FDV	Styles > Soundtracks > General
B0000029YC	Styles > Soundtracks > Movie Scores
B00000IQMT	Styles > Soundtracks > Movie Scores
B00000IQMT	Styles > Soundtracks > Movie Soundtracks
B0000029YC	Styles > Soundtracks > Movie Soundtracks
B000001FDV	Styles > Soundtracks > Movie Soundtracks
B000003G8E	Styles > Soundtracks > Movie Soundtracks
B00000IQMT	Styles > Soundtracks > Star Wars
B000003G8E	Styles > Soundtracks > Star Wars
\.

COPY teachers (id, dept_id, name, phone, mobile) FROM stdin;
101	1	Shrivell	2753	07966 555 1234
102	1	Throd	2754	07122 555 1920
103	1	Splint	2293	\N
104	\N	Spiregrain	3287	\N
105	2	Cutflower	3212	07966 555 6574
106	\N	Deadyawn	3345	\N
\.

COPY tracks (album, disk, posn, song) FROM stdin;
B0000009VO	1	1	Alison
B0000009VO	1	2	Watching The Detectives
B0000009VO	1	3	(I Don't Want To Go To) Chelsea
B0000009VO	1	4	Pump It Up
B0000009VO	1	5	Radio Radio
B0000009VO	1	6	(What's So Funny 'Bout) Peace, Love...
B0000009VO	1	7	Oliver's Army
B0000009VO	1	8	Accidents Will Happen
B0000009VO	1	9	I Can't Stand Up (For Falling Down)
B0000009VO	1	10	New Amsterdam
B0000009VO	1	11	High Fidelity
B0000009VO	1	12	Clubland
B0000009VO	1	13	Watch Your Step
B0000009VO	1	14	Good Year For The Roses
B0000009VO	1	15	Beyond Belief
B0000009VO	1	16	Man Out Of Time
B0000009VO	1	17	Everyday I Write The Book
B0000009VO	1	18	Shipbuilding
B0000009VO	1	19	Love Field
B0000009VO	1	20	Brilliant Mistake
B0000009VO	1	21	Indoor Fireworks
B0000009VO	1	22	I Want You
B000000OU0	1	1	Get Over It
B000000OU0	1	2	Love Will Keep Us Alive
B000000OU0	1	3	The Girl From Yesterday
B000000OU0	1	4	Learn To Be Still
B000000OU0	1	5	Tequila Sunrise
B000000OU0	1	6	Hotel California
B000000OU0	1	7	Wasted Time
B000000OU0	1	8	Pretty Maids All In A Row
B000000OU0	1	9	I Can't Tell You Why
B000000OU0	1	10	New York Minute
B000000OU0	1	11	The Last Resort
B000000OU0	1	12	Take It Easy
B000000OU0	1	13	In The City
B000000OU0	1	14	Life In The Fast Lane
B000000OU0	1	15	Desperado
B000000WA4	1	1	Mellon Collie and the Infinite Sadness
B000000WA4	1	2	Tonight, Tonight
B000000WA4	1	3	Jellybelly
B000000WA4	1	4	Zero
B000000WA4	1	5	Here Is No Why
B000000WA4	1	6	Bullet With Butterfly Wings
B000000WA4	1	7	To Forgive
B000000WA4	1	8	An Ode to No One
B000000WA4	1	9	Love
B000000WA4	1	10	Cupid de Locke
B000000WA4	1	11	Galapogos
B000000WA4	1	12	Muzzle
B000000WA4	1	13	Porcelina of the Vast Oceans
B000000WA4	1	14	Take Me Down
B000000WA4	2	1	Where Boys Fear to Tread
B000000WA4	2	2	Bodies
B000000WA4	2	3	Thirty-Three
B000000WA4	2	4	In the Arms of Sleep
B000000WA4	2	5	1979
B000000WA4	2	6	Tales of a Scorched Earth
B000000WA4	2	7	Thru the Eyes of Ruby
B000000WA4	2	8	Stumbleine
B000000WA4	2	9	XYU
B000000WA4	2	10	We Only Come Out at Night
B000000WA4	2	11	Beautiful
B000000WA4	2	12	Lily (My One and Only)
B000000WA4	2	13	By Starlight
B000000WA4	2	14	Farewell and Goodnight
B000000WDA	1	1	Beetlebum
B000000WDA	1	2	Song 2
B000000WDA	1	3	Country Sad Ballad Man
B000000WDA	1	4	M.O.R.
B000000WDA	1	5	On Your Own
B000000WDA	1	6	Theme From Retro
B000000WDA	1	7	You're So Great
B000000WDA	1	8	Death Of A Party
B000000WDA	1	9	Chinese Bombs
B000000WDA	1	10	I'm Just A Killer For Your Love
B000000WDA	1	11	Look Inside America
B000000WDA	1	12	Strange News From Another Star
B000000WDA	1	13	Movin' On
B000000WDA	1	14	Essex Dogs
B000000WF0	1	1	Bittersweet Symphony
B000000WF0	1	2	Sonnet
B000000WF0	1	3	Rolling People
B000000WF0	1	4	Drugs Don't Work
B000000WF0	1	5	Catching the Butterfly
B000000WF0	1	6	Neon Wilderness
B000000WF0	1	7	Space and Time
B000000WF0	1	8	Weeping Willow
B000000WF0	1	9	Lucky Man
B000000WF0	1	10	One Day
B000000WF0	1	11	This Time
B000000WF0	1	12	Velvet Morning
B000000WF0	1	13	Come On
B0000013G5	1	1	Another Sad Love Song
B0000013G5	1	2	Breathe Again
B0000013G5	1	3	Seven Whole Days
B0000013G5	1	4	Love Affair
B0000013G5	1	5	Candlelight
B0000013G5	1	6	Spending My Time With You
B0000013G5	1	7	Love Shoulda Brought You Home
B0000013G5	1	8	I Belong to You
B0000013G5	1	9	How Many Ways
B0000013G5	1	10	You Mean the World to Me
B0000013G5	1	11	Best Friend
B0000013G5	1	12	Breathe Again (Reprise)
B00000161Y	1	1	Por Ti Volare'
B00000161Y	1	2	Vivere' - (featuring Gerardina Trovato)
B00000161Y	1	3	Por Amor
B00000161Y	1	4	El Silencio De La Espera
B00000161Y	1	5	Caruso
B00000161Y	1	6	Le Tue Parole
B00000161Y	1	7	Vivo Por Ella - (featuring Mario Sanchez)
B00000161Y	1	8	Romanza
B00000161Y	1	9	Voglio Restare Cosi
B00000161Y	1	10	E Chiove
B00000161Y	1	11	Misirere - (bonus track)
B00000161Y	1	12	Time To Say Goodbye - (featuring Sarah Brightman)
B000001DQI	1	1	Funeral for a Friend/Love Lies Bleeding
B000001DQI	1	2	Candle in the Wind
B000001DQI	1	3	Bennie and the Jets
B000001DQI	1	4	Goodbye Yellow Brick Road
B000001DQI	1	5	This Song Has No Title
B000001DQI	1	6	Grey Seal
B000001DQI	1	7	Jamaica Jerk Off
B000001DQI	1	8	I've Seen That Movie Too
B000001DQI	1	9	Sweet Painted Lady
B000001DQI	1	10	Ballad of Danny Bailey (1909-34)
B000001DQI	1	11	Dirty Little Girl
B000001DQI	1	12	All the Girls Love Alice
B000001DQI	1	13	Your Sister Can't Twist (But She Can Rock & Roll)
B000001DQI	1	14	Saturday Night's Alright for Fighting
B000001DQI	1	15	Roy Rogers
B000001DQI	1	16	Social Disease
B000001DQI	1	17	Harmony
B000001DTM	1	1	Zoo Station
B000001DTM	1	2	Even Better Than The Real Thing
B000001DTM	1	3	One
B000001DTM	1	4	Until The End Of The World
B000001DTM	1	5	Who's Gonna Ride Your Wild Horses
B000001DTM	1	6	So Cruel
B000001DTM	1	7	The Fly
B000001DTM	1	8	Mysterious Ways
B000001DTM	1	9	Tryin' To Throw Your Arms Around The World
B000001DTM	1	10	Ultra Violet (Light My Way)
B000001DTM	1	11	Acrobat
B000001DTM	1	12	Love Is Blindness
B000001DVP	1	1	Your Song
B000001DVP	1	2	Daniel
B000001DVP	1	3	Honky Cat
B000001DVP	1	4	Goodbye Yellow Brick Road
B000001DVP	1	5	Saturday Night's Alright For Fighting
B000001DVP	1	6	Rocket Man
B000001DVP	1	7	Bennie And The Jets
B000001DVP	1	8	Candle In The Wind
B000001DVP	1	9	Don't Let The Sun Go Down On Me
B000001DVP	1	10	Border Song
B000001DVP	1	11	Crocodile Rock
B000001DZO	1	1	Dancing Queen
B000001DZO	1	2	Knowing Me, Knowing You
B000001DZO	1	3	Take A Chance On Me
B000001DZO	1	4	Mamma Mia
B000001DZO	1	5	Lay All Your Love On Me
B000001DZO	1	6	Super Trouper
B000001DZO	1	7	I Have A Dream
B000001DZO	1	8	The Winner Takes It All
B000001DZO	1	9	Money, Money, Money
B000001DZO	1	10	S.O.S.
B000001DZO	1	11	Chiquitita
B000001DZO	1	12	Fernando
B000001DZO	1	13	Voulez Vous
B000001DZO	1	14	Gimme! Gimme! Gimme! (A Man After Midnight)
B000001DZO	1	15	Does Your Mother Know
B000001DZO	1	16	One Of Us
B000001DZO	1	17	The Name Of The Game
B000001DZO	1	18	Thank You For The Music
B000001DZO	1	19	Waterloo
B000001E8P	1	1	Mis-Shapes
B000001E8P	1	2	Pencil Skirt
B000001E8P	1	3	Common People
B000001E8P	1	4	I Spy
B000001E8P	1	5	Disco 2000
B000001E8P	1	6	Live Bed Show
B000001E8P	1	7	Something Changed
B000001E8P	1	8	Sorted for E's & Wizz
B000001E8P	1	9	F.E.E.L.I.N.G.C.A.L.L.E.D.L.O.V.E
B000001E8P	1	10	Underwear
B000001E8P	1	11	Monday Morning
B000001E8P	1	12	Bar Italia
B000001EW3	1	1	Man! I Feel Like a Woman!
B000001EW3	1	2	I'm Holdin' on to Love (To Save My Life)
B000001EW3	1	3	Love Gets Me Every Time
B000001EW3	1	4	Don't Be Stupid (You Know I Love You)
B000001EW3	1	5	From This Moment On
B000001EW3	1	6	Come on Over
B000001EW3	1	7	When
B000001EW3	1	8	Whatever You Do! Don't!
B000001EW3	1	9	If You Wanna Touch Her, Ask!
B000001EW3	1	10	You're Still the One
B000001EW3	1	11	Honey, I'm Home
B000001EW3	1	12	That Don't Impress Me Much
B000001EW3	1	13	Black Eyes, Blue Tears
B000001EW3	1	14	I Won't Leave You Lonely
B000001EW3	1	15	Rock This Country!
B000001EW3	1	16	You've Got a Way
B000001FDV	1	1	Stayin' Alive - Bee Gees
B000001FDV	1	2	How Deep Is Your Love - Bee Gees
B000001FDV	1	3	Night Fever - Bee Gees
B000001FDV	1	4	More Than A Woman - Bee Gees
B000001FDV	1	5	If I Can't Have You - Yvonne Elliman
B000001FDV	1	6	A Fifth Of Beethoven (Based On Beethoven's Fifth Symphony) - Walter Murphy
B000001FDV	1	7	More Than A Woman - Tavares
B000001FDV	1	8	Manhattan Skyline - David Shire
B000001FDV	1	9	Calypso Breakdown - Ralph McDonald
B000001FDV	1	10	Night On Disco Mountain (Based On 'Night On Bald Mountain') - David Shire
B000001FDV	1	11	Open Sesame - Kool & The Gang
B000001FDV	1	12	Jive Talkin' - Bee Gees
B000001FDV	1	13	You Should Be Dancing - Bee Gees
B000001FDV	1	14	Boogie Shoes - K.C. And The Sunshine Band
B000001FDV	1	15	Salsation - David Shire
B000001FDV	1	16	K-Jee - M.F.S.B.
B000001FDV	1	17	Disco Inferno - Trammps
B000001FGW	1	1	Obscurity Knocks
B000001FGW	1	2	Maybe I Should Drive
B000001FGW	1	3	Thrupenny Tears
B000001FGW	1	4	Even the Odd
B000001FGW	1	5	Best Man's Fall
B000001FGW	1	6	Circling the Circumference
B000001FGW	1	7	Funny
B000001FGW	1	8	Only Tongue Can Tell
B000001FGW	1	9	You Made Me Feel
B000001FGW	1	10	January's Little Joke
B000001FLC	1	1	Prologue
B000001FLC	1	2	Overture
B000001FLC	1	3	Think Of Me
B000001FLC	1	4	Angel Of Music
B000001FLC	1	5	Little Lottie.../The Mirror...(Angel Of Music)
B000001FLC	1	6	The Phantom Of The Opera
B000001FLC	1	7	The Music Of The Night
B000001FLC	1	8	I Remember.../Stranger Than You Dream It...
B000001FLC	1	9	Magical Lasso...
B000001FLC	1	10	Notes.../Prima Donna
B000001FLC	1	11	Poor Fool, He Makes Me Laugh
B000001FLC	1	12	Why Have You Brought Me Here.../Raoul, I've Been There...
B000001FLC	1	13	All I Ask Of You
B000001FLC	1	14	All I Ask Of You (Reprise)
B000001FLC	2	1	Entr'acte
B000001FLC	2	2	Masquerade/Why So Silent...
B000001FLC	2	3	Notes.../Twisted Every Way
B000001FLC	2	4	Wishing You Were Somehow Here Again
B000001FLC	2	5	Wandering Child.../Bravo Monsieur...
B000001FLC	2	6	The Point Of No Return
B000001FLC	2	7	Down Once More.../Track Down This Murderer...
B000001FS3	1	1	Where The Streets Have No Name
B000001FS3	1	2	I Still Haven't Found What I'm Looking For
B000001FS3	1	3	With Or Without You
B000001FS3	1	4	Bullet The Blue Sky
B000001FS3	1	5	Running To Stand Still
B000001FS3	1	6	Red Hill Mining Town
B000001FS3	1	7	In God's Country
B000001FS3	1	8	Trip Through Your Wires
B000001FS3	1	9	One Tree Hill
B000001FS3	1	10	Exit
B000001FS3	1	11	Mothers Of The Disappeared
B000001FY9	1	1	Is This Love
B000001FY9	1	2	No Woman, No Cry
B000001FY9	1	3	Could You Be Loved
B000001FY9	1	4	Three Little Birds
B000001FY9	1	5	Buffalo Soldier
B000001FY9	1	6	Get Up Stand Up
B000001FY9	1	7	Stir It Up
B000001FY9	1	8	One Love/People Get Ready
B000001FY9	1	9	I Shot the Sheriff
B000001FY9	1	10	Waiting in Vain
B000001FY9	1	11	Redemption Song
B000001FY9	1	12	Satisfy My Soul
B000001FY9	1	13	Exodus
B000001FY9	1	14	Jammin'
B000001GHL	1	1	Sym No.3 'Eroica', op.55: Allegro con brio
B000001GHL	1	2	Sym No.3 'Eroica', op.55: Marcia funebre: Adagio assai
B000001GHL	1	3	Sym No.3 'Eroica', op.55: Scherzo: Allegro vivace
B000001GHL	1	4	Sym No.3 'Eroica', op.55: Finale: Allegro molto
B000001GHL	1	5	Ov 'Egmont', op.81
B000001GHL	1	6	Ov 'Coriolan', op.62
B000001GHL	1	7	Ov 'Les Creatures de Promethee', op.43
B000001GPX	1	1	Sym No.5 in c, Op.67: 1. Allegro Con Brio
B000001GPX	1	2	Sym No.5 in c, Op.67: 2. Andante Con Moto
B000001GPX	1	3	Sym No.5 in c, Op.67: 3. Allegro
B000001GPX	1	4	Sym No.5 in c, Op.67: 4. Allegro
B000001GPX	1	5	Sym No.7 in A, Op.92: 1. Poco Sostenuto - Vivace
B000001GPX	1	6	Sym No.7 in A, Op.92: 2. Allegretto
B000001GPX	1	7	Sym No.7 in A, Op.92: 3. Presto
B000001GPX	1	8	Sym No.7 in A, Op.92: 4. Allegro Con Brio
B000001Y5Z	1	1	Mr. Self Destruct
B000001Y5Z	1	2	Piggy
B000001Y5Z	1	3	Heresy
B000001Y5Z	1	4	March Of The Pigs
B000001Y5Z	1	5	Closer
B000001Y5Z	1	6	Ruiner
B000001Y5Z	1	7	The Becoming
B000001Y5Z	1	8	I Do Not Want This
B000001Y5Z	1	9	Big Man With A Gun
B000001Y5Z	1	10	A Warm Place
B000001Y5Z	1	11	Eraser
B000001Y5Z	1	12	Reptile
B000001Y5Z	1	13	The Downward Spiral
B000001Y5Z	1	14	Hurt
B0000024RJ	1	1	I Left My Heart in San Francisco
B0000024RJ	1	2	Once upon a Time
B0000024RJ	1	3	Tender Is the Night
B0000024RJ	1	4	Smile
B0000024RJ	1	5	Love for Sale
B0000024RJ	1	6	Taking a Chance on Love
B0000024RJ	1	7	Candy Kisses
B0000024RJ	1	8	Have I Told You Lately That I Love You
B0000024RJ	1	9	Rules of the Road
B0000024RJ	1	10	Marry Young
B0000024RJ	1	11	I'm Always Chasing Rainbows
B0000024RJ	1	12	Best Is Yet to Come
B0000024SI	1	1	Like A Rolling Stone
B0000024SI	1	2	Tombstone Blues
B0000024SI	1	3	It Takes A Lot To Laugh, It Takes A Train To Cry
B0000024SI	1	4	From A Buick 6
B0000024SI	1	5	Ballad Of A Thin Man
B0000024SI	1	6	Queen Jane Approximately
B0000024SI	1	7	Highway 61 Revisited
B0000024SI	1	8	Just Like Tom Thumb's Blues
B0000024SI	1	9	Desolation Row
B0000024SQ	1	1	"Song from ""The Oscar"" (Maybe September)"
B0000024SQ	1	2	Girl Talk
B0000024SQ	1	3	Gentle Rain
B0000024SQ	1	4	Emily
B0000024SQ	1	5	Pawnbroker
B0000024SQ	1	6	Samba de Orfeu
B0000024SQ	1	7	Shadow of Your Smile
B0000024SQ	1	8	Smile
B0000024SQ	1	9	Second Time Around
B0000024SQ	1	10	Days of Wine and Roses
B0000024SQ	1	11	Never Too Late
B0000024SQ	1	12	Trolley Song
B0000024V3	1	1	People
B0000024V3	1	2	Second Hand Rose
B0000024V3	1	3	Why Did I Choose You?
B0000024V3	1	4	He Touched Me
B0000024V3	1	5	Free Again
B0000024V3	1	6	Don't Rain on My Parade
B0000024V3	1	7	My Coloring Book
B0000024V3	1	8	Sam, You Made the Pants Too Long
B0000024V3	1	9	My Man
B0000024V3	1	10	Gotta Move
B0000024V3	1	11	Happy Days Are Here Again
B00000253N	1	1	Tangled up in Blue
B00000253N	1	2	Simple Twist of Fate
B00000253N	1	3	You're a Big Girl Now
B00000253N	1	4	Idiot Wind
B00000253N	1	5	You're Gonna Make Me Lonesome When You Go
B00000253N	1	6	Meet Me in the Morning
B00000253N	1	7	Lily, Rosemary and the Jack of Hearts
B00000253N	1	8	If You See Her, Say Hello
B00000253N	1	9	Shelter from the Storm
B00000253N	1	10	Buckets of Rain
B00000255F	1	1	Thunder Road
B00000255F	1	2	Tenth Avenue Freeze-Out
B00000255F	1	3	Night
B00000255F	1	4	Backstreets
B00000255F	1	5	Born to Run
B00000255F	1	6	She's The One
B00000255F	1	7	Meeting Across The River
B00000255F	1	8	Jungleland
B000002564	1	1	What Can I Say
B000002564	1	2	Georgia
B000002564	1	3	Jump Street
B000002564	1	4	What Do You Want The Girl To Do
B000002564	1	5	Harbor Lights
B000002564	1	6	Lowdown
B000002564	1	7	It's Over
B000002564	1	8	Love Me Tomorrow
B000002564	1	9	Lido Shuffle
B000002564	1	10	We're All Alone
B0000025BL	1	1	Bat Out Of Hell
B0000025BL	1	2	You Took The Words Right Out Of My Mouth (Hot Summer Night)
B0000025BL	1	3	Heaven Can Wait
B0000025BL	1	4	All Revved Up With No Place To Go
B0000025BL	1	5	Two Out Of Three Ain't Bad
B0000025BL	1	6	Paradise By The Dashboard Light: Paradise/Let Me Sleep On It/Praying For the End Of Time
B0000025BL	1	7	For Crying Out Loud
B0000025FN	1	1	Hello There
B0000025FN	1	2	Come On, Come On
B0000025FN	1	3	Lookout
B0000025FN	1	4	Big Eyes
B0000025FN	1	5	Need Your Love
B0000025FN	1	6	Ain't That A Shame
B0000025FN	1	7	I Want You To Want Me
B0000025FN	1	8	Surrender
B0000025FN	1	9	Goodnight
B0000025FN	1	10	Clock Strikes Ten
B0000025HO	1	1	Evil Woman
B0000025HO	1	2	Livin' Thing
B0000025HO	1	3	Can't Get It Out Of My Head
B0000025HO	1	4	Showdown
B0000025HO	1	5	Turn To Stone
B0000025HO	1	6	Rockaria!
B0000025HO	1	7	Sweet Talkin' Woman
B0000025HO	1	8	Telephone Line
B0000025HO	1	9	Ma-Ma-Ma Belle
B0000025HO	1	10	Strange Magic
B0000025HO	1	11	Mr. Blue Sky
B0000025HU	1	1	London Calling
B0000025HU	1	2	Brand New Cadillac
B0000025HU	1	3	Jimmy Jazz
B0000025HU	1	4	Hateful
B0000025HU	1	5	Rudie Can't Fail
B0000025HU	1	6	Spanish Bombs
B0000025HU	1	7	The Right Profile
B0000025HU	1	8	Lost In The Supermarket
B0000025HU	1	9	Clampdown
B0000025HU	1	10	The Guns Of Brixton
B0000025HU	1	11	Wrong 'Em Boyo
B0000025HU	1	12	Death Or Glory
B0000025HU	1	13	Koka Kola
B0000025HU	1	14	The Card Cheat
B0000025HU	1	15	Lover's Rock
B0000025HU	1	16	Four Horsemen
B0000025HU	1	17	I'm Not Down
B0000025HU	1	18	Revolution Rock
B0000025HU	1	19	Train In Vain
B0000025RI	1	1	Wanna Be Startin' Somethin'
B0000025RI	1	2	Baby Be Mine
B0000025RI	1	3	The Girl Is Mine
B0000025RI	1	4	Thriller
B0000025RI	1	5	Beat It
B0000025RI	1	6	Billie Jean
B0000025RI	1	7	Human Nature
B0000025RI	1	8	P.Y.T. (Pretty Young Thing)
B0000025RI	1	9	The Lady In My Life
B0000025UW	1	1	Born in the U.S.A.
B0000025UW	1	2	Cover Me
B0000025UW	1	3	Darlington County
B0000025UW	1	4	Working on the Highway
B0000025UW	1	5	Downbound Train
B0000025UW	1	6	I'm on Fire
B0000025UW	1	7	No Surrender
B0000025UW	1	8	Bobby Jean
B0000025UW	1	9	I'm Goin' Down
B0000025UW	1	10	Glory Days
B0000025UW	1	11	Dancing in the Dark
B0000025UW	1	12	My Hometown
B0000025VL	1	1	Kentucky Woman
B0000025VL	1	2	Cherry, Cherry
B0000025VL	1	3	Solitary Man
B0000025VL	1	4	You Got to Me
B0000025VL	1	5	I Got the Feelin' (Oh No, No)
B0000025VL	1	6	Thank the Lord for the Night Time
B0000025VL	1	7	I'm a Believer
B0000025VL	1	8	Girl, You'll Be a Woman Soon
B0000025VL	1	9	Shilo
B0000025VL	1	10	Do It
B0000025VL	1	11	Red, Red Wine
B0000025VL	1	12	Boat That I Row
B00000265P	1	1	Chances Are
B00000265P	1	2	It's Not for Me to Say
B00000265P	1	3	Misty
B00000265P	1	4	Wild Is the Wind
B00000265P	1	5	Wonderful! Wonderful!
B00000265P	1	6	Maria
B00000265P	1	7	Twelfth of Never
B00000265P	1	8	Small World
B00000265P	1	9	Evergreen
B00000265P	1	10	"Love Theme from ""Romeo and Juliet"""
B00000265P	1	11	What Will My Mary Say
B00000265P	1	12	When Sunny Gets Blue
B00000265P	1	13	Certain Smile
B00000265P	1	14	(Where Do I Begin) Love Story
B00000265P	1	15	Didn't We
B00000265P	1	16	Gina
B0000026CH	1	1	Faith
B0000026CH	1	2	Father Figure
B0000026CH	1	3	I Want Your Sex, Pt. 1 & 2
B0000026CH	1	4	One More Try
B0000026CH	1	5	Hard Day
B0000026CH	1	6	Hand to Mouth
B0000026CH	1	7	Look at Your Hands
B0000026CH	1	8	Monkey
B0000026CH	1	9	Kissing a Fool
B0000026CH	1	10	Hard Day [Shep Pettibone Remix]
B0000026CH	1	11	Last Request (I Want Your Sex, Pt. 3)
B0000026V1	1	1	So It Goes
B0000026V1	1	2	Heart of the City
B0000026V1	1	3	I Love the Sound of Breaking Glass
B0000026V1	1	4	Little Hitler
B0000026V1	1	5	No Reason
B0000026V1	1	6	36 Inches High
B0000026V1	1	7	Marie Provost
B0000026V1	1	8	American Squirm
B0000026V1	1	9	Cracking Up
B0000026V1	1	10	Big Kick, Plain Scrap!
B0000026V1	1	11	Born Fighter
B0000026V1	1	12	Switchboard Susan
B0000026V1	1	13	Without Love
B0000026V1	1	14	Cruel to Be Kind
B0000026V1	1	15	When I Write the Book
B0000026V1	1	16	Heart
B0000026V1	1	17	Raging Eyes
B0000026V1	1	18	Time Wounds All Heels
B0000026V1	1	19	Maureen
B0000026V1	1	20	Half a Boy and Half a Man
B0000026V1	1	21	7 Nights to Rock
B0000026V1	1	22	She Don't Love Nobody
B0000026V1	1	23	Rose of England
B0000026V1	1	24	I Knew the Bride (When She Used to Rock & Roll)
B0000026V1	1	25	Lovers Jamboree
B0000026W1	1	1	We're Not Makin' Love Anymore [#]
B0000026W1	1	2	Woman in Love
B0000026W1	1	3	All I Ask of You
B0000026W1	1	4	Comin' in and Out of Your Life
B0000026W1	1	5	What Kind of Fool - Barry Gibb
B0000026W1	1	6	Main Event/Fight
B0000026W1	1	7	Someone That I Used to Love [#]
B0000026W1	1	8	By the Way
B0000026W1	1	9	Guilty - Barry Gibb
B0000026W1	1	10	Memory {from Cats}
B0000026W1	1	11	Way He Makes Me Feel [Studio Version]
B0000026W1	1	12	Somewhere [From West Side Story]
B0000027RL	1	1	Once
B0000027RL	1	2	Even Flow
B0000027RL	1	3	Alive
B0000027RL	1	4	Why Go
B0000027RL	1	5	Black
B0000027RL	1	6	Jeremy
B0000027RL	1	7	Oceans
B0000027RL	1	8	Porch
B0000027RL	1	9	Garden
B0000027RL	1	10	Deep
B0000027RL	1	11	Release
B0000028TU	1	1	Conga
B0000028TU	1	2	Words Get In The Way
B0000028TU	1	3	Can't Stay Away From You
B0000028TU	1	4	1, 2, 3 (Remix)
B0000028TU	1	5	Rhythm Is Gonna Get You
B0000028TU	1	6	Anything For You
B0000028TU	1	7	Here We Are
B0000028TU	1	8	Get On Your Feet
B0000028TU	1	9	Don't Wanna Lose You
B0000028TU	1	10	Coming Out Of The Dark
B0000028TU	1	11	Christmas Through Your Eyes
B0000028TU	1	12	I See Your Smile
B0000028TU	1	13	Go Away
B0000028TU	1	14	Alway Tomorrow
B00000294L	1	1	So Young
B00000294L	1	2	Animal Nitrate
B00000294L	1	3	She's Not Dead
B00000294L	1	4	Moving
B00000294L	1	5	Pantomime Horse
B00000294L	1	6	Drowners
B00000294L	1	7	Sleeping Pills
B00000294L	1	8	Breakdown
B00000294L	1	9	Metal Mickey
B00000294L	1	10	Animal Lover
B00000294L	1	11	Next Life
B0000029LG	1	1	Billie Jean
B0000029LG	1	2	Way You Make Me Feel
B0000029LG	1	3	Black or White
B0000029LG	1	4	Rock With You
B0000029LG	1	5	She's Out of My Life
B0000029LG	1	6	Bad
B0000029LG	1	7	I Just Can't Stop Loving You - Siedah Garrett
B0000029LG	1	8	Man in the Mirror
B0000029LG	1	9	Thriller
B0000029LG	1	10	Beat It
B0000029LG	1	11	Girl Is Mine
B0000029LG	1	12	Remember the Time
B0000029LG	1	13	Don't Stop 'Til You Get Enough
B0000029LG	1	14	Wanna Be Startin' Somethin'
B0000029LG	1	15	Heal the World
B0000029LG	2	1	Scream - Janet Jackson
B0000029LG	2	2	They Don't Care About Us
B0000029LG	2	3	Stranger in Moscow
B0000029LG	2	4	This Time Around
B0000029LG	2	5	Earth Song
B0000029LG	2	6	D.S.
B0000029LG	2	7	Money
B0000029LG	2	8	Come Together
B0000029LG	2	9	You Are Not Alone
B0000029LG	2	10	Childhood Theme [From Free Willy 2]
B0000029LG	2	11	Tabloid Junkie
B0000029LG	2	12	2 Bad
B0000029LG	2	13	History
B0000029LG	2	14	Little Susie
B0000029LG	2	15	Smile
B0000029YC	1	1	Never an Absolution
B0000029YC	1	2	Distant Memories
B0000029YC	1	3	Southhampton
B0000029YC	1	4	Rose
B0000029YC	1	5	Leaving Port
B0000029YC	1	6	"""Take Her to Sea, Mr. Murdoch"""
B0000029YC	1	7	"""Hard to Starboard"""
B0000029YC	1	8	Unable to Stay, Unwilling to Leave
B0000029YC	1	9	Sinking
B0000029YC	1	10	Death of Titanic
B0000029YC	1	11	Promise Kept
B0000029YC	1	12	Life So Changed
B0000029YC	1	13	Ocean of Memories
B0000029YC	1	14	"My Heart Will Go On (Love Theme From""Titanic"") [Love Theme from Titanic - Celine Dion"
B0000029YC	1	15	Hymn to the Sea
B000002ADT	1	1	So What
B000002ADT	1	2	Freddie Freeloader
B000002ADT	1	3	Blue In Green
B000002ADT	1	4	All Blues
B000002ADT	1	5	Flamenco Sketches
B000002ADT	1	6	Flamenco Sketches (Alternate Take)
B000002AL7	1	1	Boulevard of Broken Dreams
B000002AL7	1	2	Because of You
B000002AL7	1	3	Cold, Cold, Heart
B000002AL7	1	4	Blue Velvet
B000002AL7	1	5	Rags to Riches
B000002AL7	1	6	Stranger in Paradise
B000002AL7	1	7	While the Music Plays On
B000002AL7	1	8	May I Never Love Again
B000002AL7	1	9	Sing You Sinners
B000002AL7	1	10	Just in Time
B000002AL7	1	11	Lazy Afternoon
B000002AL7	1	12	Ca, C'est l'Amour
B000002AL7	1	13	I Get a Kick Out of You
B000002AL7	1	14	It Amazes Me
B000002AL7	1	15	Penthouse Serenade (When We're Alone)
B000002AL7	1	16	Lost in the Stars
B000002AL7	1	17	Lullaby of Broadway
B000002AL7	1	18	Firefly
B000002AL7	1	19	Sleepin' Bee
B000002AL7	1	20	Man That Got Away
B000002AL7	1	21	Skylark
B000002AL7	1	22	September Song
B000002AL7	1	23	Till
B000002AL7	2	1	Begin the Beguine
B000002AL7	2	2	Put on a Happy Face
B000002AL7	2	3	Best Is Yet to Come
B000002AL7	2	4	This Time the Dream's on Me
B000002AL7	2	5	Close Your Eyes
B000002AL7	2	6	Toot, Toot, Tootsie, Goodbye
B000002AL7	2	7	Dancing in the Dark
B000002AL7	2	8	Stella by Starlight
B000002AL7	2	9	Tender Is the Night
B000002AL7	2	10	Once Upon a Time
B000002AL7	2	11	I Left My Heart in San Francisco
B000002AL7	2	12	Until I Met You
B000002AL7	2	13	If I Love Again
B000002AL7	2	14	I Wanna Be Around
B000002AL7	2	15	Good Life
B000002AL7	2	16	It Was Me
B000002AL7	2	17	Spring in Manhattan
B000002AL7	2	18	Moment of Truth
B000002AL7	2	19	This Is All I Ask
B000002AL7	2	20	Taste of Honey
B000002AL7	2	21	When Joanna Loved Me
B000002AL7	2	22	I'll Be Around
B000002AL7	3	1	Nobody Else But Me
B000002AL7	3	2	It Had to Be You
B000002AL7	3	3	I've Got Just About Everything
B000002AL7	3	4	Who Can I Turn To (When Nobody Needs Me)
B000002AL7	3	5	Waltz for Debby
B000002AL7	3	6	I Walk a Little Faster
B000002AL7	3	7	Wrap Your Troubles in Dreams (And Dream Your Troubles Away)
B000002AL7	3	8	If I Ruled the World
B000002AL7	3	9	Fly Me to the Moon (In Other Words)
B000002AL7	3	10	Love Scene
B000002AL7	3	11	Sweet Lorraine
B000002AL7	3	12	Shadow of Your Smile
B000002AL7	3	13	I'll Only Miss Her When I Think of Her
B000002AL7	3	14	Baby, Dream Your Dream
B000002AL7	3	15	Smile
B000002AL7	3	16	"Song from ""The Oscar"" (Maybe September)"
B000002AL7	3	17	Emily
B000002AL7	3	18	Very Thought of You
B000002AL7	3	19	Time for Love
B000002AL7	3	20	Country Girl
B000002AL7	4	1	Days of Love
B000002AL7	4	2	Keep Smiling at Trouble (Trouble's a Bubble)
B000002AL7	4	3	For Once in My Life
B000002AL7	4	4	Who Cares? (So Long as You Care for Me)
B000002AL7	4	5	Hi-Ho!
B000002AL7	4	6	Baby, Don't You Quit Now
B000002AL7	4	7	Something
B000002AL7	4	8	I Do Not Know a Day I Did Not Love You
B000002AL7	4	9	Old Devil Moon [Live]
B000002AL7	4	10	Remind Me
B000002AL7	4	11	Maybe This Time
B000002AL7	4	12	Some Other Time
B000002AL7	4	13	My Foolish Heart
B000002AL7	4	14	But Beautiful
B000002AL7	4	15	How Do You Keep the Music Playing?
B000002AL7	4	16	What Are You Afraid Of?
B000002AL7	4	17	Why Do People Fall in Love?/People
B000002AL7	4	18	I Got Lost in Her Arms
B000002AL7	4	19	When I Lost You
B000002AL7	4	20	Shaking the Blues Away
B000002AL7	4	21	Antonia
B000002AL7	4	22	When Do the Bells Ring for Me?
B000002BBY	1	1	Hello
B000002BBY	1	2	Roll With It
B000002BBY	1	3	Wonderwall
B000002BBY	1	4	Don't Look Back in Anger
B000002BBY	1	5	Hey Now!
B000002BBY	1	6	[Untitled Track]
B000002BBY	1	7	Some Might Say
B000002BBY	1	8	Cast No Shadow
B000002BBY	1	9	She's Electric
B000002BBY	1	10	Morning Glory
B000002BBY	1	11	[Untitled Track]
B000002BBY	1	12	Champagne Supernova
B000002BHE	1	1	It's All Coming Back to Me Now
B000002BHE	1	2	Because You Loved Me [Theme from Up Close & Personal]
B000002BHE	1	3	Falling into You
B000002BHE	1	4	Make You Happy
B000002BHE	1	5	Seduces Me
B000002BHE	1	6	All by Myself
B000002BHE	1	7	Declaration of Love
B000002BHE	1	8	Dreaming of You
B000002BHE	1	9	I Love You
B000002BHE	1	10	If That's What It Takes
B000002BHE	1	11	I Don't Know
B000002BHE	1	12	River Deep-Mountain High
B000002BHE	1	13	Call the Man
B000002BHE	1	14	Fly
B000002BQK	1	1	Honey
B000002BQK	1	2	Butterfly
B000002BQK	1	3	My All
B000002BQK	1	4	The Roof
B000002BQK	1	5	Fourth Of July
B000002BQK	1	6	Breakdown
B000002BQK	1	7	Babydoll
B000002BQK	1	8	Close My Eyes
B000002BQK	1	9	Whenever You Call
B000002BQK	1	10	Fly Away (Butterfly Reprise)
B000002BQK	1	11	The Beautiful Ones
B000002BQK	1	12	Outside
B000002BZ0	1	1	I Can Love You Better
B000002BZ0	1	2	Wide Open Spaces
B000002BZ0	1	3	Loving Arms
B000002BZ0	1	4	There's Your Trouble
B000002BZ0	1	5	You Were Mine
B000002BZ0	1	6	Never Say Die
B000002BZ0	1	7	Tonight The Heartache's On Me
B000002BZ0	1	8	Let 'Er Rip
B000002BZ0	1	9	Once You've Loved Somebody
B000002BZ0	1	10	I'll Take Care Of You
B000002BZ0	1	11	Am I The Only One (Who's Ever Felt This Way)
B000002BZ0	1	12	Give It Up Or Let Me Go
B000002C4J	1	1	The Reason
B000002C4J	1	2	Immortality
B000002C4J	1	3	Treat Her Like A Lady
B000002C4J	1	4	Why Oh Why
B000002C4J	1	5	Love Is On The Way
B000002C4J	1	6	Tell Him
B000002C4J	1	7	Where Is The Love
B000002C4J	1	8	When I Need You
B000002C4J	1	9	Miles To Go (Before I Sleep)
B000002C4J	1	10	Us
B000002C4J	1	11	Just A Little Bit Of Love
B000002C4J	1	12	My Heart Will Go On
B000002C4J	1	13	I Hate You Then I Love You
B000002C4J	1	14	To Love You More
B000002C4J	1	15	Let's Talk About Love
B000002G3U	1	1	Roxanne
B000002G3U	1	2	Can't Stand Losing You
B000002G3U	1	3	Message In A Bottle
B000002G3U	1	4	Walking On The Moon
B000002G3U	1	5	Don't Stand So Close To Me
B000002G3U	1	6	De Do Do Do, De Da Da Da
B000002G3U	1	7	Every Little Thing She Does Is Magic
B000002G3U	1	8	Invisible Sun
B000002G3U	1	9	Spirits In The Material World
B000002G3U	1	10	Every Breath You Take
B000002G3U	1	11	King Of Pain
B000002G3U	1	12	Wrapped Around Your Finger
B000002G3U	1	13	Don't Stand So Close To Me '86
B000002G3U	1	14	Message In A Bottle (New Classic Rock Mix)
B000002GE7	1	1	Take Me, I'm Yours
B000002GE7	1	2	Goodbye Girl
B000002GE7	1	3	Cool for Cats
B000002GE7	1	4	Up the Junction
B000002GE7	1	5	Slap and Tickle
B000002GE7	1	6	Another Nail in My Heart
B000002GE7	1	7	Pulling Mussels (From the Shell)
B000002GE7	1	8	If I Didn't Love You
B000002GE7	1	9	Is That Love
B000002GE7	1	10	Tempted
B000002GE7	1	11	Black Coffee in Bed
B000002GE7	1	12	Annie Get Your Gun
B000002GVO	1	1	Hotel California
B000002GVO	1	2	New Kid In Town
B000002GVO	1	3	Life In The Fast Lane
B000002GVO	1	4	Wasted Time
B000002GVO	1	5	Wasted Time (Reprise)
B000002GVO	1	6	Victim Of Love
B000002GVO	1	7	Pretty Maids All In A Row
B000002GVO	1	8	Try And Love Again
B000002GVO	1	9	The Last Resort
B000002GVS	1	1	Take It Easy
B000002GVS	1	2	Witchy Woman
B000002GVS	1	3	Lyin' Eyes
B000002GVS	1	4	Already Gone
B000002GVS	1	5	Desperado
B000002GVS	1	6	One Of These Nights
B000002GVS	1	7	Tequila Sunrise
B000002GVS	1	8	Take It To The Limit
B000002GVS	1	9	Peaceful, Easy Feeling
B000002GVS	1	10	Best Of My Love
B000002H33	1	1	Battery
B000002H33	1	2	Master of Puppets
B000002H33	1	3	Thing That Should Not Be
B000002H33	1	4	Welcome Home (Sanitarium)
B000002H33	1	5	Disposable Heroes
B000002H33	1	6	Leper Messiah
B000002H33	1	7	Orion [Instrumental]
B000002H33	1	8	Damage, Inc.
B000002H97	1	1	Enter Sandman
B000002H97	1	2	Sad but True
B000002H97	1	3	Holier Than Thou
B000002H97	1	4	Unforgiven
B000002H97	1	5	Wherever I May Roam
B000002H97	1	6	Don't Tread on Me
B000002H97	1	7	Through the Never
B000002H97	1	8	Nothing Else Matters
B000002H97	1	9	Of Wolf and Man
B000002H97	1	10	God That Failed
B000002H97	1	11	My Friend of Misery
B000002H97	1	12	Struggle Within
B000002I25	1	1	Break on Through (To the Other Side)
B000002I25	1	2	Soul Kitchen
B000002I25	1	3	Crystal Ship
B000002I25	1	4	Twentieth Century Fox
B000002I25	1	5	Alabama Song (Whiskey Bar)
B000002I25	1	6	Light My Fire
B000002I25	1	7	Back Door Man
B000002I25	1	8	I Looked at You
B000002I25	1	9	End of the Night
B000002I25	1	10	Take It as It Comes
B000002I25	1	11	End
B000002I4U	1	1	Let The Good Times Roll
B000002I4U	1	2	It Had To Be You
B000002I4U	1	3	Alexander's Ragtime Bands
B000002I4U	1	4	Two Years Of Torture
B000002I4U	1	5	When Your Lover Has Gone
B000002I4U	1	6	Deed I Do
B000002I4U	1	7	Just For A Thrill
B000002I4U	1	8	You Won't Let Me Go
B000002I4U	1	9	Tell Me You'll Wait For Me
B000002I4U	1	10	Don't Let The Sun Catch You Cryin'
B000002I4U	1	11	Am I Blue
B000002I4U	1	12	Come Rain Or Come Shine
B000002IKH	1	1	I Like the Likes of You
B000002IKH	1	2	Manhattan
B000002IKH	1	3	You Make Me Feel So Young
B000002IKH	1	4	You Are Not My First Love
B000002IKH	1	5	Gimme a Pigfoot (And a Bottle of Beer)
B000002IKH	1	6	Sweet Bye and Bye
B000002IKH	1	7	Autumn in New York
B000002IKH	1	8	From This Moment On
B000002IKH	1	9	Down With Love
B000002IKH	1	10	I've Got Five Dollars
B000002IKH	1	11	Sand in My Shoes
B000002IKH	1	12	At the Moving Picture Ball
B000002IKH	1	13	Bye Bye Blackbird
B000002IKH	1	14	Most Beautiful Girl in the World
B000002IKH	1	15	Easy Come, Easy Go
B000002IKH	1	16	So Near and Yet So Far
B000002IKH	1	17	Bedelia
B000002IKH	1	18	I Love You, Samantha
B000002IKH	1	19	Hooray for Love
B000002IKH	1	20	Down in Mexico
B000002IKH	1	21	This Is What I Call Love
B000002IKH	1	22	Dream Dancing
B000002IKH	1	23	It's Bad for Me
B000002IKH	1	24	From Now On
B000002IKH	1	25	Lydia, the Tattooed Lady
B000002IKH	1	26	Be My Host
B000002IKH	2	1	Some Fine Day
B000002IKH	2	2	Wake Up, Chillun, Wake Up
B000002IKH	2	3	Sweet So and So
B000002IKH	2	4	Changes
B000002IKH	2	5	Don't Bring Lulu
B000002IKH	2	6	Delia's Gone
B000002IKH	2	7	Just for Today
B000002IKH	2	8	Romance in the Dark
B000002IKH	2	9	Simon Smith & His Dancing Bear
B000002IKH	2	10	I Love to Rhyme
B000002IKH	2	11	Don't Mention Love to Me
B000002IKH	2	12	Best Is Yet to Come
B000002IKH	2	13	Bojangles of Harlem
B000002IKH	2	14	Something to Live For
B000002IKH	2	15	And Her Mother Came Too
B000002IKH	2	16	On the Amazon
B000002IKH	2	17	I Can't Get Started
B000002IKH	2	18	Rap Tap on Wood
B000002IKH	2	19	Room With a View
B000002IKH	2	20	If Love Were All
B000002IKH	2	21	I'll See You Again
B000002IKH	2	22	Losing My Mind
B000002IKH	2	23	Spring Is Here
B000002IKH	2	24	Our Love Is Here to Stay
B000002IT2	1	1	Crucify
B000002IT2	1	2	Girl
B000002IT2	1	3	Silent All These Years
B000002IT2	1	4	Precious Things
B000002IT2	1	5	Winter
B000002IT2	1	6	Happy Phantom
B000002IT2	1	7	China
B000002IT2	1	8	Leather
B000002IT2	1	9	Mother
B000002IT2	1	10	Tear In Your Hand
B000002IT2	1	11	Me And A Gun
B000002IT2	1	12	Little Earthquakes
B000002IVS	1	1	Hello in There
B000002IVS	1	2	Do You Want to Dance?
B000002IVS	1	3	From a Distance
B000002IVS	1	4	Chapel of Love
B000002IVS	1	5	Only in Miami
B000002IVS	1	6	When a Man Loves a Woman
B000002IVS	1	7	Rose
B000002IVS	1	8	Miss Otis Regrets
B000002IVS	1	9	Shiver Me Timbers
B000002IVS	1	10	Wind Beneath My Wings
B000002IVS	1	11	Boogie Woogie Bugle Boy
B000002IVS	1	12	One for My Baby (And One More for the Road)
B000002IVS	1	13	Friends
B000002IVS	1	14	In My Life
B000002IZ1	1	1	Rollercoaster
B000002IZ1	1	2	Troubled Mind
B000002IZ1	1	3	I Don't Understand Anything
B000002IZ1	1	4	Walking To You
B000002IZ1	1	5	Get Me
B000002IZ1	1	6	Missing
B000002IZ1	1	7	Two Star
B000002IZ1	1	8	We Walk The Same Line
B000002IZ1	1	9	25th December
B000002IZ1	1	10	Disenchanted
B000002IZ1	1	11	Missing (Todd Terry Club Mix)
B000002J09	1	1	Black Dog
B000002J09	1	2	Rock And Roll
B000002J09	1	3	The Battle Of Evermore
B000002J09	1	4	Stairway To Heaven
B000002J09	1	5	Misty Mountain Hop
B000002J09	1	6	Four Sticks
B000002J09	1	7	Going To California
B000002J09	1	8	When The Levee Breaks
B000002JOT	1	1	Mack the Knife
B000002JOT	1	2	Lazy River
B000002JOT	1	3	That's the Way Love Is
B000002JOT	1	4	Beyond the Sea
B000002JOT	1	5	Was There a Call for Me
B000002JOT	1	6	I Guess I'm Good for Nothing But the Blues
B000002JOT	1	7	Don't Dream of Anybody But Me
B000002JOT	1	8	Guys and Dolls
B000002JOT	1	9	Down With Love
B000002JOT	1	10	Black Coffee
B000002JOT	1	11	Pete Kelly's Blues
B000002JOT	1	12	Clementine
B000002JOT	1	13	Bill Bailey, Won't You Please Come Home
B000002JOT	1	14	Artificial Flowers
B000002JOT	1	15	I Didn't Know What Time It Was
B000002JOT	1	16	What a Difference a Day Made
B000002JOT	1	17	Skylark
B000002JOT	1	18	Just Friends
B000002JOT	1	19	Don't Get Around Much Anymore
B000002JOT	1	20	I Guess I'll Have to Change My Plan
B000002JOT	1	21	Christmas Auld Lang Syne
B000002KBX	1	1	Sail Away
B000002KBX	1	2	Lonely at the Top
B000002KBX	1	3	He Gives Us All His Love
B000002KBX	1	4	Last Night I Had a Dream
B000002KBX	1	5	Simon Smith and the Amazing Dancing Bear
B000002KBX	1	6	Old Man
B000002KBX	1	7	Political Science
B000002KBX	1	8	Burn On
B000002KBX	1	9	Memo to My Son
B000002KBX	1	10	Dayton, Ohio-1903
B000002KBX	1	11	You Can Leave Your Hat On
B000002KBX	1	12	God's Song (That's Why I Love Mankind)
B000002KGT	1	1	Second Hand News
B000002KGT	1	2	Dreams
B000002KGT	1	3	Never Going Back Again
B000002KGT	1	4	Don't Stop
B000002KGT	1	5	Go Your Own Way
B000002KGT	1	6	Songbird
B000002KGT	1	7	Chain
B000002KGT	1	8	You Make Loving Fun
B000002KGT	1	9	I Don't Want to Know
B000002KGT	1	10	Oh Daddy
B000002KGT	1	11	Gold Dust Woman
B000002KHF	1	1	And It Stoned Me
B000002KHF	1	2	Moondance
B000002KHF	1	3	Crazy Love
B000002KHF	1	4	Caravan
B000002KHF	1	5	Into the Mystic
B000002KHF	1	6	Come Running
B000002KHF	1	7	These Dreams of You
B000002KHF	1	8	Brand New Day
B000002KHF	1	9	Everyone
B000002KHF	1	10	Glad Tidings
B000002L68	1	1	Let's Go Crazy
B000002L68	1	2	Take Me With U
B000002L68	1	3	The Beautiful Ones
B000002L68	1	4	Computer Blue
B000002L68	1	5	Darling Nikki
B000002L68	1	6	When Doves Cry
B000002L68	1	7	I Would Die 4 U
B000002L68	1	8	Baby I'm A Star
B000002L68	1	9	Purple Rain
B000002L9J	1	1	Queen Is Dead (Take Me Back to Dear Old Blighty) [Medley]
B000002L9J	1	2	Frankly, Mr. Shankly
B000002L9J	1	3	I Know It's Over
B000002L9J	1	4	Never Had No One Ever
B000002L9J	1	5	Cemetry Gates
B000002L9J	1	6	Bigmouth Strikes Again
B000002L9J	1	7	Boy With the Thorn in His Side
B000002L9J	1	8	Vicar in a Tutu
B000002L9J	1	9	There Is a Light That Never Goes Out
B000002L9J	1	10	Some Girls Are Bigger Than Others
B000002LD7	1	1	Stop Your Sobbing
B000002LD7	1	2	Kid
B000002LD7	1	3	Brass in Pocket
B000002LD7	1	4	Talk of the Town
B000002LD7	1	5	I Go to Sleep
B000002LD7	1	6	Day After Day
B000002LD7	1	7	Message of Love
B000002LD7	1	8	Back on the Chain Gang
B000002LD7	1	9	Middle of the Road
B000002LD7	1	10	2000 Miles
B000002LD7	1	11	Show Me
B000002LD7	1	12	Thin Line Between Love and Hate
B000002LD7	1	13	Don't Get Me Wrong
B000002LD7	1	14	Hymn to Her
B000002LD7	1	15	My Baby
B000002LD7	1	16	I Got You Babe - UB40
B000002LND	1	1	Holiday
B000002LND	1	2	Lucky Star
B000002LND	1	3	Borderline
B000002LND	1	4	Like A Virgin
B000002LND	1	5	Material Girl
B000002LND	1	6	Crazy For You
B000002LND	1	7	Into The Groove
B000002LND	1	8	Live To Tell
B000002LND	1	9	Papa Don't Preach
B000002LND	1	10	Open Your Heart
B000002LND	1	11	La Isla Bonita
B000002LND	1	12	Like A Prayer
B000002LND	1	13	Express Yourself
B000002LND	1	14	Cherish
B000002LND	1	15	Vogue
B000002LND	1	16	Justify My Love
B000002LND	1	17	Rescue Me
B000002LRR	1	1	Watermark
B000002LRR	1	2	Cursum Perficio
B000002LRR	1	3	On Your Shore
B000002LRR	1	4	Storms in Africa
B000002LRR	1	5	Exile
B000002LRR	1	6	Miss Clare Remembers
B000002LRR	1	7	Orinoco Flow
B000002LRR	1	8	Evening Falls...
B000002LRR	1	9	River
B000002LRR	1	10	Longships
B000002LRR	1	11	Na Laetha Gael M'Uige
B000002LRR	1	12	Storms in Africa, Pt. 2
B000002LSP	1	1	Save Me
B000002LSP	1	2	Mind of Love
B000002LSP	1	3	Miss Chatelaine
B000002LSP	1	4	Wash Me Clean
B000002LSP	1	5	So It Shall Be
B000002LSP	1	6	Still Thrives This Love
B000002LSP	1	7	Season of Hollow Soul
B000002LSP	1	8	Outside Myself
B000002LSP	1	9	Tears of Love's Recall
B000002LSP	1	10	Constant Craving
B000002MFE	1	1	Signe
B000002MFE	1	2	Before You Accuse Me
B000002MFE	1	3	Hey Hey
B000002MFE	1	4	Tears in Heaven
B000002MFE	1	5	Lonely Stranger
B000002MFE	1	6	Nobody Knows You When You're Down and Out
B000002MFE	1	7	Layla
B000002MFE	1	8	Running on Faith
B000002MFE	1	9	Walkin' Blues
B000002MFE	1	10	Alberta
B000002MFE	1	11	San Francisco Bay Blues
B000002MFE	1	12	Malted Milk
B000002MFE	1	13	Old Love
B000002MFE	1	14	Rollin' and Tumblin'
B000002MG1	1	1	Drive
B000002MG1	1	2	Try Not To Breathe
B000002MG1	1	3	The Sidewinder Sleeps Tonite
B000002MG1	1	4	Everybody Hurts
B000002MG1	1	5	New Orleans Instrumental No.1
B000002MG1	1	6	Sweetness Follows
B000002MG1	1	7	Monty Got A Raw Deal
B000002MG1	1	8	Ignoreland
B000002MG1	1	9	Star Me Kitten
B000002MG1	1	10	Man On The Moon
B000002MG1	1	11	Nightswimming
B000002MG1	1	12	Find The River
B000002MH7	1	1	San Francisco Days
B000002MH7	1	2	Beautiful Homes
B000002MH7	1	3	Round 'N' Round
B000002MH7	1	4	Two Hearts
B000002MH7	1	5	Can't Do a Thing (To Stop Me)
B000002MH7	1	6	Except the New Girl
B000002MH7	1	7	Waiting
B000002MH7	1	8	Move Along
B000002MH7	1	9	I Want Your Love
B000002MH7	1	10	5:15
B000002MH7	1	11	Lonely With a Broken Heart
B000002MH7	1	12	Solitary Man
B000002MY3	1	1	All I Really Want
B000002MY3	1	2	You Oughta Know
B000002MY3	1	3	Perfect
B000002MY3	1	4	Hand in My Pocket
B000002MY3	1	5	Right Through You
B000002MY3	1	6	Forgiven
B000002MY3	1	7	You Learn
B000002MY3	1	8	Head over Feet
B000002MY3	1	9	Mary Jane
B000002MY3	1	10	Ironic
B000002MY3	1	11	Not the Doctor
B000002MY3	1	12	Wake Up
B000002MY3	1	13	You Oughta Know [Alternate Take]
B000002NBY	1	1	The Boy In The Bubble
B000002NBY	1	2	Graceland
B000002NBY	1	3	I Know What I Know
B000002NBY	1	4	Gumboots
B000002NBY	1	5	Diamonds On The Soles Of Her Shoes
B000002NBY	1	6	You Can Call Me Al
B000002NBY	1	7	Under African Skies
B000002NBY	1	8	Homeless
B000002NBY	1	9	Crazy Love, Vol. II
B000002NBY	1	10	That Was Your Mother
B000002NBY	1	11	All Around The World Or The Myth Of The Fingerprints
B000002NJS	1	1	Drowned World/Substitute for Love
B000002NJS	1	2	Swim
B000002NJS	1	3	Ray of Light
B000002NJS	1	4	Candy Perfume Girl
B000002NJS	1	5	Skin
B000002NJS	1	6	Nothing Really Matters
B000002NJS	1	7	Sky Fits Heaven
B000002NJS	1	8	Shanti/Ashtangi
B000002NJS	1	9	Frozen
B000002NJS	1	10	Power of Goodbye
B000002NJS	1	11	To Have and Not to Hold
B000002NJS	1	12	Little Star
B000002NJS	1	13	Mer Girl
B000002O72	1	1	All I Want
B000002O72	1	2	Bound in a Nutshell
B000002O72	1	3	Pure
B000002O72	1	4	Sweet Dreams
B000002O72	1	5	Nearly Man
B000002O72	1	6	Joy
B000002O72	1	7	Love Explosion
B000002O72	1	8	Don't Let Go
B000002O72	1	9	Control the Flame
B000002O72	1	10	Price
B000002O72	1	11	Fools
B000002O72	1	12	Frenzy [*]
B000002OPK	1	1	Where the Blue of the Night (Meets the Gold of the Day)
B000002OPK	1	2	Out of Nowhere
B000002OPK	1	3	Just One More Chance
B000002OPK	1	4	I'm Through With Love
B000002OPK	1	5	I Found a Million Dollar Baby (In a Five and Ten Cent Store)
B000002OPK	1	6	At Your Command
B000002OPK	1	7	I Apologize
B000002OPK	1	8	Dancing in the Dark
B000002OPK	1	9	Stardust
B000002OPK	1	10	Moon Was Yellow
B000002OPK	1	11	Two Cigarettes in the Dark
B000002OPK	1	12	With Every Breath I Take
B000002OPK	1	13	June in January
B000002OPK	1	14	Love Is Just Around the Corner
B000002OPK	1	15	Soon
B000002OPK	1	16	Down by the River
B000002OPK	1	17	It's Easy to Remember
B000002OPK	1	18	Red Sails in the Sunset
B000002OPK	1	19	Silent Night
B000002OPK	1	20	I Got Plenty O' Nuttin'
B000002OPK	1	21	I'm an Old Cowhand (From the Rio Grande)
B000002OPK	1	22	Pennies from Heaven
B000002OPK	1	23	Fine Romance
B000002OPK	1	24	Sweet Leilani
B000002OPK	2	1	Blue Hawaii
B000002OPK	2	2	Too Marvelous for Words
B000002OPK	2	3	It's the Natural Thing to Do
B000002OPK	2	4	Moon Got in My Eyes
B000002OPK	2	5	Remember Me
B000002OPK	2	6	Bob White (Whatcha Gonna Swing Tonight?)
B000002OPK	2	7	Don't Be That Way
B000002OPK	2	8	Swing Low, Sweet Chariot
B000002OPK	2	9	Small Fry
B000002OPK	2	10	I've Got a Pocketful of Dreams
B000002OPK	2	11	Mexicali Rose
B000002OPK	2	12	You Must Have Been a Beautiful Baby
B000002OPK	2	13	Wrap Your Troubles in Dreams (And Dream Your Troubles Away)
B000002OPK	2	14	Somebody Loves Me
B000002OPK	2	15	What's New?
B000002OPK	2	16	Sierra Sue
B000002OPK	2	17	Trade Winds
B000002OPK	2	18	Only Forever
B000002OPK	2	19	New San Antonio Rose
B000002OPK	2	20	Humpty Dumpty Heart
B000002OPK	2	21	Deep in the Heart of Texas
B000002OPK	2	22	Wait Till the Sun Shines Nellie
B000002OPK	2	23	When My Dreamboat Comes Home
B000002OPK	2	24	White Christmas
B000002OPK	2	25	Easter Parade
B000002OPK	3	1	Be Careful, It's My Heart
B000002OPK	3	2	Adeste Fideles
B000002OPK	3	3	Moonlight Becomes You
B000002OPK	3	4	Sunday, Monday or Always
B000002OPK	3	5	Mississippi Mud/I Left My Sugar Standing in the Rain
B000002OPK	3	6	Pistol Packin' Mama
B000002OPK	3	7	I'll Be Home for Christmas
B000002OPK	3	8	San Fernando Valley
B000002OPK	3	9	Close the Door Joe, We're Making a Disc! [#]
B000002OPK	3	10	Swinging on a Star
B000002OPK	3	11	I Love You
B000002OPK	3	12	I'll Be Seeing You [Rehearsal Glimpse] [#]
B000002OPK	3	13	I'll Be Seeing You
B000002OPK	3	14	On the Atchison, Topeka and the Santa Fe
B000002OPK	3	15	Song of the Fifth Marines [#]
B000002OPK	3	16	(There'll Be A) Hot Time in the Town of Berlin (When the Yanks Go March
B000002OPK	3	17	Don't Fence Me In
B000002OPK	3	18	My Baby Said Yes (Yip Yip de Hootie)
B000002OPK	3	19	Mine
B000002OPK	3	20	AC-Cent-Tchu-Ate the Positive
B000002OPK	3	21	Road to Morocco
B000002OPK	3	22	You Belong to My Heart
B000002OPK	3	23	It's Been a Long, Long Time
B000002OPK	3	24	Too-Ra-Loo-Ra-Loo-Ral (That's an Irish Lullaby)
B000002OPK	3	25	I Can't Begin to Tell You
B000002OPK	3	26	Day by Day
B000002OPK	3	27	MacNamara's Band
B000002OPK	3	28	South America, Take It Away!
B000002OPK	4	1	Alexander's Ragtime Band
B000002OPK	4	2	Spaniard That Blighted My Life [#]
B000002OPK	4	3	Whiffenpoof Song
B000002OPK	4	4	Now Is the Hour
B000002OPK	4	5	But Beautiful
B000002OPK	4	6	Galway Bay
B000002OPK	4	7	Far Away Places
B000002OPK	4	8	Sing Soft, Sing Sweet, Sing Gentle
B000002OPK	4	9	Dear Hearts and Gentle People
B000002OPK	4	10	Chattanoogie Shoe Shine Boy
B000002OPK	4	11	Play a Simple Melody
B000002OPK	4	12	Sam's Song (The Happy Tune)
B000002OPK	4	13	Harbor Lights
B000002OPK	4	14	Autumn Leaves
B000002OPK	4	15	Silver Bells
B000002OPK	4	16	Getting to Know You
B000002OPK	4	17	Gone Fishin' [Live]
B000002OPK	4	18	In the Cool, Cool, Cool of the Evening
B000002OPK	4	19	Watermelon Weather
B000002OPK	4	20	Thanks for the Memory
B000002OPK	4	21	Around the World (In Eighty Days)
B000002OPK	4	22	Softly, As in a Morning Sunrise
B000002OPK	4	23	Gigi
B000002OPK	4	24	Where the Blue of the Night (Meets the Gold of the Day)
B000002OX5	1	1	Armenia City In The Sky
B000002OX5	1	2	Heinz Baked Beans
B000002OX5	1	3	Mary Anne With The Shaky Hand
B000002OX5	1	4	Odorono
B000002OX5	1	5	Tattoo
B000002OX5	1	6	Our Love Was
B000002OX5	1	7	I Can See For Miles
B000002OX5	1	8	I Can't Reach You
B000002OX5	1	9	Medac
B000002OX5	1	10	Relax
B000002OX5	1	11	Silas Stingy
B000002OX5	1	12	Sunrise
B000002OX5	1	13	Rael 1
B000002OX5	1	14	Rael 2
B000002OX5	1	15	Glittering Girl
B000002OX5	1	16	Melancholia
B000002OX5	1	17	Someone's Coming
B000002OX5	1	18	Jaguar
B000002OX5	1	19	Early Morning Cold Taxi
B000002OX5	1	20	Hall Of The Mountain King
B000002OX5	1	21	Girl's Eyes
B000002OX5	1	22	Mary Anne With The Shaky Hand (Alternative Version)
B000002OX5	1	23	Glow Girl
B000002P5Y	1	1	Purple Haze
B000002P5Y	1	2	Manic Depression
B000002P5Y	1	3	Hey Joe
B000002P5Y	1	4	Love Or Confusion
B000002P5Y	1	5	May This Be Love
B000002P5Y	1	6	I Don't Live Today
B000002P5Y	1	7	The Wind Cries Mary
B000002P5Y	1	8	Fire
B000002P5Y	1	9	Third Stone From The Sun
B000002P5Y	1	10	Foxey Lady
B000002P5Y	1	11	Are You Experienced?
B000002P5Y	1	12	Stone Free
B000002P5Y	1	13	51st Aniversary
B000002P5Y	1	14	Highway Chile
B000002P5Y	1	15	Can You See Me
B000002P5Y	1	16	Remember
B000002P5Y	1	17	Red House
B000002PEF	1	1	If I Didn't Care
B000002PEF	1	2	Address Unkown
B000002PEF	1	3	My Prayer
B000002PEF	1	4	When The Swallows Come Back To Capistrano
B000002PEF	1	5	Whispering Grass (Don't Tell The Trees)
B000002PEF	1	6	Maybe
B000002PEF	1	7	I'll Never Smile Again
B000002PEF	1	8	We Three (My Echo, My Shadow, And Me)
B000002PEF	1	9	Java Jive
B000002PEF	1	10	I Don't Want To Set The World On Fire
B000002PEF	1	11	Someone's Rocking My Dreamboat
B000002PEF	1	12	Street Of Dreams
B000002PEF	1	13	I'll Get By (As Long As I Have You)
B000002PEF	1	14	The Gypsy
B000002PEF	1	15	To Each His Own
B000002TRT	1	1	Unforgettable
B000002TRT	1	2	(Get Your Kicks On) Route 66
B000002TRT	1	3	Orange Colored Sky
B000002TRT	1	4	Mona Lisa
B000002TRT	1	5	Walkin' My Baby Back Home
B000002TRT	1	6	Straighten Up And Fly Right
B000002TRT	1	7	Send For Me
B000002TRT	1	8	Looking Back
B000002TRT	1	9	You Call It Madness (But I Call It Love)
B000002TRT	1	10	(I Love You) For Sentimental Reasons
B000002TRT	1	11	Nature Boy
B000002TRT	1	12	Ramblin' Rose
B000002TRT	1	13	Pretend
B000002TRT	1	14	Too Young
B000002TRT	1	15	Somewhere Along The Way
B000002TRT	1	16	Those Lazy-Hazy-Crazy Days Of Summer
B000002TRT	1	17	Smile
B000002TRT	1	18	Darling, Je Vous Aime Beaucoup
B000002TRT	1	19	Answer Me, My Love
B000002TRT	1	20	A Blossom Fell
B000002TRT	1	21	If I May
B000002TRT	1	22	Unforgettable
B000002TU5	1	1	Snowbird
B000002TU5	1	2	Now and Forever (You and Me)
B000002TU5	1	3	Danny's Song
B000002TU5	1	4	Nobody Loves Me Like You Do
B000002TU5	1	5	Love Song
B000002TU5	1	6	Time Don't Run Out on Me
B000002TU5	1	7	You Won't See Me
B000002TU5	1	8	Just Another Woman in Love
B000002TU5	1	9	You Needed Me
B000002TU5	1	10	Little Good News
B000002TU5	1	11	I Just Fall in Love Again
B000002TU5	1	12	Somebody's Always Saying Goodbye
B000002TU5	1	13	Broken Hearted Me
B000002TU5	1	14	Could I Have This Dance
B000002TU5	1	15	Daydream Believer
B000002TU5	1	16	Another Sleepless Night
B000002TU5	1	17	Shadows in the Moonlight
B000002TU5	1	18	Blessed Are the Believers
B000002TU5	1	19	Make Love to Me
B000002TU5	1	20	Over You
B000002U82	1	1	Speak To Me/Breathe
B000002U82	1	2	On The Run
B000002U82	1	3	Time
B000002U82	1	4	The Great Gig In The Sky
B000002U82	1	5	Money
B000002U82	1	6	Us And Them
B000002U82	1	7	Any Colour You Like
B000002U82	1	8	Brain Damage
B000002U82	1	9	Eclipse
B000002U98	1	1	Swingtown
B000002U98	1	2	Jungle Love
B000002U98	1	3	Take The Money And Run
B000002U98	1	4	Rock 'N Me
B000002U98	1	5	Serenade
B000002U98	1	6	True Fine Love
B000002U98	1	7	The Stake
B000002U98	1	8	The Joker
B000002U98	1	9	Fly Like An Eagle
B000002U98	1	10	Threshold
B000002U98	1	11	Jet Airliner
B000002U98	1	12	Dance, Dance, Dance
B000002U98	1	13	Winter Time
B000002U98	1	14	Wild Mountain Honey
B000002UAO	1	1	Drive My Car
B000002UAO	1	2	Norwegian Wood (This Bird Has Flown)
B000002UAO	1	3	You Won't See Me
B000002UAO	1	4	Nowhere Man
B000002UAO	1	5	Think for Yourself
B000002UAO	1	6	Word
B000002UAO	1	7	Michelle
B000002UAO	1	8	What Goes On
B000002UAO	1	9	Girl
B000002UAO	1	10	I'm Looking Through You
B000002UAO	1	11	In My Life
B000002UAO	1	12	Wait
B000002UAO	1	13	If I Needed Someone
B000002UAO	1	14	Run for Your Life
B000002UAR	1	1	Taxman
B000002UAR	1	2	Eleanor Rigby
B000002UAR	1	3	I'm Only Sleeping
B000002UAR	1	4	Love You To
B000002UAR	1	5	Here, There and Everywhere
B000002UAR	1	6	Yellow Submarine
B000002UAR	1	7	She Said, She Said
B000002UAR	1	8	Good Day Sunshine
B000002UAR	1	9	And Your Bird Can Sing
B000002UAR	1	10	For No One
B000002UAR	1	11	Doctor Robert
B000002UAR	1	12	I Want to Tell You
B000002UAR	1	13	Got to Get You into My Life
B000002UAR	1	14	Tomorrow Never Knows
B000002UAU	1	1	Sgt. Pepper's Lonely Hearts Club Band
B000002UAU	1	2	With a Little Help from My Friends
B000002UAU	1	3	Lucy in the Sky With Diamonds
B000002UAU	1	4	Getting Better
B000002UAU	1	5	Fixing a Hole
B000002UAU	1	6	She's Leaving Home
B000002UAU	1	7	Being for the Benefit of Mr. Kite
B000002UAU	1	8	Within You, Without You
B000002UAU	1	9	When I'm Sixty-Four
B000002UAU	1	10	Lovely Rita
B000002UAU	1	11	Good Morning, Good Morning
B000002UAU	1	12	Sgt. Pepper's Lonely Hearts Club Band (Reprise)
B000002UAU	1	13	Day in the Life
B000002UAX	1	1	Back in the U.S.S.R.
B000002UAX	1	2	Dear Prudence
B000002UAX	1	3	Glass Onion
B000002UAX	1	4	Ob-La-Di, Ob-La-Da
B000002UAX	1	5	Wild Honey Pie
B000002UAX	1	6	Continuing Story of Bungalow Bill
B000002UAX	1	7	While My Guitar Gently Weeps
B000002UAX	1	8	Happiness Is a Warm Gun
B000002UAX	1	9	Martha My Dear
B000002UAX	1	10	I'm So Tired
B000002UAX	1	11	Blackbird
B000002UAX	1	12	Piggies
B000002UAX	1	13	Rocky Raccoon
B000002UAX	1	14	Don't Pass Me By
B000002UAX	1	15	Why Don't We Do It in the Road?
B000002UAX	1	16	I Will
B000002UAX	1	17	Julia
B000002UAX	2	1	Birthday
B000002UAX	2	2	Yer Blues
B000002UAX	2	3	Mother Nature's Son
B000002UAX	2	4	Everybody's Got Something To Hide Except Me And My Monkey
B000002UAX	2	5	Sexy Sadie
B000002UAX	2	6	Helter Skelter
B000002UAX	2	7	Long, Long, Long
B000002UAX	2	8	Revolution 1
B000002UAX	2	9	Honey Pie
B000002UAX	2	10	Savoy Truffle
B000002UAX	2	11	Cry Baby Cry
B000002UAX	2	12	Revolution 9
B000002UAX	2	13	Good Night
B000002UAX	2	14	Long, Long, Long
B000002UAX	2	15	Revolution I
B000002UAX	2	16	Honey Pie
B000002UAX	2	17	Savoy Truffle
B000002UAX	2	18	Cry Baby Cry
B000002UAX	2	19	Colliding Circles
B000002UAX	2	20	Jubilee
B000002UAX	2	21	Child of Nature
B000002UAX	2	22	Sour Milk Sea
B000002UAX	2	23	Hey Jude
B000002UAX	2	24	Vegas Tune
B000002UAX	2	25	I Hate to See the Evening Sun Go Down
B000002UAX	2	26	Not Guilty
B000002UAX	2	27	Everyone Had a Hard Year
B000002UAX	2	28	Heather
B000002UAX	2	29	Case of the Blues
B000002UAX	2	30	Happy Rishkesh Song
B000002UAX	2	31	Oh My Love
B000002UAX	2	32	Good Night
B000002UAX	2	33	[Untitled Track]
B000002UAX	2	34	[Untitled Track]
B000002UAX	2	35	[Untitled Track]
B000002UAX	2	36	[Untitled Track]
B000002UB3	1	1	Come Together
B000002UB3	1	2	Something
B000002UB3	1	3	Maxwell's Silver Hammer
B000002UB3	1	4	Oh! Darling
B000002UB3	1	5	Octopus's Garden
B000002UB3	1	6	I Want You (She's So Heavy)
B000002UB3	1	7	Here Comes the Sun
B000002UB3	1	8	Because
B000002UB3	1	9	You Never Give Me Your Money
B000002UB3	1	10	Sun King
B000002UB3	1	11	Mean Mr. Mustard
B000002UB3	1	12	Polythene Pam
B000002UB3	1	13	She Came in Through the Bathroom Window
B000002UB3	1	14	Golden Slumbers
B000002UB3	1	15	Carry That Weight
B000002UB3	1	16	End
B000002UB3	1	17	Her Majesty
B000002UB6	1	1	Two Of Us
B000002UB6	1	2	Dig A Pony
B000002UB6	1	3	Across The Universe
B000002UB6	1	4	I Me Mine
B000002UB6	1	5	Dig It
B000002UB6	1	6	Let It Be
B000002UB6	1	7	Maggie Mae
B000002UB6	1	8	I've Got A Feeling
B000002UB6	1	9	One After 909
B000002UB6	1	10	Long And Winding Road
B000002UB6	1	11	For You Blue
B000002UB6	1	12	Get Back
B000002UJO	1	1	In It for the Money
B000002UJO	1	2	Richard III
B000002UJO	1	3	Tonight
B000002UJO	1	4	Late in the Day
B000002UJO	1	5	G-Song
B000002UJO	1	6	Sun Hits the Sky
B000002UJO	1	7	Going Out
B000002UJO	1	8	It's Not Me
B000002UJO	1	9	Cheapskate
B000002UJO	1	10	You Can See Me
B000002UJO	1	11	Hollow Little Reign
B000002UJO	1	12	Sometimes I Make You Sad
B000002UJO	2	1	Caught by the Fuzz [Acoustic][*]
B000002UJO	2	2	Sitting up Straight [Limited Edition Only]
B000002UJO	2	3	Melanie Davis [Limited Edition Only]
B000002UJO	2	4	Odd? [Limited Edition Only]
B000002UJO	2	5	Wait for the Sun [Limited Edition Only]
B000002UJO	2	6	Nothing More's Gonna Get in My Way [Limited Edition Only]
B000002UJO	2	7	Sex? [Limited Edition Only]
B000002UJO	2	8	20 Ft. Halo [Limited Edition Only]
B000002UJO	2	9	Je Suis Votre Papa Sucre [Limited Edition Only]
B000002UJQ	1	1	Airbag
B000002UJQ	1	2	Paranoid Android
B000002UJQ	1	3	Subterranean Homesick Alien
B000002UJQ	1	4	Exit Music (For A Film)
B000002UJQ	1	5	Let Down
B000002UJQ	1	6	Karma Police
B000002UJQ	1	7	Fitter Happier
B000002UJQ	1	8	Electioneering
B000002UJQ	1	9	Climbing Up The Walls
B000002UJQ	1	10	No Surprises
B000002UJQ	1	11	Lucky
B000002UJQ	1	12	Tourist, The
B000002ULQ	1	1	Longneck Bottle
B000002ULQ	1	2	How You Ever Gonna Know
B000002ULQ	1	3	She's Gonna Make It
B000002ULQ	1	4	I Don't Have to Wonder
B000002ULQ	1	5	Two Pi..a Coladas - Garth Brooks
B000002ULQ	1	6	Cowboy Cadillac
B000002ULQ	1	7	Fit for a King - Garth Brooks
B000002ULQ	1	8	Do What You Gotta Do
B000002ULQ	1	9	You Move Me - Sam Bacco
B000002ULQ	1	10	In Another's Eyes
B000002ULQ	1	11	When There's No One Around
B000002ULQ	1	12	Friend to Me
B000002ULQ	1	13	Take the Keys to My Heart
B000002ULQ	1	14	Belleau Wood - Sam Bacco
B000002USX	1	1	Overture: A. The Trolley Song, B.Over The Rainbow, C.The Man That Got Away
B000002USX	1	2	When You're Smiling (The Whole World Smiles With You)
B000002USX	1	3	Medley: A. Almost Like Being In Love, B. This Can't Be Love
B000002USX	1	4	Do It Again
B000002USX	1	5	You Go To My Head
B000002USX	1	6	Alone Together
B000002USX	1	7	Who Cares? (So Long As You Care For Me)
B000002USX	1	8	Puttin' On The Ritz
B000002USX	1	9	How Long Has This Been Going On?
B000002USX	1	10	Just You, Just Me
B000002USX	1	11	The Man That Got Away
B000002USX	1	12	San Francisco
B000002USX	1	13	I Can't Give You Anything But Love
B000002USX	2	1	That's Entertainment
B000002USX	2	2	Come Rain Or Come Shine
B000002USX	2	3	You're Nearer
B000002USX	2	4	A Foggy Day
B000002USX	2	5	If Love Were All
B000002USX	2	6	Zing! Went The Strings Of My Heart
B000002USX	2	7	Stormy Weather
B000002USX	2	8	Medley: A. You Made Me Love You, B. For Me And My Gal, C. The Trolley Song
B000002USX	2	9	Rock-A-Bye Your Baby With A Dixie Medley
B000002USX	2	10	Over The Rainbow
B000002USX	2	11	Swanee
B000002USX	2	12	After You've Gone
B000002USX	2	13	Chicago
B000002UWM	1	1	I've Got the World on a String [Take 10]
B000002UWM	1	2	Lean Baby [Take 4]
B000002UWM	1	3	I Love You [Take 7]
B000002UWM	1	4	South of the Border [Take 9]
B000002UWM	1	5	From Here to Eternity [Take 9]
B000002UWM	1	6	They Can't Take That Away from Me [Take 4]
B000002UWM	1	7	I Get a Kick Out of You [Take 12]
B000002UWM	1	8	Young at Heart [Take 12]
B000002UWM	1	9	Three Coins in the Fountain [Take 4]
B000002UWM	1	10	All of Me [Take 16]
B000002UWM	1	11	Taking a Chance on Love [Take 5]
B000002UWM	1	12	Someone to Watch over Me [Take 20]
B000002UWM	1	13	What Is This Thing Called Love? [Take 21]
B000002UWM	1	14	In the Wee Small Hours of the Morning [Take 13]
B000002UWM	1	15	Learnin' the Blues [Take 31]
B000002UWM	1	16	Our Town [From the TV Prodrction our Town][Take]
B000002UWM	1	17	Love and Marriage [From the TV Production our Town][Take]
B000002UWM	1	18	(Love Is) The Tender Trap [From the Film The Tender Trap][Take]
B000002UWM	1	19	Weep They Will [Take 11]
B000002UWM	1	20	I Thought About You [Take 10]
B000002UWM	1	21	You Make Me Feel So Young [Take 12]
B000002UWM	1	22	Memories of You [Take 16]
B000002UWM	1	23	I've Got You Under My Skin [Take 22]
B000002UWM	1	24	Too Marvelous for Words [Take 7]
B000002UWM	1	25	Don't Like Goodbyes [Take 4]
B000002UWM	1	26	(How Little It Matters) How Little We Know [Take 12]
B000002UWM	2	1	Hey! Jealous Lover [Take 6]
B000002UWM	2	2	You're Sensational [Single Version][Take]
B000002UWM	2	3	Close to You [Take 4]
B000002UWM	2	4	Stars Fell on Alabama [Take 7]
B000002UWM	2	5	I Got Plenty O' Nuttin' [Take 21]
B000002UWM	2	6	I Wish I Were in Love Again [Take 9]
B000002UWM	2	7	Lady Is a Tramp [Take 17]
B000002UWM	2	8	Night and Day [Take 5]
B000002UWM	2	9	Lonesome Road [Take 7]
B000002UWM	2	10	If I Had You [Take 10]
B000002UWM	2	11	Where Are You? [Take 12]
B000002UWM	2	12	I'm a Fool to Want You [Take 5]
B000002UWM	2	13	Witchcraft [Take 14]
B000002UWM	2	14	Something Wonderful Happens in Summer [Take 11]
B000002UWM	2	15	All the Way [From the Film The Joker Is Wild][Take]
B000002UWM	2	16	Chicago [From the Film The Joker Is Wild][Take]
B000002UWM	2	17	Let's Get Away from It All [Take 7] - Billy May
B000002UWM	2	18	Autumn in New York [Take 3] - Billy May
B000002UWM	2	19	Come Fly With Me [Take 6] - Billy May
B000002UWM	2	20	Everybody Loves Somebody [Take 4]
B000002UWM	2	21	It's the Same Old Dream [Take 5]
B000002UWM	2	22	Put Your Dreams Away (For Another Day) [Take 4]
B000002UWM	2	23	Here Goes [Take 2][#] - Billy May
B000002UWM	2	24	Angel Eyes [Take 3]
B000002UWM	3	1	Ebb Tide [Take 4]
B000002UWM	3	2	Guess I'll Hang My Tears Out to Dry [Take 4]
B000002UWM	3	3	Only the Lonely [Take 9]
B000002UWM	3	4	One for My Baby (And One More for the Road) [Take 1][Alternate Take][#]
B000002UWM	3	5	To Love and Be Loved [Single Version][Take]
B000002UWM	3	6	I Couldn't Care Less [Take 1][#]
B000002UWM	3	7	Song Is You [Take 6]
B000002UWM	3	8	Just in Time [Take 6] - Billy May
B000002UWM	3	9	Saturday Night (Is the Loneliest Night of the Week) [Take 3] - Billy May
B000002UWM	3	10	Come Dance With Me [Take 10] - Billy May
B000002UWM	3	11	French Foreign Legion [Take 5]
B000002UWM	3	12	One I Love (Belongs to Somebody Else) [Take 5]
B000002UWM	3	13	Here's That Rainy Day [Take 21]
B000002UWM	3	14	High Hopes [From the Film A Hole in the Head][Take]
B000002UWM	3	15	When No One Cares [Take 10]
B000002UWM	3	16	I'll Never Smile Again [Take 8]
B000002UWM	3	17	I've Got a Crush on You [Take 7]
B000002UWM	3	18	Embraceable You [Take 14]
B000002UWM	3	19	Nice and Easy [Tales 11 & 12]
B000002UWM	3	20	I Can't Believe That You're in Love With Me [Take 3]
B000002UWM	3	21	On the Sunny Side of the Street [Take 5] - Billy May
B000002UWM	3	22	I've Heard That Song Before [Take 5]
B000002UWM	3	23	Almost Like Being in Love [Take 5] - Billy May
B000002UWM	3	24	I'll Be Seeing You [Take 7]
B000002UWM	3	25	I Gotta Right to Sing the Blues [Take 3]
B000002VI0	1	1	Sweet Dreams (Are Made of This)
B000002VI0	1	2	When Tomorrow Comes
B000002VI0	1	3	Here Comes the Rain Again
B000002VI0	1	4	Who's That Girl?
B000002VI0	1	5	Would I Lie to You?
B000002VI0	1	6	Sisters Are Doin' It for Themselves
B000002VI0	1	7	There Must Be an Angel (Playing With My Heart)
B000002VI0	1	8	Missionary Man
B000002VI0	1	9	Don't Ask Me Why
B000002VI0	1	10	I Need a Man
B000002VI0	1	11	Love Is a Stranger
B000002VI0	1	12	Thorn in My Side
B000002VI0	1	13	King and Queen of America
B000002VI0	1	14	Angel
B000002VN7	1	1	Possession
B000002VN7	1	2	Wait
B000002VN7	1	3	Plenty
B000002VN7	1	4	Good Enough
B000002VN7	1	5	Mary
B000002VN7	1	6	Elsewhere
B000002VN7	1	7	Circle
B000002VN7	1	8	Ice
B000002VN7	1	9	Hold On
B000002VN7	1	10	Ice Cream
B000002VN7	1	11	Fear
B000002VN7	1	12	Fumbling Towards Ecstasy
B000002VT6	1	1	Building A Mystery
B000002VT6	1	2	I Love You
B000002VT6	1	3	Sweet Surrender
B000002VT6	1	4	Adia
B000002VT6	1	5	Do What You Have To Do
B000002VT6	1	6	Witness
B000002VT6	1	7	Angel
B000002VT6	1	8	Black & White
B000002VT6	1	9	Full Of Grace
B000002VT6	1	10	Last Dance
B000002W6Q	1	1	Gotta Get Up
B000002W6Q	1	2	Driving Along
B000002W6Q	1	3	Early In The Morning
B000002W6Q	1	4	Moonbeam Song
B000002W6Q	1	5	Down
B000002W6Q	1	6	Without You
B000002W6Q	1	7	Coconut
B000002W6Q	1	8	Let the Good Times Roll
B000002W6Q	1	9	Jump Into The Fire
B000002W6Q	1	10	I'll Never Leave You
B000002W6Q	1	11	Without You [#][*][Demo Version]
B000002W6Q	1	12	Driving Along [#][*][Demo Version]
B000002W6Q	1	13	Gotta Get Up [#][*][Demo Version]
B000002W6Q	1	14	Coconut [#][*][Demo Version]
B000002W6Q	1	15	Old Forgotten Soldier [#][*][Demo Version]
B000002W6Q	1	16	Down [#][*][Demo Version]
B000002W6Q	1	17	Moonbeam Song [#][*][Demo Version]
B000002W6Q	1	18	Jump Into The Fire [*]
B000002WC1	1	1	Stardust [#]
B000002WC1	1	2	Washboard Blues - Paul Whiteman Orchestra
B000002WC1	1	3	So Tired [*] - Jean Goldkette & His Orchestra
B000002WC1	1	4	Rockin' Chair [*]
B000002WC1	1	5	March of the Hoodlums
B000002WC1	1	6	Come Easy, Go Easy Love [*] - Sunny Clapp & His Band O' Sunshine
B000002WC1	1	7	Rockin' Chair
B000002WC1	1	8	Georgia on My Mind
B000002WC1	1	9	One Night in Havana [*]
B000002WC1	1	10	Bessie Couldn't Help It [*]
B000002WC1	1	11	Lazy River
B000002WC1	1	12	Sing It Way Down Low
B000002WC1	1	13	Snowball
B000002WC1	1	14	Lazybones
B000002WC1	1	15	One Morning in May
B000002WC1	1	16	Stardust
B000002WC1	1	17	Cosmic
B000002WC1	1	18	Washboard Blues
B000002WC1	1	19	Judy
B000002WC1	1	20	Moon Country
B000002WC1	1	21	Stardust [#]
B000002WD4	1	1	Everybody's Talkin'
B000002WD4	1	2	Sleep Late, My Lady Friend
B000002WD4	1	3	Good Old Desk
B000002WD4	1	4	Don't Leave Me
B000002WD4	1	5	1941
B000002WD4	1	6	Cowboy
B000002WD4	1	7	One
B000002WD4	1	8	Coconut
B000002WD4	1	9	Daybreak [From Son of Dracula]
B000002WD4	1	10	Without You
B000002WD4	1	11	I Guess the Lord Must Be in New York City
B000002WD4	1	12	Caroline
B000002WD4	1	13	Daddy's Song
B000002WD4	1	14	Jump into the Fire
B000002WD4	1	15	Without Her
B000002WD4	1	16	Me and My Arrow
B000002WD4	1	17	Nobody Cares About the Railroads Anymore
B000002WD4	1	18	Spaceman
B000002WD4	1	19	As Time Goes By
B000002WD4	1	20	Remember
B000002WFX	1	1	Heartbreak Hotel
B000002WFX	1	2	I Want You, I Need You, I Love You
B000002WFX	1	3	Hound Dog
B000002WFX	1	4	Don't Be Cruel
B000002WFX	1	5	Love Me Tender
B000002WFX	1	6	Love Me
B000002WFX	1	7	Too Much
B000002WFX	1	8	All Shook Up
B000002WFX	1	9	(Let Me Be Your) Teddy Bear
B000002WFX	1	10	Jailouse Rock
B000002WFX	1	11	Don't
B000002WFX	1	12	I Beg Of You
B000002WFX	1	13	Wear My Ring Around Your Neck
B000002WFX	1	14	Hard Headed Woman
B000002WFX	1	15	One Night
B000002WFX	1	16	I Got Stung
B000002WFX	1	17	(Now And Then There's) A Fool Such As I
B000002WFX	1	18	I Need Your Love Tonight
B000002WFX	1	19	A Big Hunk O' Love
B000002WFX	2	1	Stuck On You
B000002WFX	2	2	It's Now Or Never
B000002WFX	2	3	Are You Lonesome Tonight?
B000002WFX	2	4	Surrender
B000002WFX	2	5	I Feel So Bad
B000002WFX	2	6	Little Sister
B000002WFX	2	7	(Marie's The Name Of) His Latest Flame
B000002WFX	2	8	Can't Help Falling In Love With You
B000002WFX	2	9	Good Luck Charm
B000002WFX	2	10	She's Not You
B000002WFX	2	11	Return To Sender
B000002WFX	2	12	(You're The) Devil In Disguise
B000002WFX	2	13	Bossa Nova Baby
B000002WFX	2	14	Crying In The Chapel
B000002WFX	2	15	In The Ghetto
B000002WFX	2	16	Suspicious Minds
B000002WFX	2	17	Don't Cry Daddy
B000002WFX	2	18	Wonder Of You, The
B000002WFX	2	19	Burning Love
B000002WFY	1	1	Heartbreak Hotel
B000002WFY	1	2	I Was The One
B000002WFY	1	3	I Want You,I Need You,I Love You
B000002WFY	1	4	Hound Dog
B000002WFY	1	5	Don't Be Cruel
B000002WFY	1	6	Any Way You Want Me
B000002WFY	1	7	Love Me Tender
B000002WFY	1	8	Playing For Keeps
B000002WFY	1	9	Too Much
B000002WFY	1	10	All Shook Up
B000002WFY	1	11	That's When Your Heartaches Begin
B000002WFY	1	12	I Beg Of You
B000002WFY	1	13	Loving You
B000002WFY	1	14	(Let Me Be Your) Teddy Bear
B000002WFY	1	15	Jailhouse Rock
B000002WFY	1	16	Treat Me Nice
B000002WFY	1	17	Don't
B000002WFY	1	18	Hard Headed Woman
B000002WFY	1	19	Wear My Ring Around Your Neck
B000002WFY	1	20	A Big Hunk O'Love
B000002WFY	1	21	Ain't That Loving You Baby
B000002WFY	1	22	(Now And Then There's) A Fool Such As I
B000002WFY	1	23	I Got Stung
B000002WFY	1	24	"Interviews (from ""Elvis Sails"")"
B000002WFY	1	25	Crying In The Chapel
B000002WFY	1	26	Viva Las Vegas
B000002WFY	1	27	Stuck on You
B000002WFY	1	28	Mess of Blues
B000002WFY	1	29	It's Now or Never
B000002WFY	1	30	Are You Lonesome Tonight?
B000002WFY	1	31	I Feel So Bad
B000002WFY	1	32	Can't Help Falling in Love
B000002WFY	1	33	Anything That's Part of You
B000002WFY	1	34	She's Not You
B000002WFY	1	35	Return to Sender
B000002WFY	1	36	Bossa Nova Baby
B000002WFY	1	37	Kissin' Cousins
B000002WFY	1	38	Don't Cry Daddy
B000002WFY	1	39	Kentucky Rain
B000002WQS	1	1	Best of What's Around
B000002WQS	1	2	What Would You Say
B000002WQS	1	3	Satellite
B000002WQS	1	4	Rhyme & Reason
B000002WQS	1	5	Typical Situation
B000002WQS	1	6	Dancing Nancies
B000002WQS	1	7	Ants Marching
B000002WQS	1	8	Lover Lay Down
B000002WQS	1	9	Jimi Thing
B000002WQS	1	10	Warehouse
B000002WQS	1	11	Pay for What You Get
B000002WQS	1	12	[Silence]
B000002WQS	1	13	[Silence]
B000002WQS	1	14	[Silence]
B000002WQS	1	15	[Silence]
B000002WQS	1	16	[Silence]
B000002WQS	1	17	[Silence]
B000002WQS	1	18	[Silence]
B000002WQS	1	19	[Silence]
B000002WQS	1	20	[Silence]
B000002WQS	1	21	[Silence]
B000002WQS	1	22	[Silence]
B000002WQS	1	23	[Silence]
B000002WQS	1	24	[Silence]
B000002WQS	1	25	[Silence]
B000002WQS	1	26	[Silence]
B000002WQS	1	27	[Silence]
B000002WQS	1	28	[Silence]
B000002WQS	1	29	[Silence]
B000002WQS	1	30	[Silence]
B000002WQS	1	31	[Silence]
B000002WQS	1	32	[Silence]
B000002WQS	1	33	[Silence]
B000002WQS	1	34	#34
B000002WYT	1	1	So Much To Say
B000002WYT	1	2	Two Step
B000002WYT	1	3	Crash In To Me
B000002WYT	1	4	Too Much
B000002WYT	1	5	#41
B000002WYT	1	6	Say Goodbye
B000002WYT	1	7	Drive In Drive Out
B000002WYT	1	8	Let You Down
B000002WYT	1	9	Lie In Our Graves
B000002WYT	1	10	Cry Freedom
B000002WYT	1	11	Tripping Billies
B000002WYT	1	12	Proudest Monkey
B000002ZDA	1	1	Kentucky Means Paradise
B000002ZDA	1	2	Gentle On My Mind
B000002ZDA	1	3	Burning Bridges
B000002ZDA	1	4	By The Time I Get To Phoenix
B000002ZDA	1	5	I Wanna Live
B000002ZDA	1	6	Dreams Of The Everday Housewife
B000002ZDA	1	7	Wichita Lineman
B000002ZDA	1	8	Let It Be Me
B000002ZDA	1	9	Galveston
B000002ZDA	1	10	Where's The Playground Susie
B000002ZDA	1	11	True Grit
B000002ZDA	1	12	Try A Little Kindness
B000002ZDA	1	13	Honey, Come Back
B000002ZDA	1	14	All I Have To Do Is Dream
B000002ZDA	1	15	Oh Happy Day
B000002ZDA	1	16	Everything A Man Could Ever Need
B000002ZDA	1	17	It's Only Make Believe
B000002ZDA	1	18	Dream Baby (How Long Must I Dream)
B000002ZDA	1	19	The Last Time I Saw Her
B000002ZDA	1	20	The William Tell Overture
B000002ZDA	2	1	Bonaparte's Retreat
B000002ZDA	2	2	I Knew Jesus (Before He Was A Star)
B000002ZDA	2	3	Houston (I'm Comin' To See You)
B000002ZDA	2	4	Manhattan Kansas
B000002ZDA	2	5	Rhinestone Cowboy
B000002ZDA	2	6	Country Boy (You Got Your Feet In L. A.)
B000002ZDA	2	7	Don't Pull Your Love / Then You Can Tell Me Goodbye
B000002ZDA	2	8	See You On Sunday
B000002ZDA	2	9	Southern Nights
B000002ZDA	2	10	Sunflower
B000002ZDA	2	11	Can You Fool
B000002ZDA	2	12	Any Which Way You Can
B000002ZDA	2	13	I'm Gonna Love You
B000002ZDA	2	14	Bloodline
B000002ZDA	2	15	Faithless Love
B000002ZDA	2	16	A Lady Like You
B000002ZDA	2	17	The Hand That Rocks The Cradle
B000002ZDA	2	18	Still Within The Sound Of My Voice
B000002ZDA	2	19	I Have You
B000002ZDA	2	20	She's Gone , Gone, Gone
B0000032AP	1	1	You Really Got Me
B0000032AP	1	2	All Day and All of the Night
B0000032AP	1	3	Set Me Free
B0000032AP	1	4	Who'll Be the Next in Line
B0000032AP	1	5	Come on Now
B0000032AP	1	6	Everybody's Gonna Be Happy
B0000032AP	1	7	I Need You
B0000032AP	1	8	Till the End of the Day
B0000032AP	1	9	Tired of Waiting for You
B0000032AP	1	10	Well Respected Man
B0000032AP	1	11	You Do Something to Me
B0000032AP	1	12	You Still Want Me
B0000032AP	1	13	Stop Your Sobbing
B0000032AP	1	14	Something Better Beginning
B0000032AP	1	15	Dedicated Follower of Fashion
B0000032AP	1	16	I'm Not Like Everybody Else
B0000032AP	1	17	Where Have All the Good Times Gone?
B0000032AP	1	18	Sunny Afternoon
B0000032WJ	1	1	Don't Make Me Over
B0000032WJ	1	2	This Empty Place
B0000032WJ	1	3	Anyone Who Had a Heart
B0000032WJ	1	4	Walk on By
B0000032WJ	1	5	You'll Never Get to Heaven (If You Break My Heart)
B0000032WJ	1	6	House Is Not a Home
B0000032WJ	1	7	Reach Out for Me
B0000032WJ	1	8	Who Can I Turn To (When Nobody Needs Me)
B0000032WJ	1	9	Looking With My Eyes
B0000032WJ	1	10	Are You There (With Another Girl)
B0000032WJ	1	11	Message to Michael
B0000032WJ	1	12	Trains and Boats and Planes
B0000032WJ	1	13	I Just Don't Know What to Do With Myself
B0000032WJ	1	14	Another Night
B0000032WJ	1	15	Alfie
B0000032WJ	1	16	Windows of the World
B0000032WJ	1	17	I Say a Little Prayer
B0000032WJ	1	18	(Theme from) Valley of the Dolls
B0000032WJ	1	19	Do You Know the Way to San Jose?
B000007OWW	1	20	Letter To Lucille
B0000032WJ	1	20	(There's) Always Something There to Remind Me
B0000032WJ	1	21	Promises, Promises
B0000032WJ	1	22	April Fools
B0000032WJ	1	23	I'll Never Fall in Love Again
B0000032WJ	1	24	Green Grass Starts to Grow
B0000032WL	1	1	I Saw The Light
B0000032WL	1	2	It Wouldn't Have Made Any Difference
B0000032WL	1	3	Wolfman Jack
B0000032WL	1	4	Cold Morning Light
B0000032WL	1	5	It Takes Two To Tango (This Is For The Girls)
B0000032WL	1	6	Sweeter Memories
B0000032WL	1	7	Intro
B0000032WL	1	8	Breathless
B0000032WL	1	9	The Night The Carousel Burnt Down
B0000032WL	1	10	Saving Grace
B0000032WL	1	11	Marlene
B0000032WL	1	12	Song Of The Viking
B0000032WL	1	13	I Went To The Mirror
B0000032WL	2	1	Black Maria
B0000032WL	2	2	One More Day (No Word)
B0000032WL	2	3	Couldn't I Just Tell You
B0000032WL	2	4	Torch Song
B0000032WL	2	5	Little Red Lights
B0000032WL	2	6	Overture-My Roots: Money (That's What I Want)/Messin' With The Kid
B0000032WL	2	7	Dust In The Wind
B0000032WL	2	8	Piss Aaron
B0000032WL	2	9	Hello It's Me
B0000032WL	2	10	Some Folks Is Even Whiter Than Me
B0000032WL	2	11	You Left Me Sore
B0000032WL	2	12	Slut
B00000334M	1	1	Ooby Dooby
B00000334M	1	2	Rock House
B00000334M	1	3	Uptown
B00000334M	1	4	Only the Lonely
B00000334M	1	5	Blue Angel
B00000334M	1	6	I'm Hurtin'
B00000334M	1	7	Running Scared
B00000334M	1	8	Crying
B00000334M	1	9	Candy Man
B00000334M	1	10	Dream Baby (How Long Must I Dream)
B00000334M	1	11	Leah
B00000334M	1	12	Workin' for the Man
B00000334M	1	13	In Dreams
B00000334M	1	14	Mean Woman Blues
B00000334M	1	15	Blue Bayou
B00000334M	1	16	Pretty Paper
B00000334M	1	17	It's Over
B00000334M	1	18	Oh, Pretty Woman
B00000337M	1	1	Where Or When
B00000337M	1	2	A Stranger In Town
B00000337M	1	3	Day By Day
B00000337M	1	4	Willow Road
B00000337M	1	5	Born To Be Blue
B00000337M	1	6	What Is This Thing Called Love - mel Torme
B00000337M	1	7	Get Out Of Town
B00000337M	1	8	For You, For Me, Forevermore
B00000337M	1	9	It's Dreamtime
B00000337M	1	10	Gone With The Wind
B00000337M	1	11	A Cottage For Sale
B00000337M	1	12	Makin' Whoopee
B00000337M	1	13	Night And Day
B00000337M	1	14	County Fair
B00000337M	1	15	Three Little Words
B00000337M	1	16	Love Or Leave Me
B00000337M	1	17	How High The Moon
B00000337M	1	18	Careless Hands
B00000337M	1	19	Blue Moon
B00000337M	1	20	Again
B00000337M	1	21	The Four Winds And The Seven Seas
B00000337M	1	22	Got The Gate On The Golden Gate
B00000337M	1	23	Cross Your Heart
B00000337M	1	24	Betwitched
B00000337M	1	25	It Don't Mean A Thing If It Ain't Got That Swing
B00000337M	1	26	All Of You
B00000337M	2	1	That Old Black Magic
B00000337M	2	2	Mountain Greenery
B00000337M	2	3	Bernie's Tune
B00000337M	2	4	Goody, Goody
B00000337M	2	5	I Got It Bad And That Ain't Good
B00000337M	2	6	All This And Heaven Too
B00000337M	2	7	Isn't It Romantic
B00000337M	2	8	Lulu's Back In Town
B00000337M	2	9	The Blues
B00000337M	2	10	Lullaby In Birdland
B00000337M	2	11	The Carioca
B00000337M	2	12	Facinating Rhythm
B00000337M	2	13	The Lady Is A Tramp
B00000337M	2	14	If Got Plenty Of Nuthin'
B00000337M	2	15	Nice Work If You Can Get It
B00000337M	2	16	The Way You Look Tonight
B00000337M	2	17	A Foggy Day
B00000337M	2	18	Something's Gotta Give
B00000337M	2	19	Cheek To Cheek
B00000337M	2	20	Just One Of Those Things
B00000337M	2	21	I'm Beginning To See The Light
B00000337M	2	22	It's All Right With Me
B00000337M	2	23	Autum Leaves
B00000337M	2	24	Poor Little Extra Girl
B00000337M	3	1	A Nightingale Sang In Berkely Square
B00000337M	3	2	These Foolish Things
B00000337M	3	3	Try A Little Tenderness
B00000337M	3	4	Prelude To A Kiss
B00000337M	3	5	I Let A Song Go Out Of My Heart
B00000337M	3	6	Blues In The Night
B00000337M	3	7	Vaya Con Dios
B00000337M	3	8	Frenesi
B00000337M	3	9	At The Crossroads (Malaguena)
B00000337M	3	10	It Happened In Montery
B00000337M	3	11	Too Close For Comfort
B00000337M	3	12	Swingin' On The Moon
B00000337M	3	13	Medley: Far Away From Home/Angelina
B00000337M	3	14	I'm Gonna Move To The Outskirts Of Town
B00000337M	3	15	Sent For You Yesterday (And Here You Come Today)
B00000337M	3	16	By Myself
B00000337M	3	17	(Ah, The Apple Trees) When The World Was Young
B00000337M	3	18	It's Delovely
B00000337M	3	19	Dat Dere
B00000337M	3	20	On Green Dolphin Street
B00000337M	3	21	Walkin' Shoes
B00000337M	4	1	Comin' Home Baby
B00000337M	4	2	Right Now
B00000337M	4	3	Cast Your Fate To The Wind
B00000337M	4	4	Hey, Look Me Over!
B00000337M	4	5	Forty Second Street
B00000337M	4	6	Sunday In New York
B00000337M	4	7	You'd Better Love Me
B00000337M	4	8	I've Got You Under My Skin
B00000337M	4	9	The Folks That Live On The Hill
B00000337M	4	10	Haven't We Met
B00000337M	4	11	Stranger In The Night
B00000337M	4	12	A Day In The Life Of Bonnie And Clyde
B00000337M	4	13	Yesterday When I Was Young
B00000337M	4	14	What Are You Doing The Rest Of Your Life
B00000337M	4	15	Gershwin Medley: I Got Rhythm/Mine/Do-Do-Do/'S Won
B00000337M	4	16	Pick Yourself Up
B00000337M	4	17	The Best Is Yet To Come
B00000337M	4	18	Zaz Turned Blue
B00000337M	4	19	Big City Blues
B00000337M	4	20	Theme From Arthur (Best That You Can Do)
B00000337M	4	21	The Chritmas Song
B000003G8E	1	1	20th Century Fox Fanfare
B000003G8E	1	2	Main Title/Rebel Blockade Runner
B000003G8E	1	3	Imperial Attack
B000003G8E	1	4	The Dune Sea Of Tatooine/Jawa Sandcrawler
B000003G8E	1	5	The Moisture Farm
B000003G8E	1	6	The Hologram/Binary Sunset
B000003G8E	1	7	Landspeeder Search/Attack Of The Sand People
B000003G8E	1	8	Tales Of A Jedi Knight/Learn About The Force
B000003G8E	1	9	Burning Homestead
B000003G8E	1	10	Mos Eisley Spaceport
B000003G8E	1	11	Cantina Band
B000003G8E	1	12	Cantina Band #2
B000003G8E	1	13	Binary Sunset (Alternate)
B000003G8E	2	1	Princess Leia's Theme
B000003G8E	2	2	The Millennium Falcon/Imperial Cruiser Pursuit
B000003G8E	2	3	Destruction Of Alderaan
B000003G8E	2	4	The Death Star/The Stormtroopers
B000003G8E	2	5	Wookiee Prisoner/Detention Block Ambush
B000003G8E	2	6	Shootout In The Cell Bay/Dianoga
B000003G8E	2	7	The Trash Compactor
B000003G8E	2	8	The Tractor Beam/Chasm Crossfire
B000003G8E	2	9	Ben Kenobi's Death/Tie Figther Attack
B000003G8E	2	10	The Battle Of Yavin (Launch From The Fourth Moon/X-Wings Draw Fire/Use The Force)
B000003G8E	2	11	The Throne Room/End Title
B000003TA4	1	1	Smells Like Teen Spirit
B000003TA4	1	2	In Bloom
B000003TA4	1	3	Come As You Are
B000003TA4	1	4	Breed
B000003TA4	1	5	Lithium
B000003TA4	1	6	Polly
B000003TA4	1	7	Territorial Pissings
B000003TA4	1	8	Drain You
B000003TA4	1	9	Lounge Act
B000003TA4	1	10	Stay Away
B000003TA4	1	11	On A Plain
B000003TA4	1	12	Something In The Way
B000003TAP	1	1	Round Here
B000003TAP	1	2	Omaha
B000003TAP	1	3	Mr. Jones
B000003TAP	1	4	Perfect Blue Buildings
B000003TAP	1	5	Anna Begins
B000003TAP	1	6	Time and Time Again
B000003TAP	1	7	Rain King
B000003TAP	1	8	Sullivan Street
B000003TAP	1	9	Ghost Train
B000003TAP	1	10	Raining In Baltimore
B000003TAP	1	11	A Murder Of One
B0000041XX	1	1	Il lamento di Federico (E' la solita storia) - Jose Carreras
B0000041XX	1	2	O paradis - Placido Domingo
B0000041XX	1	3	Recondita armonia - Luciano Pavarotti
B0000041XX	1	4	Dein ist mein ganzes Herz - Placido Domingo
B0000041XX	1	5	Rondine al nido - Luciano Pavarotti
B0000041XX	1	6	Core 'ngrato - Jose Carreras
B0000041XX	1	7	Torna a Surriento - Luciano Pavarotti
B0000041XX	1	8	Granada - Jose Carreras
B0000041XX	1	9	No puede ser - Placido Domingo
B0000041XX	1	10	L'improvviso - Jose Carreras
B0000041XX	1	11	E lucevan le stelle - Placido Domingo
B0000041XX	1	12	Nessun dorma - Luciano Pavarotti
B0000041XX	1	13	Maria/Tonight/'O paese d' 'o sole/Cielito lindo - Placido Domingo/Luciano Pavarotti/Jose Carreras
B0000041XX	1	14	Memory/Ochi tchorniye/Caminito/La Vie en rose - Placido Domingo/Luciano Pavarotti/Jose Carreras
B0000041XX	1	15	Mattinata/Wien, Wien nur du allein/Amapola/'O sole mio - Placido Domingo/Luciano Pavarotti/Jose Carreras
B0000041XX	1	16	Encore: 'O sole mio - Placido Domingo/Luciano Pavarotti/Jose Carreras
B0000041XX	1	17	Encore: Nessun dorma - Placido Domingo/Luciano Pavarotti/Jose Carreras
B0000042H4	1	1	Das Rheingold: Scene 1: Vorspiel. Prelude - Wiener Phil/Solti
B0000042H4	1	2	Das Rheingold: Scene 1: Weia! Waga! Woge, du Welle! - Balsborg
B0000042H4	1	3	Das Rheingold: Scene 1: Garstig glatter glitschriger Glimmer! - Neidlinger
B0000042H4	1	4	Das Rheingold: Scene 1: Wallala! Lalaleia! - Balsborg/Plumacher/Malaniuk
B0000042H4	1	5	Das Rheingold: Scene 1: Lugt, Schwestern! - Balsborg
B0000042H4	1	6	Das Rheingold: Scene 1: Der Welt Erbe gewann' ich zu eigen durch dich? - Neidlinger
B0000042H4	1	7	Das Rheingold: Scene 2: Wotan! Gemah! Erwache! - Flagstad
B0000042H4	1	8	Das Rheingold: Scene 2: Sanft schlo.. Schlaf dein Aug' - Kreppel
B0000042H4	1	9	Das Rheingold: Scene 2: Zu mir, Freia! Meide sie, Frecher! - Kmentt
B0000042H4	1	10	Das Rheingold: Scene 2: Endlich Loge! - London
B0000042H4	1	11	Das Rheingold: Scene 2: Immer ist Undank Loges Lohn! - Svanholm
B0000042H4	1	12	Das Rheingold: Scene 2: Ein Runenzauber zwingt das Gold zum Reif - Svanholm
B0000042H4	1	13	Das Rheingold: Scene 2: Hor, Wotan, der Harrenden Wort! - Bohme
B0000042H4	1	14	Das Rheingold: Scene 2: Was sinnt nin Wotan so wild? - Svanholm
B0000042H4	1	15	Das Rheingold: Scene 2: Auf, Loge, hinab mit mir! Hehe! hehe! hieher! (Scene 3) - London/Neidlinger
B0000042H4	2	1	Das Rheingold: Scene 3: Schau, du Schelm! - Neidlinger
B0000042H4	2	2	Das Rheingold: Scene 3: Nibelheim hier: durch bleiche Nebel was blitzen dort - Svanholm
B0000042H4	2	3	Das Rheingold: Scene 3: Nehmt euch in acht! Alberich naht-Sein harren wir hier - Kuen/London
B0000042H4	2	4	Das Rheingold: Scene 3: Vergeh, frevelnder Gauch!-Was sagt der?-Sei doch bei Sinnen! - London/Neidlinger/Svanholm
B0000042H4	2	5	Das Rheingold: Scene 3: Ohe! Hahaha! Ohe! Hahaha! Schreckliche Schlange - Svanholm/London
B0000042H4	2	6	Das Rheingold: Scene 4: Da, Vetter, sitze du fest! - Svanholm
B0000042H4	2	7	Das Rheingold: Scene 4: Gezahlt hab' ich; nun la..t mich zieh'n! - Neidlinger
B0000042H4	2	8	Das Rheingold: Scene 4: Bin ich nun frei? Wirklich frei? - Neidlinger
B0000042H4	2	9	Das Rheingold: Scene 4: Fasolt und Fafner nahen von fern - Svanholm
B0000042H4	2	10	Das Rheingold: Scene 4: Gepflanzt sind die Pfahle - Bohme
B0000042H4	2	11	Das Rheingold: Scene 4: Weiche, Wotan, weiche! - Madeira
B0000042H4	2	12	Das Rheingold: Scene 4: Hort, ihr Riesen! Zuruck, und harret!... Halt, du Gieriger! - Wachter/Kreppel
B0000042H4	2	13	Das Rheingold: Scene 4: Schwules Gedunst...Zur Burg fuhrt die Brucke - Wachter/Kmentt
B0000042H4	2	14	Das Rheingold: Scene 4: Abendlich strahlt der Sonne Auge - London
B0000042H4	2	15	Das Rheingold: Scene 4: Rheingold! Rheingold! Reines Gold! Wie lauter und hell - Balsborg/Plumacher/Malaniuk
B0000042H4	3	1	Die Walkure: Act I: Vorspiel. Prelude - Wiener Phil/Solti
B0000042H4	3	2	Die Walkure: Act I: Scene 1: Wes Herd dies auch sei - King
B0000042H4	3	3	Die Walkure: Act I: Scene 1: Kuhlende Labung gab mir der Quell! - King
B0000042H4	3	4	Die Walkure: Act I: Scene 2: Mud am Herd fand ich den Mann - Crespin
B0000042H4	3	5	Die Walkure: Act I: Scene 2: Friedmund darf ich nicht hei..en - King
B0000042H4	3	6	Die Walkure: Act I: Scene 2: Aus dem Wald trieb es mich fort - King
B0000042H4	3	7	Die Walkure: Act I: Scene 2: Ich wei.. ein wildes Geschlecht - Frick
B0000042H4	3	8	Die Walkure: Act I: Scene 3: Ein Schwert verhie.. mir der Vater - King
B0000042H4	3	9	Die Walkure: Act I: Scene 3: Schlafst du, Gast? - Crespin
B0000042H4	3	10	Die Walkure: Act I: Scene 3: Wintersturme wichen dem Wonnemond - King
B0000042H4	3	11	Die Walkure: Act I: Scene 3: Du bist der Lenz, nach dem ich verlangte - Crespin
B0000042H4	3	12	Die Walkure: Act I: Scene 3: Wehwalt hei..t du furwahr?-Siegmund hei.. ich - King/Crespin
B0000042H4	4	1	Die Walkure: Act II: Vorspiel. Prelude - Wiener Phil/Solti
B0000042H4	4	2	Die Walkure: Act II: Scene 1: Nun zaume dein Ro.., reisige Maid - Hotter
B0000042H4	4	3	Die Walkure: Act II: Scene 1: Der alte Sturm, die alte Muh! - Hotter
B0000042H4	4	4	Die Walkure: Act II: Scene 1: So ist es denn aus mit den ewigen Gottern - Ludwig
B0000042H4	4	5	Die Walkure: Act II: Scene 1: Nichts lerntest du - Hotter
B0000042H4	4	6	Die Walkure: Act II: Scene 1: Was verlangst du? - Hotter
B0000042H4	4	7	Die Walkure: Act II: Scene 2: Schlimm, furcht ich, schlo.. der Streit - Nilsson
B0000042H4	4	8	Die Walkure: Act II: Scene 2: Was keinem in Worten ich kunde - Hotter
B0000042H4	4	9	Die Walkure: Act II: Scene 2: Ein andres ist's: achte es wohl - Hotter
B0000042H4	4	10	Die Walkure: Act II: Scene 2: O sag, kunde, was soll nun dein Kind? - Nilsson
B0000042H4	4	11	Die Walkure: Act II: Scene 2: Raste nun hier; gonne dir Ruh! - King
B0000042H4	4	12	Die Walkure: Act II: Scene 2: Hinweg! Hinweg! Flieh die Entweihte! - Crespin
B0000042H4	5	1	Die Walkure: Act III: Scene 1: Vorspiel-Hojotoho! Hojotoho! Heiaha! Heiaha! - Schlosser
B0000042H4	5	2	Die Walkure: Act III: Scene 1: Schutzt mich und helft in hochster Not! - Nilsson
B0000042H4	5	3	Die Walkure: Act III: Scene 1: Nicht sehre dich Sorge um mich - Crespin
B0000042H4	5	4	Die Walkure: Act III: Scene 1: Steh, Brunnhild! - Hotter
B0000042H4	5	5	Die Walkure: Act III: Scene 2: Wo ist Brunnhild', wo die Verbrecherin? - Hotter
B0000042H4	5	6	Die Walkure: Act III: Scene 2: Hier bin ich Vater: gebiete die Strafe! - Nilsson
B0000042H4	5	7	Die Walkure: Act III: Scene 2: Wehe! Weh! Schwester, ach Schwester! - Fassbaender
B0000042H4	5	8	Die Walkure: Act III: Scene 3: War es so schmahlich, was ich verbrach - Nilsson
B0000042H4	5	9	Die Walkure: Act III: Scene 3: Nicht weise bin ich, doch wu..t' ich das eine - Nilsson
B0000042H4	5	10	Die Walkure: Act III: Scene 3: So tatest du, was so gern zu tun ich begehrt - Hotter
B0000042H4	5	11	Die Walkure: Act III: Scene 3: Du zeugtest ein edles Geschlecht - Nilsson
B0000042H4	5	12	Die Walkure: Act III: Scene 3: Leb wohl, du kuhnes, herrliches Kind! - Notter
B0000042H4	5	13	Die Walkure: Act III: Scene 3: Denn einer nur freie die Braut - Hotter
B0000042H4	5	14	Die Walkure: Act III: Scene 3: Loge, hor! Lausche hierher! - Hotter
B0000042H4	6	1	Siegfried: Act I: Vorspiel - Wiener Phil/Solti
B0000042H4	6	2	Siegfried: Act I: Scene 1: Zwangvolle Plage! Muh ohne Zweck! - Stolze
B0000042H4	6	3	Siegfried: Act I: Scene 1: Hoiho! Hoiho! Hau ein! Hau ein! - Windgassen
B0000042H4	6	4	Siegfried: Act I: Scene 1: Da hast du die Stucken, schandlicher Stumper - Windgassen
B0000042H4	6	5	Siegfried: Act I: Scene 1: Als zullendes Kind zog ich dich auf - Stolze
B0000042H4	6	6	Siegfried: Act I: Scene 1: Vieles lehrtest du, Mime - Windgassen
B0000042H4	6	7	Siegfried: Act I: Scene 1: Einst lag wimmernd ein Weib - Stolze
B0000042H4	6	8	Siegfried: Act I: Scene 1: Und diese Stucken sollst du mir schmieden - Windgassen
B0000042H4	6	9	Siegfried: Act I: Scene 1: Da sturmt er hin! - Stolze
B0000042H4	6	10	Siegfried: Act I: Scene 2: Heil dir, weiser Schmied! - Hotter
B0000042H4	6	11	Siegfried: Act I: Scene 2: Hier sitz' ich am Herd und setze mein Haupt - Hotter
B0000042H4	6	12	Siegfried: Act I: Scene 2: Was zu wissen dir frommt, solltest du fragen - Hotter
B0000042H4	6	13	Siegfried: Act I: Scene 2: Die Stucken! Das Schwert! O weh! Mir schwindelt! - Stolze
B0000042H4	6	14	Siegfried: Act I: Scene 3: Verfluchtes Licht! - Stolze
B0000042H4	6	15	Siegfried: Act I: Scene 3: Heda! Du Fauler! - Windgassen
B0000042H4	7	1	Siegfried: Act I: Scene 3: Bist du es, Kind? - Stolze
B0000042H4	7	2	Siegfried: Act I: Scene 3: Fuhltest du nie im finstren Wald - Stolze
B0000042H4	7	3	Siegfried: Act I: Scene 3: Her mit den Stucken, fort mit dem Stumper! - Windgassen
B0000042H4	7	4	Siegfried: Act I: Scene 3: Notung! Notung! Neidliches Schwert! - Windgassen
B0000042H4	7	5	Siegfried: Act I: Scene 3: Hoho! Hoho! Hahei! - Windgassen
B0000042H4	7	6	Siegfried: Act II: Vorspiel - Wiener Phil/Solti
B0000042H4	7	7	Siegfried: Act II: Scene 1: In Wald und Nacht - Neidlinger
B0000042H4	7	8	Siegfried: Act II: Scene 1: Zur Neidhohle fuhr ich bei Nacht - Hotter
B0000042H4	7	9	Siegfried: Act II: Scene 1: Mit mir nicht, hadre mit Mime - Hotter
B0000042H4	7	10	Siegfried: Act II: Scene 1: Fafner! Fafner! Erwache, Wurm! - Hotter
B0000042H4	7	11	Siegfried: Act II: Scene 1: Nun, Alberich, das schlug fehl - Hotter
B0000042H4	7	12	Siegfried: Act II: Scene 2: Wir sind zur Stelle! - Stolze
B0000042H4	7	13	Siegfried: Act II: Scene 2: Da.. der mein Vater nicht ist - Windgassen
B0000042H4	8	1	Siegfried: Act II: Scene 2: Aber wie sah meine Mutter wohl aus? - Windgassen
B0000042H4	8	2	Siegfried: Act II: Scene 2: Meine Mutter, ein Menschenweib! - Windgassen
B0000042H4	8	3	Siegfried: Act II: Scene 2: Haha! Da hatte mein Lied - Windgassen
B0000042H4	8	4	Siegfried: Act II: Scene 2: Wer bist du, kuhner Knabe, der das Herz mir traf? - Bohme
B0000042H4	8	5	Siegfried: Act II: Scene 2: Zur Kunde taugt kein Toter - Windgassen
B0000042H4	8	6	Siegfried: Act II: Scene 3: Wohin schleichst du eilig und schlau - Neidlinger
B0000042H4	8	7	Siegfried: Act II: Scene 3: Was ihr mir nutzt, wei.. ich nicht - Windgassen
B0000042H4	8	8	Siegfried: Act II: Scene 3: Willkommen, Siegfried! - Stolze
B0000042H4	8	9	Siegfried: Act II: Scene 3: Da lieg auch du, dunkler Wurm! - Windgassen
B0000042H4	8	10	Siegfried: Act III: Vorspiel - Wiener Phil/Solti
B0000042H4	8	11	Siegfried: Act III: Scene 1: Wache, Wala! Wala! Erwach! - Hotter
B0000042H4	8	12	Siegfried: Act III: Scene 1: Stark ruft das Lied - Hoffgen
B0000042H4	9	1	Siegfried: Act III: Scene 1: Dir Unweisen ruf' ich ins Ohr - Hotter
B0000042H4	9	2	Siegfried: Act III: Scene 2: Mein Voglein schwebte mir fort! - Windgassen
B0000042H4	9	3	Siegfried: Act III: Scene 2: Wohin, Knabe, hei..t dich dein Weg? - Hotter
B0000042H4	9	4	Siegfried: Act III: Scene 2: Kenntest du mich, kuhner spro.. - Hotter
B0000042H4	9	5	Siegfried: Act III: Scene 2: Mit zerfochtner Waffe wich mir der Feige? - Windgassen
B0000042H4	9	6	Siegfried: Act III: Scene 3: Selige Ode auf sonniger Hoh! - Windgassen
B0000042H4	9	7	Siegfried: Act III: Scene 3: Das ist kein Mann! - Windgassen
B0000042H4	9	8	Siegfried: Act III: Scene 3: Heil dir, Sonne! Heil dir, Licht! - Nilsson
B0000042H4	9	9	Siegfried: Act III: Scene 3: O Siegfried! Siegfried! Seliger Held! - Nilsson
B0000042H4	9	10	Siegfried: Act III: Scene 3: Dort seh' ich Grane - Nilsson
B0000042H4	9	11	Siegfried: Act III: Scene 3: Ewig war ich, ewig bin ich - Nilsson
B0000042H4	10	1	Gotterdammerung: Prolog: Welch Licht leuchtet dort - Watts
B0000042H4	10	2	Gotterdammerung: Prolog: Treu beratner Vertrage Runen - Hoffman
B0000042H4	10	3	Gotterdammerung: Prolog: Es ragt die Burg, von Riesen gebaut - Valkki
B0000042H4	10	4	Gotterdammerung: Prolog: Zu neuen Taten, teurer Helde - Nilsson
B0000042H4	10	5	Gotterdammerung: Prolog: Willst du mir Minne schenken - Nilsson
B0000042H4	10	6	Gotterdammerung: Prolog: O heilige Gotter! - Nilsson
B0000042H4	10	7	Gotterdammerung: Prolog: Siegfrieds Rheinfahrt - Wiener Phil/Solti
B0000042H4	10	8	Gotterdammerung: Act I: Scene 1: Nun hor, Hagen - Fischer-Dieskau
B0000042H4	10	9	Gotterdammerung: Act I: Scene 1: Wen ratst du nun zu frein - Fischer-Dieskau
B0000042H4	10	10	Gotterdammerung: Act I: Scene 1: Jagt er auf Taten wonnig umher - Frick
B0000042H4	10	11	Gotterdammerung: Act I: Scene 2: Wer ist Gibichs Sohn? - Windgassen
B0000042H4	10	12	Gotterdammerung: Act I: Scene 2: Begru..e froh, o Held - Fischer-Dieskau
B0000042H4	10	13	Gotterdammerung: Act I: Scene 2: Willkommen, Gast, in Gibichs Haus! - Watson
B0000042H4	11	1	Gotterdammerung: Act I: Scene 2: Deinem Bruder bot ich mich zum Mann - Windgassen
B0000042H4	11	2	Gotterdammerung: Act I: Scene 2: Bluhenden Lebens labendes Blut - Windgassen
B0000042H4	11	3	Gotterdammerung: Act I: Scene 2: Frisch auf die Fahrt! - Windgassen
B0000042H4	11	4	Gotterdammerung: Act I: Scene 2: Hier sitz' ich zur Wacht - Frick
B0000042H4	11	5	Gotterdammerung: Act I: Scene 3: Altgewohntes Gerausch - Nilsson
B0000042H4	11	6	Gotterdammerung: Act I: Scene 3: Hore mit Sinn, was ich dir sage! - Ludwig
B0000042H4	11	7	Gotterdammerung: Act I: Scene 3: Welch banger Traume Maren - Nilsson
B0000042H4	11	8	Gotterdammerung: Act I: Scene 3: Was leckt so wutend - Nilsson
B0000042H4	11	9	Gotterdammerung: Act I: Scene 3: Brunnhild'! Ein Freier kam - Windgassen
B0000042H4	12	1	Gotterdammerung: Act II: Vorspiel - Wiener Phil/Solti
B0000042H4	12	2	Gotterdammerung: Act II: Scene 1: Schlafst du, Hagen, mein Sohn? - Neidlinger
B0000042H4	12	3	Gotterdammerung: Act II: Scene 2: Hoiho, Hahen! Muder Mann! - Windgassen
B0000042H4	12	4	Gotterdammerung: Act II: Scene 2: Hei.. mich willkommen, Gibichskind! - Windgassen
B0000042H4	12	5	Gotterdammerung: Act II: Scene 3: Hoiho! Hoihohoho! - Frick
B0000042H4	12	6	Gotterdammerung: Act II: Scene 4: Heil dir, Gunther! - Wiener Staatsopernchor
B0000042H4	12	7	Gotterdammerung: Act II: Scene 4: Gegru..t sei, teurer Held - Fischer-Dieskau
B0000042H4	12	8	Gotterdammerung: Act II: Scene 4: Einen Ring sah ich an deiner Hand - Nilsson
B0000042H4	12	9	Gotterdammerung: Act II: Scene 4: Heil'ge Gotter, himmlische Lenker! - Nilsson
B0000042H4	12	10	Gotterdammerung: Act II: Scene 4: Helle Wehr! Heilige Waffe! - Windgassen
B0000042H4	12	11	Gotterdammerung: Act II: Scene 4: Gunther, wehr deinem Weibe - Windgassen
B0000042H4	12	12	Gotterdammerung: Act II: Scene 5: Welches Unholds List liegt hier verhohlen? - Nilsson
B0000042H4	12	13	Gotterdammerung: Act II: Scene 5: Vertraue mir, betrogne Frau! - Frick
B0000042H4	12	14	Gotterdammerung: Act II: Scene 5: Auf, Gunther, edler Gibichung! - Frick
B0000042H4	13	1	Gotterdammerung: Act III: Vorspiel - Wiener Phil/Solti
B0000042H4	13	2	Gotterdammerung: Act III: Scene 1: Frau Sonne sendet lichte Strahlen - Wiener Staatsopernchor
B0000042H4	13	3	Gotterdammerung: Act III: Scene 1: Ein Albe fuhrte mich irr - Windgassen
B0000042H4	13	4	Gotterdammerung: Act III: Scene 1: Was leid' ich doch das karge Lob? - Windgassen
B0000042H4	13	5	Gotterdammerung: Act III: Scene 1: Siegfried! Siegfried! Siegfried! - Wiener Staatsopernchor
B0000042H4	13	6	Gotterdammerung: Act III: Scene 2: Hoiho! - Wiener Staatsopernchor
B0000042H4	13	7	Gotterdammerung: Act III: Scene 2: Trink, Gunther, trink! - Windgassen
B0000042H4	13	8	Gotterdammerung: Act III: Scene 2: Mime hie.. ein murrischer Zwerg - Windgassen
B0000042H4	13	9	Gotterdammerung: Act III: Scene 2: In Leid zu dem Wipfel lauscht' ich hinauf - Windgassen
B0000042H4	13	10	Gotterdammerung: Act III: Scene 2: Brunnhilde, heilige Braut! - Windgassen
B0000042H4	13	11	Gotterdammerung: Act III: Scene 2: Trauermusik beim Tode Siegfrieds - Wiener Phil/Solti
B0000042H4	13	12	Gotterdammerung: Act III: Scene 3: War das sein Horn? - Watson
B0000042H4	13	13	Gotterdammerung: Act III: Scene 3: Hoiho! Hoiho! - Wiener Staatsopernchor
B0000042H4	13	14	Gotterdammerung: Act III: Scene 3: Nicht klage wider mich! - Fischer-Dieskau
B0000042H4	13	15	Gotterdammerung: Act III: Scene 3: Schweigt eures Jammers - Nilsson
B0000042H4	13	16	Gotterdammerung: Act III: Scene 3: Starke Scheite schichtet mir dort - Nilsson
B0000042H4	13	17	Gotterdammerung: Act III: Scene 3: Mein Erbe nun nehm' ich zu eigen - Nilsson
B0000042H4	13	18	Gotterdammerung: Act III: Scene 3: Fliegt heim, ihr Raben! - Nilsson
B0000046NK	1	1	Evil Gal Blues
B0000046NK	1	2	Salty Papa Blues
B0000046NK	1	3	Embraceable You
B0000046NK	1	4	A Slick Chick (On The Mellow Side)
B0000046NK	1	5	Postman Blues
B0000046NK	1	6	That's Why A Woman Loves A Heel
B0000046NK	1	7	Walkin' And Talkin'
B0000046NK	1	8	Record Ban Blues
B0000046NK	1	9	(What Can I Say, Dear) After I Say I'm Sorry?
B0000046NK	1	10	I'll Wait (Master Take)
B0000046NK	1	11	Good Daddy Blues
B0000046NK	1	12	I Only Know
B0000046NK	1	13	Baby Get Lost
B0000046NK	1	14	It Isn't Fair
B0000046NK	1	15	I'll Never Be Free
B0000046NK	1	16	I Wanna Be Loved
B0000046NK	1	17	Time Out For Tears
B0000046NK	1	18	I Won't Cry Anymore
B0000046NK	1	19	New Blowtop Blues
B0000046NK	1	20	Wheel Of Fortune
B0000046NK	1	21	Trouble In Mind
B0000046NK	1	22	I Cried For You
B0000046NK	1	23	T.V. Is The Thing This Year
B0000046NK	1	24	Am I Blue?
B0000046NK	1	25	Blue Skies
B0000046NK	2	1	Love For Sale
B0000046NK	2	2	I've Got You Under My Skin
B0000046NK	2	3	I Don't Hurt Anymore
B0000046NK	2	4	Crazy He Calls Me
B0000046NK	2	5	Lover, Come Back To Me
B0000046NK	2	6	Teach Me Tonight
B0000046NK	2	7	Blue Gardenia
B0000046NK	2	8	Smoke Gets In Your Eyes
B0000046NK	2	9	If I Had You
B0000046NK	2	10	Sometimes I'm Happy
B0000046NK	2	11	Keepin' Out Of Mischief Now
B0000046NK	2	12	Back Water Blues
B0000046NK	2	13	All Of Me
B0000046NK	2	14	What A Difference A Day Made
B0000046NK	2	15	Unforgettable
B0000046NK	2	16	Baby, You've Got What It Takes
B0000046NK	2	17	A Rockin' Good Way (To Mess Around And Fall In Love)
B0000046NK	2	18	A Bad Case Of The Blues
B0000046NK	2	19	This Bitter Earth
B0000046NK	2	20	September In The Rain
B0000046NK	2	21	Mad About The Boy
B00000470C	1	1	Top Hat, White Tie and Tails
B00000470C	1	2	No Strings
B00000470C	1	3	I Concentrate on You
B00000470C	1	4	I'm Putting All My Eggs in One Basket
B00000470C	1	5	Fine Romance
B00000470C	1	6	Night and Day
B00000470C	1	7	Fascinating Rhythm
B00000470C	1	8	I Love Louisa
B00000470C	1	9	Slow Dances [Ad Lib]
B00000470C	1	10	Medium Dances [Ad Lib]
B00000470C	1	11	They Can't Take That Away from Me
B00000470C	1	12	You're Easy to Dance With
B00000470C	1	13	Needle in a Haystack
B00000470C	1	14	So Near and Yet So Far
B00000470C	1	15	Foggy Day
B00000470C	1	16	Oh Lady Be Good
B00000470C	1	17	I'm Building Up to an Awful Let-Down
B00000470C	1	18	Not My Girl
B00000470C	1	19	Jam Session [Instrumental]
B0000047EG	1	1	All Through the Night
B0000047EG	1	2	Anything Goes
B0000047EG	1	3	Miss Otis Regrets
B0000047EG	1	4	Too Darn Hot
B0000047EG	1	5	In the Still of the Night
B0000047EG	1	6	I Get a Kick Out of You
B0000047EG	1	7	Do I Love You?
B0000047EG	1	8	I'm Always True to You in My Far Fashion
B0000047EG	1	9	Let's Do It (Let's Fall in Love)
B0000047EG	1	10	Just One of Those Things
B0000047EG	1	11	Ev'ry Time We Say Goodbye
B0000047EG	1	12	All of You
B0000047EG	1	13	Begin the Beguine
B0000047EG	1	14	Get Out of Town
B0000047EG	1	15	I Am in Love
B0000047EG	1	16	From This Moment On
B0000047EG	2	1	I Love Paris
B0000047EG	2	2	You Do Something to Me
B0000047EG	2	3	Ridin' High
B0000047EG	2	4	Easy to Love
B0000047EG	2	5	It's All Right With Me
B0000047EG	2	6	Why Can't You Behave?
B0000047EG	2	7	What Is This Thing Called Love?
B0000047EG	2	8	You're the Top
B0000047EG	2	9	Love for Sale
B0000047EG	2	10	It's De-Lovely
B0000047EG	2	11	Night and Day
B0000047EG	2	12	Ace in the Hole
B0000047EG	2	13	So in Love
B0000047EG	2	14	I've Got You Under My Skin
B0000047EG	2	15	I Concentrate on You
B0000047EG	2	16	Don't Fence Me In
B0000047EG	2	17	You're the Top [Alternative][#]
B0000047EG	2	18	I Concentrate on You [Alternate Take][#]
B0000047EG	2	19	Let's Do It (Let's Fall in Love) [Alternate Take][#]
B000004CXU	1	1	Part l: No.1 Sinfony - AAM/Christopher Hogwood
B000004CXU	1	2	Part l: No.2 Recitative: Comfort Ye My People/No.3 Song: Every Valley Shall Be Exalted - Paul Elliott
B000004CXU	1	3	Part l: No.4 Chor: And The Glory Of The Lord - Chor Of Christ Church Cathedral, Oxford/Simon Preston
B000004CXU	1	4	Part l: No.5 Recitative: Thus Saith The Lord/No.6 Song: But Who May Abide The Day Of His Coming? - David Thomas/Emma Kirkby
B000004CXU	1	5	Part l: No.7 Chor: And He Shall Purify - Chor Of Christ Church Cathedral, Oxford/Simon Preston
B000004CXU	1	6	Part l: No.8 Recitative: Behold, A Virgin Shall Conceive/No.9 Song: O Thou That Tellest Good... - Carolyn Watkinson/Chor Of Christ Church Cathedral, Oxford/Simon Preston
B000004CXU	1	7	Part l: No.10 Recitative: For Behold, Darkness Shall Cover The Earth/No.11 Song: The People... - David Thomas
B000004CXU	1	8	Part l: No.12 Chor: For Unto Us A Child Is Born - Chor Christ Church Cathedral, Oxford/Simon Preston
B000004CXU	1	9	Part l: No.13 Pifa - AAM/Christopher Hogwood
B000004CXU	1	10	Part l: No.14a Recitative: There Were Shepherds, Abiding In The Field/No.14b: And Lo, The Angel... - Judith Nelson/Chor Of Christ Church Cathedral, Oxford/Simon Preston
B000004CXU	1	11	Part l: No.18 Song: Rejoice Greatly, O Daughter Of Zion - Judith Nelson
B000004CXU	1	12	Part l: No.19 Recitative: Then Shall The Eyes Of The Blind/No.20 Song: He Shall Feed His Flock - Judith Nelson
B000004CXU	1	13	Part l: No.21 Chor: His Yoke Is Easy, And His Burden Is Light - Chor Of Christ Church Cathedral, Oxford/Simon Preston
B000004CXU	1	14	Part ll: No.22 Chor: Behold The Lamb Of God - Chor Of Christ Church Cathedral, Oxford/Simon Preston
B000004CXU	1	15	Part ll: No.23 Song: He Was Despised - Carolyn Watkinson
B000004CXU	2	1	Part ll: No.24 Chor: Surely He Hath Borne Our Griefs/No.25 Chor: And With His Stripes We Are Healed - Chor Of Christ Church Cathedral, Oxford/Simon Preston
B000004CXU	2	2	Part ll: No.26 Chor: All We Like Sheep Have Gone Astray - Chor Of Christ Church Cathedral, Oxford/Simon Preston
B000004CXU	2	3	Part ll: No.27 Recitative: All They That See Him Laugh Him To Scorn/No.28 Chor: He Trusted In God - Paul Elliott/Choir Of Christ Church Cathedral, Oxford/Simon Preston
B000004CXU	2	4	Part ll: No.29 Recitative: Thy Rebuke Hath Broken His Heart/No.30 Song: Behold And See If There... - Paul Elliott/Judith Nelson
B000004CXU	2	5	Part ll: No.32 Song: But Thou Didst Not Leave His Soul In Hell - Judith Nelson
B000004CXU	2	6	Part ll: No.33 Chor: Lift Up Your Heads, O Ye Gates - Chor Of Christ Church Cathedral, Oxford/Simon Preston
B000004CXU	2	7	Part ll: No.34 Recitative: Unto Which Of The Angels Said He At Any Time/No.35 Chor: Let All The... - Paul Elliott/Chor Christ Church Cathedral, Oxford/Simon Preston
B000004CXU	2	8	Part ll: No.36 Song: Thou Art Gone Up On High - Emma Kirkby
B000004CXU	2	9	Part ll: No.37 Chor: The Lord Gave Word - Chor Of Christ Church Cathedral, Oxford/Simon Preston
B000004CXU	2	10	Part ll: No.38 Song: How Beautiful Are The Feet - Judith Nelson
B000004CXU	2	11	Part ll: No.39 Chor: Their Sound Is Gone Out - Chor Of Christ Church Cathedral, Oxford/Simon Preston
B000004CXU	2	12	Part ll: No.40 Song: Why Do The Nations So Furiously Rage Together?/No.41 Chor: Let Us Break... - David Thomas/Chor Of Christ Church Cathedral, Oxford/Simon Preston
B000004CXU	2	13	Part ll: No.42 Recitative: He That Dwelleth In Heaven/No.43 Song: Thou Shalt Break Them - Paul Elliott
B000004CXU	2	14	Part ll: No.44 Chor: Hallelujah - Chor Of Christ Church Cathedral, Oxford/Simon Preston
B000004CXU	2	15	Part lll: No.45 Song: I Know That My Redeemer Liveth - Judith Nelson
B000004CXU	2	16	Part lll: No.46 Chor: Since By Man Came Death - Chor Of Christ Church Cathedral, Oxford/Simon Preston
B000004CXU	2	17	Part lll: No.47 Recitative: Behold, I Tell You A Mystery/No.48 Song: The Trumpet Shall Sound - David Thomas
B000004CXU	2	18	Part lll: No.49 Recitative: Then Shall Be Brought To Pass/No.50 Duet: O Death, Where Is Thy Sting? - Carolyn Watkinson/Paul Elliott
B000004CXU	2	19	Part lll: No.51 Chor: But Thanks Be To God - Chor Of Christ Church Cathedral, Oxford/Simon Preston
B000004CXU	2	20	Part lll: No.52 Song: If God Be For Us - Emma Kirkby
B000004CXU	2	21	Part lll: No.53 Chor: Worthy Is The Lamb That Was Slain - Chor Of Christ Church Cathedral, Oxford/Simon Preston
B000004CXU	2	22	Part lll: No.54 Chor: Amen - Chor Of Christ Church Cathedral, Oxford/Simon Preston
B000005J56	1	1	Chan Chan
B000005J56	1	2	De Camino a La Vereda
B000005J56	1	3	El Cuarto de Tula
B000005J56	1	4	Pueblo Nuevo
B000005J56	1	5	Dos Gardenias
B000005J56	1	6	Y Tu Que Has Hecho
B000005J56	1	7	Veinte Anos
B000005J56	1	8	El Carretero
B000005J56	1	9	Candela
B000005J56	1	10	Amor de Loca Juventud
B000005J56	1	11	Orgullecida
B000005J56	1	12	Murmullo
B000005J56	1	13	Buena Vista Social Club
B000005J56	1	14	La Bayamesa
B000005YZM	1	1	Care of Cell 44
B000005YZM	1	2	Rose for Emily
B000005YZM	1	3	Maybe After He's Gone
B000005YZM	1	4	Beechwood Park
B000005YZM	1	5	Brief Candles
B000005YZM	1	6	Hung up on a Dream
B000005YZM	1	7	Changes
B000005YZM	1	8	I Want Her She Wants Me
B000005YZM	1	9	This Will Be Our Year
B000005YZM	1	10	Butcher's Tale (Western Front 1914)
B000005YZM	1	11	Friends of Mine
B000005YZM	1	12	Time of the Season
B000005YZM	1	13	Care of Cell 44
B000005YZM	1	14	Rose for Emily
B000005YZM	1	15	Maybe After He's Gone
B000005YZM	1	16	Beechwood Park
B000005YZM	1	17	Brief Candles
B000005YZM	1	18	Hung up on a Dream
B000005YZM	1	19	Changes
B000005YZM	1	20	I Want Her She Wants Me
B000005YZM	1	21	This Will Be Our Year
B000005YZM	1	22	Butcher's Tale (Western Front 1914)
B000005YZM	1	23	Friends of Mine
B000005YZM	1	24	Time of the Season
B000005YZM	1	25	Rose for Emily [Alternate Version 2][#]
B000005YZM	1	26	Time of the Season [Alternate Mix][#]
B000005YZM	1	27	Prison Song AKA Care of Cell 44 [Backing Track][#]
B0000060NA	1	1	Love's In Need Of Love Today
B0000060NA	1	2	Have A Talk With God
B0000060NA	1	3	Village Ghetto land
B0000060NA	1	4	Contusion
B0000060NA	1	5	Sir Duke
B0000060NA	1	6	I Wish
B0000060NA	1	7	Knocks Me Off My Feet
B0000060NA	1	8	Pastime Paradise
B0000060NA	1	9	Summer Soft
B0000060NA	1	10	Ordinary Pain
B0000060NA	1	11	Saturn
B0000060NA	1	12	Ebony Eyes
B0000060NA	2	1	Isn't She Lovely
B0000060NA	2	2	Joy Inside My Tears
B0000060NA	2	3	Black Man
B0000060NA	2	4	Ngiculela-Es Una Historia-I Am Singing
B0000060NA	2	5	If It's Magic
B0000060NA	2	6	As
B0000060NA	2	7	Another Star
B0000060NA	2	8	All Day Sucker
B0000060NA	2	9	Easy Goin' Evening (My Mama's Call)
B00000638D	1	1	Tearin' Up My Heart
B00000638D	1	2	I Just Wanna Be With You
B00000638D	1	3	Here We Go
B00000638D	1	4	For The Girl Who Has Everything
B00000638D	1	5	God Must Have Spent A Little More Time On You
B00000638D	1	6	You Got It
B00000638D	1	7	I Need Love
B00000638D	1	8	I Want You Back
B00000638D	1	9	Everything I Own
B00000638D	1	10	I Drive Myself Crazy
B00000638D	1	11	Crazy For You
B00000638D	1	12	Sailing
B00000638D	1	13	Giddy Up
B000006NZV	1	1	Temptation Waits
B000006NZV	1	2	I Think I'm Paranoid
B000006NZV	1	3	When I Grow Up
B000006NZV	1	4	Medication
B000006NZV	1	5	Special
B000006NZV	1	6	Hammering in My Head
B000006NZV	1	7	Push It
B000006NZV	1	8	Trick Is to Keep Breathing
B000006NZV	1	9	Dumb
B000006NZV	1	10	Sleep Together
B000006NZV	1	11	Wicked Ways
B000006NZV	1	12	You Look So Fine
B000006OBP	1	1	The September Of My Years
B000006OBP	1	2	How Old Am I?
B000006OBP	1	3	Don't Wait Too Long
B000006OBP	1	4	It Gets Lonely Early
B000006OBP	1	5	This Is All I Ask
B000006OBP	1	6	Last Night When We Were Young
B000006OBP	1	7	The Man In The Looking Glass
B000006OBP	1	8	It Was A Very Good Year
B000006OBP	1	9	When The Wind Was Green
B000006OBP	1	10	Hello, Young Lovers
B000006OBP	1	11	I See It Now
B000006OBP	1	12	Once Upon A Time
B000006OBP	1	13	September Song
B000006OHD	1	1	In The Wee Small Hours Of The Morning
B000006OHD	1	2	Mood Indigo
B000006OHD	1	3	Glad To Be Unhappy
B000006OHD	1	4	I Get Along Without You Very Well
B000006OHD	1	5	Deep In A Dream
B000006OHD	1	6	I See Your Face Before Me
B000006OHD	1	7	Can't We Be Friends?
B000006OHD	1	8	When Your Lover Has Gone
B000006OHD	1	9	What Is This Thing Called Love
B000006OHD	1	10	Last Night When We Were Young
B000006OHD	1	11	I'll Be Around
B000006OHD	1	12	Ill Wind
B000006OHD	1	13	It Never Entered My Mind
B000006OHD	1	14	Dancing On The Ceiling
B000006OHD	1	15	I'll Never Be The Same
B000006OHD	1	16	This Love Of Mine
B000006OHF	1	1	Only The Lonely
B000006OHF	1	2	Angel Eyes
B000006OHF	1	3	What's New?
B000006OHF	1	4	It's A Lonesome Old Town
B000006OHF	1	5	Willow Weep For Me
B000006OHF	1	6	Good-Bye
B000006OHF	1	7	Blues In The Night
B000006OHF	1	8	Guess I'll Hang My Tears Out To Dry
B000006OHF	1	9	Ebb Tide
B000006OHF	1	10	Spring Is Here
B000006OHF	1	11	Gone With The Wind
B000006OHF	1	12	One For My Baby
B000006OHF	1	13	Sleep Warm
B000006OHF	1	14	Where Or When
B000006OHJ	1	1	You're Nobody Till Somebody Loves You
B000006OHJ	1	2	Volare
B000006OHJ	1	3	In the Chapel in the Moonlight
B000006OHJ	1	4	Memories Are Made of This
B000006OHJ	1	5	Houston
B000006OHJ	1	6	Powder Your Face With Sunshine (Smile! Smile! Smile!)
B000006OHJ	1	7	Door Is Still Open to My Heart
B000006OHJ	1	8	That's Amore
B000006OHJ	1	9	Somewhere There's a Someone
B000006OHJ	1	10	Ain't That a Kick in the Head
B000006OHJ	1	11	In the Misty Moonlight
B000006OHJ	1	12	You Belong to Me
B000006OHJ	1	13	Innamorata (Sweetheart)
B000006OHJ	1	14	I Will
B000006OHJ	1	15	Return to Me (Ritorna-Me)
B000006OHJ	1	16	Everybody Loves Somebody
B000006OJ7	1	1	It's Just a Matter of Time
B000006OJ7	1	2	Hurtin' Inside
B000006OJ7	1	3	Endlessly
B000006OJ7	1	4	So Many Ways
B000006OJ7	1	5	Baby (You've Got What It Takes)
B000006OJ7	1	6	Rockin' Good Way (To Mess Around and Fall in Love)
B000006OJ7	1	7	Kiddio
B000006OJ7	1	8	Fools Rush In (Where Angels Fear to Tread)
B000006OJ7	1	9	Think Twice
B000006OJ7	1	10	Boll Weevil
B000006OJ7	1	11	It's Just a House Without You
B000006OJ7	1	12	Frankie and Johnny
B000006OJ7	1	13	Revenge
B000006OJ7	1	14	Shadrack
B000006OJ7	1	15	Hit Record
B000006OJ7	1	16	Lie to Me
B000006OJ7	1	17	Hotel Happiness
B000006OJ7	1	18	Still Waters Run Deep
B000006OJ7	1	19	Rainy Night in Georgia
B000006OJ7	1	20	Don't It Make You Want to Go Home
B000006ONF	1	1	Prologue: Work Song
B000006ONF	1	2	Prologue: Valijean Arrested/Valijean Forgiven
B000006ONF	1	3	Prologue: What Have I Done?
B000006ONF	1	4	At The End Of The Day
B000006ONF	1	5	I Dreamed A Dream
B000006ONF	1	6	Lovely Ladies
B000006ONF	1	7	Who Am I?
B000006ONF	1	8	Fantine's Death: Come To Me
B000006ONF	1	9	Fantine's Death: Confrontation
B000006ONF	1	10	Castle On A Cloud
B000006ONF	1	11	Master Of The House
B000006ONF	1	12	Thenardier Waltz
B000006ONF	1	13	Stars
B000006ONF	1	14	Look Down
B000006ONF	1	15	Little People
B000006ONF	1	16	Red & Black
B000006ONF	1	17	Do You Hear The People Sing?
B000006ONF	2	1	Love Montage: I Saw Him Once/In My Life/A Heart Full Of Love
B000006ONF	2	2	Plumet Attack
B000006ONF	2	3	One Day More!
B000006ONF	2	4	On My Own
B000006ONF	2	5	The Attack
B000006ONF	2	6	A Little Fall Of Rain
B000006ONF	2	7	Drink With Me
B000006ONF	2	8	Bring Him Home
B000006ONF	2	9	Dog Eat Dog
B000006ONF	2	10	Soliloquy
B000006ONF	2	11	Turning
B000006ONF	2	12	Empty Chairs At Empty Tables
B000006ONF	2	13	Beggar At The Feast
B000006ONF	2	14	Finale
B000007OWW	1	1	It's Not Unusual
B000007OWW	1	2	Chills and Fever
B000007OWW	1	3	Green, Green Grass of Home
B000007OWW	1	4	What's New Pussycat?
B000007OWW	1	5	Thunderball
B000007OWW	1	6	Not Responsible
B000007OWW	1	7	Detroit City
B000007OWW	1	8	(It Looks Like) I'll Never Fall In Love Again
B000007OWW	1	9	I'm Coming Home
B000007OWW	1	10	Delilah
B000007OWW	1	11	Love Me Tonight
B000007OWW	1	12	Help Yourself
B000007OWW	1	13	Without Love (There Is Nothing)
B000007OWW	1	14	Daughter Of Darkness
B000007OWW	1	15	She's a Lady
B000007OWW	1	16	I (Who Have Nothing)
B000007OWW	1	17	Till
B000007OWW	1	18	Young New Mexican Puppeteer
B000007OWW	1	19	Something 'Bout You Baby I Like
B000007OWW	1	21	Puppet Man
B000007OWW	1	22	Kiss
B000007Q8H	1	1	Come Home
B000007Q8H	1	2	Sit Down
B000007Q8H	1	3	She's A Star
B000007Q8H	1	4	Laid
B000007Q8H	1	5	Waltzing Along
B000007Q8H	1	6	Say Something
B000007Q8H	1	7	Born Of Frustation
B000007Q8H	1	8	Tommorow
B000007Q8H	1	9	Destiny Calling
B000007Q8H	1	10	Out To Get You
B000007Q8H	1	11	Runaground
B000007Q8H	1	12	Lose Control
B000007Q8H	1	13	Sometimes
B000007Q8H	1	14	How Was It For You?
B000007Q8H	1	15	Seven
B000007Q8H	1	16	Sound
B000007Q8H	1	17	Ring The Bells
B000007Q8H	1	18	Hymn From A Village
B0000087QO	1	1	Hanging On The Telephone
B0000087QO	1	2	One Way Or Another
B0000087QO	1	3	Picture This
B0000087QO	1	4	Fade Away And Radiate
B0000087QO	1	5	Pretty Baby
B0000087QO	1	6	I Know But I Don't Know
B0000087QO	1	7	11:59
B0000087QO	1	8	Will Anything Happen?
B0000087QO	1	9	Sunday Girl
B0000087QO	1	10	Heart Of Glass
B0000087QO	1	11	I'm Gonna Love You Too
B0000087QO	1	12	Just Go Away
B00000ADG2	1	1	Intro
B00000ADG2	1	2	Lost Ones
B00000ADG2	1	3	Ex-Factor
B00000ADG2	1	4	To Zion
B00000ADG2	1	5	Doo Wop (That Thing)
B00000ADG2	1	6	Superstar
B00000ADG2	1	7	Final Hour
B00000ADG2	1	8	When It Hurts So Bad
B00000ADG2	1	9	I Used to Love Him
B00000ADG2	1	10	Forgive Them Father
B00000ADG2	1	11	Every Ghetto, Every City
B00000ADG2	1	12	Nothing Even Matters
B00000ADG2	1	13	Everything Is Everything
B00000ADG2	1	14	The Miseducation Of Lauryn Hill
B00000ADG2	1	15	Can't Take My Eyes Off You (hidden track)
B00000ADG2	1	16	Sweetest Thing [Mahogany Mix] [*]
B00000AEV0	1	1	Night And Day
B00000AEV0	1	2	I Wish I Were In Love Again
B00000AEV0	1	3	I Got Plenty O' Nuttin'
B00000AEV0	1	4	I Guess I'll Have To Change My Plans
B00000AEV0	1	5	Nice Work If You Can Get It
B00000AEV0	1	6	Stars Fell On Alabama
B00000AEV0	1	7	No One Ever Tells You
B00000AEV0	1	8	I Won't Dance
B00000AEV0	1	9	Lonesome Road
B00000AEV0	1	10	At Long Last Love
B00000AEV0	1	11	You'd Be So Nice To Come Home To
B00000AEV0	1	12	I Got It Bad And That Ain't Good
B00000AEV0	1	13	From This Moment On
B00000AEV0	1	14	If I Had You
B00000AEV0	1	15	Oh! Look At Me Now
B00000AEV0	1	16	The Lady Is A Tramp
B00000AF99	1	1	I Don't Know Why I Love You
B00000AF99	1	2	Crush Me
B00000AF99	1	3	Destroy the Heart
B00000AF99	1	4	Girl With the Loneliest Eyes
B00000AF99	1	5	Christine
B00000AF99	1	6	Beatles and the Stones
B00000AF99	1	7	Never
B00000AF99	1	8	Shine On
B00000AF99	1	9	Marble
B00000AF99	1	10	Feel
B00000AF99	1	11	Let's Talk About You
B00000AF99	1	12	Safe
B00000AF99	1	13	You Don't Understand
B00000AF99	1	14	Yer Eyes
B00000AF99	1	15	Loneliness Is a Gun
B00000AFEZ	1	1	Isn't It a Pity?
B00000AFEZ	1	2	Of Thee I Sing
B00000AFEZ	1	3	I'll Build a Stairway to Paradise
B00000AFEZ	1	4	Someone to Watch over Me
B00000AFEZ	1	5	Bidin' My Time
B00000AFEZ	1	6	Man I Love
B00000AFEZ	1	7	How Long Has This Been Going On?
B00000AFEZ	1	8	My One and Only (What Am I Going to Do?)
B00000AFEZ	1	9	Lorelei
B00000AFEZ	1	10	I've Got a Crush on You
B00000AFEZ	1	11	Summertime
B00000AFEZ	1	12	Aren't You Kind of Glad We Did?
B00000AFEZ	1	13	They All Laughed
B00000AFEZ	1	14	Looking for a Boy
B00000AFEZ	1	15	He Loves and She Loves
B00000AFEZ	1	16	My Man's Gone Now
B00000AFEZ	2	1	I Won't Say I Will
B00000AFEZ	2	2	Foggy Day
B00000AFEZ	2	3	Let's Call the Whole Thing Off
B00000AFEZ	2	4	Things Are Looking Up
B00000AFEZ	2	5	Do It Again
B00000AFEZ	2	6	Love Walked In
B00000AFEZ	2	7	Things Are Looking Up [Incomplete Take]
B00000AFEZ	2	8	I Won't Say I Will [Incomplete Take]
B00000AFEZ	2	9	I Won't Say I Will [Incomplete Take]
B00000AFEZ	2	10	I Won't Say I Will [Incomplete Take]
B00000AFEZ	2	11	I Won't Say I Will [Incomplete Take]
B00000AFEZ	2	12	I Won't Say I Will [Incomplete Take]
B00000AFEZ	2	13	Of Thee I Sing [Incomplete Take]
B00000AFEZ	2	14	Of Thee I Sing [Incomplete Take]
B00000AFEZ	2	15	Of Thee I Sing [Incomplete Take]
B00000AFEZ	2	16	Of Thee I Sing [Incomplete Take]
B00000AFEZ	2	17	My One and Only (What Am I Gonna Do?) [Incomplete Take]
B00000AFEZ	2	18	My One and Only (What Am I Gonna Do?) [Incomplete Take]
B00000AFEZ	2	19	My One and Only (What Am I Gonna Do?) [Incomplete Take]
B00000AFFF	1	1	In the Darkest Place - Burt Bacharach
B00000AFFF	1	2	Toledo - Burt Bacharach
B00000AFFF	1	3	I Still Have That Other Girl - Burt Bacharach
B00000AFFF	1	4	This House Is Empty Now - Burt Bacharach
B00000AFFF	1	5	Tears at the Birthday Party - Elvis Costello
B00000AFFF	1	6	Such Unlikely Lovers - Burt Bacharach
B00000AFFF	1	7	My Thief - Elvis Costello
B00000AFFF	1	8	Long Division - Elvis Costello
B00000AFFF	1	9	Painted from Memory - Elvis Costello
B00000AFFF	1	10	Sweetest Punch - Elvis Costello
B00000AFFF	1	11	What's Her Name Today? - Elvis Costello
B00000AFFF	1	12	God Give Me Strength - Burt Bacharach
B00000AFQT	1	1	Requiem, K626: I. Introitus: Requiem Aeternam
B00000AFQT	1	2	Requiem, K626: II. Kyrie
B00000AFQT	1	3	III. Sequentia: Dies Irae
B00000AFQT	1	4	III. Sequentia: Tuba Mirum
B00000AFQT	1	5	III. Sequentia: Rex Tremendae Majestatis
B00000AFQT	1	6	III. Sequentia: Recordare
B00000AFQT	1	7	III. Sequentia: Confutatis
B00000AFQT	1	8	III. Sequentia: Lacrimosa
B00000AFQT	1	9	IV. Offtertorium: Domine Jesu Christe
B00000AFQT	1	10	IV. Offertorium: Hostias
B00000AFQT	1	11	V.: Sanctus
B00000AFQT	1	12	VI.: Benedictus
B00000AFQT	1	13	VII. Angus Dei
B00000AFQT	1	14	VIII. Communio: Lux Aeterna
B00000AG8K	1	1	Dizzy
B00000AG8K	1	2	Slide
B00000AG8K	1	3	Broadway
B00000AG8K	1	4	January Friend
B00000AG8K	1	5	Black Balloon
B00000AG8K	1	6	Bullet Proof
B00000AG8K	1	7	Amigone
B00000AG8K	1	8	All Eyes on Me
B00000AG8K	1	9	Full Forever
B00000AG8K	1	10	Acoustic #3
B00000AG8K	1	11	Iris
B00000AG8K	1	12	Extra Pale
B00000AG8K	1	13	Hate This Place
B00000DCHF	1	1	Allentown
B00000DCHF	1	2	Laura
B00000DCHF	1	3	Pressure
B00000DCHF	1	4	Goodnight Saigon
B00000DCHF	1	5	She's Right on Time
B00000DCHF	1	6	Room of Our Own
B00000DCHF	1	7	Surprises
B00000DCHF	1	8	Scandinavian Skies
B00000DCHF	1	9	Where's the Orchestra?
B00000DCHI	1	1	Piano Man
B00000DCHI	1	2	Captain Jack
B00000DCHI	1	3	Entertainer
B00000DCHI	1	4	Say Goodbye to Hollywood
B00000DCHI	1	5	New York State of Mind
B00000DCHI	1	6	Stranger
B00000DCHI	1	7	Scenes from an Italian Restaurant
B00000DCHI	1	8	Just the Way You Are
B00000DCHI	1	9	Movin' out (Anthony's Song)
B00000DCHI	1	10	Only the Good Die Young
B00000DCHI	2	1	My Life
B00000DCHI	2	2	Big Shot
B00000DCHI	2	3	Honesty
B00000DCHI	2	4	You May Be Right
B00000DCHI	2	5	It's Still Rock & Roll to Me
B00000DCHI	2	6	She's Got a Way
B00000DCHI	2	7	Pressure
B00000DCHI	2	8	Allentown
B00000DCHI	2	9	Goodnight Saigon
B00000DCHI	2	10	Tell Her About It
B00000DCHI	2	11	Uptown Girl
B00000DCHI	2	12	Longest Time
B00000DCHI	2	13	You're Only Human (Second Wind)
B00000DCHI	2	14	Night Is Still Young
B00000DCI5	1	1	Waiting for the Train to Come In
B00000DCI5	1	2	I Don't Know Enough About You
B00000DCI5	1	3	It's All over Now
B00000DCI5	1	4	It's a Good Day
B00000DCI5	1	5	Chi-Baba, Chi-Baba (My Bambino Go to Sleep)
B00000DCI5	1	6	Golden Earrings
B00000DCI5	1	7	Why Don't You Do Right?
B00000DCI5	1	8	Ma..ana (Is Soon Enough for Me)
B00000DCI5	1	9	Riders in the Sky (A Cowboy Legend)
B00000DCI5	1	10	Happiness Is a Thing Called Joe
B00000DCI5	1	11	Fever
B00000DCI5	1	12	Alright, Okay, You Win
B00000DCI5	1	13	I'm a Woman
B00000DCI5	1	14	Pass Me By
B00000DCI5	1	15	Big Spender
B00000DCI5	1	16	Is That All There Is?
B00000DFTD	1	1	Fanmail
B00000DFTD	1	2	The Vic-E Interpretation (Interlude)
B00000DFTD	1	3	Silly Ho
B00000DFTD	1	4	Whispering Playa (Interlude)
B00000DFTD	1	5	No Scrubs
B00000DFTD	1	6	I'm Good at Being Bad
B00000DFTD	1	7	If They Knew
B00000DFTD	1	8	I Miss You So Much
B00000DFTD	1	9	Unpretty
B00000DFTD	1	10	My Life
B00000DFTD	1	11	Shout
B00000DFTD	1	12	Come on Down
B00000DFTD	1	13	Dear Lie
B00000DFTD	1	14	Communicate (Interlude)
B00000DFTD	1	15	Lovesick
B00000DFTD	1	16	Automatic
B00000DFTD	1	17	Don't Pull Out on Me Yet
B00000DMJG	1	1	Callin' Baton Rouge
B00000DMJG	1	2	Two of a Kind, Workin' on a Full House
B00000DMJG	1	3	Shameless
B00000DMJG	1	4	Papa Loved Mama
B00000DMJG	1	5	Thunder Rolls [The Long Version]
B00000DMJG	1	6	We Shall Be Free
B00000DMJG	1	7	Unanswered Prayers
B00000DMJG	1	8	Standing Outside the Fire
B00000DMJG	1	9	Longneck Bottle
B00000DMJG	1	10	It's Your Song
B00000DMJG	1	11	Much Too Young (To Feel This Damn Old)
B00000DMJG	1	12	River
B00000DMJG	1	13	Tearin' It Up (And Burnin' It Down)
B00000DMJG	2	1	Ain't Goin' Down (Til the Sun Comes Up)
B00000DMJG	2	2	Rodeo
B00000DMJG	2	3	Beaches of Chieyenne
B00000DMJG	2	4	Two Pi..a Coladas
B00000DMJG	2	5	Wild as the Wind
B00000DMJG	2	6	To Make You Feel My Love
B00000DMJG	2	7	That Summer
B00000DMJG	2	8	American Honky-Tonk Bar Association
B00000DMJG	2	9	If Tomorrow Never Comes
B00000DMJG	2	10	Fever
B00000DMJG	2	11	Friends in Low Places [The Long Version]
B00000DMJG	2	12	Dance
B00000F1D3	1	1	Believe
B00000F1D3	1	2	Power
B00000F1D3	1	3	Runaway
B00000F1D3	1	4	All or Nothing
B00000F1D3	1	5	Strong Enough
B00000F1D3	1	6	Dov'e L'amore
B00000F1D3	1	7	Takin' Back My Heart
B00000F1D3	1	8	Taxi Taxi
B00000F1D3	1	9	Love Is the Groove
B00000F1D3	1	10	We All Sleep Alone
B00000G1IL	1	1	. . . .Baby One More Time
B00000G1IL	1	2	(You Drive Me) Crazy
B00000G1IL	1	3	Sometimes
B00000G1IL	1	4	Soda Pop
B00000G1IL	1	5	Born To Make You Happy
B00000G1IL	1	6	From the Bottom of My Broken Heart
B00000G1IL	1	7	I Will Be There
B00000G1IL	1	8	I Will Still Love You - Don Philip
B00000G1IL	1	9	Thinkin' About You
B00000G1IL	1	10	E-Mail My Heart
B00000G1IL	1	11	The Beat Goes On
B00000HZEQ	1	1	Just A Little Lovin'
B00000HZEQ	1	2	So Much Love
B00000HZEQ	1	3	Son Of A Preacher Man
B00000HZEQ	1	4	I Don't Want To Hear It Anymore
B00000HZEQ	1	5	Don't Forget About Me
B00000HZEQ	1	6	Breakfast In Bed
B00000HZEQ	1	7	Just One Smile
B00000HZEQ	1	8	The Windmills Of Your Mind
B00000HZEQ	1	9	In The Land Of Make Believe
B00000HZEQ	1	10	No Easy Way Down
B00000HZEQ	1	11	I Can't Make It Alone
B00000HZEQ	1	12	What Do You Do When Love Dies (bonus track)
B00000HZEQ	1	13	Willie & Laura Mae Jones (bonus track)
B00000HZEQ	1	14	That Old Sweet Roll (Hi-De-Ho) (bonus track)
B00000HZEQ	1	15	Cherished
B00000HZEQ	1	16	Goodbye
B00000HZEQ	1	17	Make It With You
B00000HZEQ	1	18	Love Shine Down
B00000HZEQ	1	19	Live Here With You
B00000HZEQ	1	20	Natchez Trace
B00000HZEQ	1	21	All The KIng's Horses
B00000HZEQ	1	22	I'll Be Faithful
B00000HZEQ	1	23	Have A Good Life Baby
B00000HZEQ	1	24	You've Got A Friend
B00000HZEQ	1	25	I Found My Way
B00000IOOE	1	1	Larger Than Life
B00000IOOE	1	2	I Want It That Way
B00000IOOE	1	3	Show Me the Meaning of Being Lonely
B00000IOOE	1	4	It's Gotta Be You
B00000IOOE	1	5	I Need You Tonight
B00000IOOE	1	6	Don't Want You Back
B00000IOOE	1	7	Don't Wanna Lose You Now
B00000IOOE	1	8	One
B00000IOOE	1	9	Back to Your Heart
B00000IOOE	1	10	Spanish Eyes
B00000IOOE	1	11	No One Else Comes Close
B00000IOOE	1	12	Perfect Fan
B00000IOSU	1	1	Building A Mystery
B00000IOSU	1	2	Hold On
B00000IOSU	1	3	Good Enough
B00000IOSU	1	4	I Will Remember You
B00000IOSU	1	5	Adia
B00000IOSU	1	6	I Love You
B00000IOSU	1	7	Do What You Have To Do
B00000IOSU	1	8	Path Of Thorns
B00000IOSU	1	9	Fear
B00000IOSU	1	10	Possession
B00000IOSU	1	11	Sweet Surrender
B00000IOSU	1	12	Ice Cream
B00000IOSU	1	13	Fumbling Towards Ecstasy
B00000IOSU	1	14	Angel
B00000IQMT	1	1	Star Wars Main Title and the Arrival at Naboo
B00000IQMT	1	2	Duel of the Fates
B00000IQMT	1	3	Anakin's Theme
B00000IQMT	1	4	Jar Jar's Introduction and the Swim to Otoh Gunga
B00000IQMT	1	5	The Sith Spacecraft and the Droid Battle
B00000IQMT	1	6	The Trip to the Naboo Temple and the Audience with Boss Nass
B00000IQMT	1	7	The Arrival at Tatooine and the Flag Parade
B00000IQMT	1	8	He is the Chosen One
B00000IQMT	1	9	Anakin Defeats Sebulba
B00000IQMT	1	10	Passage Through the Planet Core
B00000IQMT	1	11	Watto's Deal and Kids at Play
B00000IQMT	1	12	Panaka and the Queen's Protectors
B00000IQMT	1	13	Queen Amidala and the Naboo Palace
B00000IQMT	1	14	The Droid Invasion and The Appearance of Darth Maul
B00000IQMT	1	15	Qui-Gon's Noble End
B00000IQMT	1	16	The High Council Meeting and Qui-Gon's Funeral
B00000IQMT	1	17	Augie's Municipal Band and End Credits
B00000IWQV	1	1	I Can't Make It
B00000IWQV	1	2	Just Passing
B00000IWQV	1	3	Here Come the Nice
B00000IWQV	1	4	Talk to You
B00000IWQV	1	5	(Tell Me) Have You Ever Seen Me
B00000IWQV	1	6	Something I Want to Tell You
B00000IWQV	1	7	Feeling Lonely
B00000IWQV	1	8	Happy Boys Happy
B00000IWQV	1	9	Things Are Going to Get Better
B00000IWQV	1	10	My Way of Giving
B00000IWQV	1	11	Green Circles
B00000IWQV	1	12	Become Like You
B00000IWQV	1	13	Get Yourself Together
B00000IWQV	1	14	All Our Yesterdays
B00000IWQV	1	15	Show Me the Way
B00000IWQV	1	16	Up the Wooden Hills to Bedfordshiree
B00000IWQV	1	17	Eddie's Dreaming
B00000IWQV	1	18	Itchycoo Park
B00000IWQV	1	19	I'm Only Dreaming
B00000IWQV	1	20	Tin Soldier
B00000IWQV	1	21	I Feel Much Better
B00000IWQV	1	22	Ogden's Nut Gone Flake
B00000IWQV	1	23	Afterglow (Of Your Love)
B00000IWQV	1	24	Long Agos and Worlds Apart
B00000IWQV	1	25	Rene
B00000IWQV	1	26	Song of a Baker
B00000IWQV	1	27	Lazy Sunday
B00000IWQV	2	1	Happiness Stan
B00000IWQV	2	2	Rollin' Over
B00000IWQV	2	3	Hungry Intruder
B00000IWQV	2	4	Journey
B00000IWQV	2	5	Mad John
B00000IWQV	2	6	Happy Days Toy Town
B00000IWQV	2	7	Universal
B00000IWQV	2	8	Donkey Rides, a Penny, a Glass
B00000IWQV	2	9	Wham Bam Thank You Mam
B00000IWQV	2	10	Autumn Stone
B00000IWQV	2	11	Collibosher
B00000IWQV	2	12	Red Balloon
B00000IWQV	2	13	Call It Something Nice
B00000IWQV	2	14	Wide-Eyed Girl on the Wall
B00000IWQV	2	15	Don't Burst My Bubble
B00000IWQV	2	16	Every Little Bit Hurts [Studio Version]
B00000IWQV	2	17	Picaninny
B00000IWQV	2	18	Pig Trotters
B00000IWQV	2	19	War of the Worlds
B00000IWQV	2	20	Take My Time
B00000IWQV	2	21	Mad John [Us Single Version With Extra Verse]
B00000IWQV	2	22	(If You Think You're) Groovy - P.P. Arnold
B00000IWQV	2	23	Wham Bam Thank You Mam [Alternative Stereo Mix]
B00000IX6H	1	1	Livin' la Vida Loca - Rusty Anderson
B00000IX6H	1	2	Spanish Eyes
B00000IX6H	1	3	She's All I Ever Had
B00000IX6H	1	4	Shake Your Bon Bon
B00000IX6H	1	5	Cuidado Con Mi Corazon - (with Madonna)
B00000IX6H	1	6	Private Emotion - (with Meja)
B00000IX6H	1	7	Love You For A Day
B00000IX6H	1	8	I Am Made Of You
B00000IX6H	1	9	Cup Of Life, The - (Spanglish version)
B00000IX6H	1	10	You Stay With Me
B00000IX6H	1	11	Livin' La Vida Loca - (Spanish version)
B00000IX6H	1	12	I Count The Minutes
B00000IX6H	1	13	(She's All I Ever Had, Spanish version)
B00000IX6H	1	14	Maria - (Spanglish version remix, radio edit)
B00000J2PH	1	1	I Feel The Earth Move
B00000J2PH	1	2	So Far Away
B00000J2PH	1	3	It's Too Late
B00000J2PH	1	4	Home Again
B00000J2PH	1	5	Beautiful
B00000J2PH	1	6	Way Over Yonder
B00000J2PH	1	7	You've Got A Friend
B00000J2PH	1	8	Where You Lead
B00000J2PH	1	9	Will You Love Me Tomorrow?
B00000J2PH	1	10	Smackwater Jack
B00000J2PH	1	11	Tapestry
B00000J2PH	1	12	(You Make Me Feel Like) A Natural Woman
B00000J2PH	1	13	Out In The Cold - (bonus track, previously unreleased)
B00000J2PH	1	14	Smackwater Jack - (bonus track, previously unreleased, live)
B00000J7J4	1	1	(Da Le) Yaleo
B00000J7J4	1	2	Love Of My Life (Featuring Dave Matthews)
B00000J7J4	1	3	Put Your Lights On ( Featuring Everlast)
B00000J7J4	1	4	Africa Bamba
B00000J7J4	1	5	Smooth (Featuring Rob Thomas)
B00000J7J4	1	6	Do You Like The Way (Featuring Lauryn Hill & CEE LO)
B00000J7J4	1	7	Maria Maria (Featuring The Product G&B, Produced by Wyclef)
B00000J7J4	1	8	Migra
B00000J7J4	1	9	Corazon Espinado (Featuring Mana)
B00000J7J4	1	10	Wishing It Was (Featuring Eagle Eye Cherry)
B00000J7J4	1	11	El Farol
B00000J7J4	1	12	Primavera
B00000J7J4	1	13	The Calling (Featuring Eric Clapton)
B00000JJQK	1	1	Wouldn't It Be Nice
B00000JJQK	1	2	You Still Believe in Me
B00000JJQK	1	3	That's Not Me
B00000JJQK	1	4	Don't Talk (Put Your Head on My Shoulder)
B00000JJQK	1	5	I'm Waiting for the Day
B00000JJQK	1	6	Let's Go Away for Awhile
B00000JJQK	1	7	Sloop John B.
B00000JJQK	1	8	God Only Knows
B00000JJQK	1	9	I Know There's an Answer
B00000JJQK	1	10	Here Today
B00000JJQK	1	11	I Just Wasn't Made for These Times
B00000JJQK	1	12	Pet Sounds
B00000JJQK	1	13	Caroline, No
B00000JJQK	1	14	Hang on to Your Ego [*]
B00000K4ES	1	1	Yellow Submarine
B00000K4ES	1	2	Hey Bulldog
B00000K4ES	1	3	Eleanor Rigby
B00000K4ES	1	4	Love You To
B00000K4ES	1	5	All Together Now
B00000K4ES	1	6	Lucy In The Sky With Diamonds
B00000K4ES	1	7	Think For Yourself
B00000K4ES	1	8	Sgt. Pepper's Lonely Hearts Club Band
B00000K4ES	1	9	With A Little Help From My Friends
B00000K4ES	1	10	Baby, You're A Rich Man
B00000K4ES	1	11	Only A Northern Song
B00000K4ES	1	12	All You Need Is Love
B00000K4ES	1	13	When I'm Sixty Four
B00000K4ES	1	14	Nowhere Man
B00000K4ES	1	15	It's All Too Much
B00001R3GI	1	1	Rocks Off
B00001R3GI	1	2	Rip This Joint
B00001R3GI	1	3	Hip Shake
B00001R3GI	1	4	Casino Boogie
B00001R3GI	1	5	Tumbling Dice
B00001R3GI	1	6	Sweet Virginia
B00001R3GI	1	7	Torn & Frayed
B00001R3GI	1	8	Black Angel
B00001R3GI	1	9	Loving Cup
B00001R3GI	1	10	Happy
B00001R3GI	1	11	Turd On The Run
B00001R3GI	1	12	Ventilator Blues
B00001R3GI	1	13	Just Wanna See His Face
B00001R3GI	1	14	Let It Loose
B00001R3GI	1	15	All Down The Line
B00001R3GI	1	16	Stop Breaking Down
B00001R3GI	1	17	Shine A Light
B00001R3GI	1	18	Soul Survivor
B00001R3O9	1	1	Fox Sports Presents Game Time (TP2K Mix) - Fox Sports Presents Game Time!
B00001R3O9	1	2	It's All About The Benjamins (Rock Remix) - Puff Daddy
B00001R3O9	1	3	I Am The Bullgod - Kid Rock
B00001R3O9	1	4	We Will Rock You - Snoop Dog
B00001R3O9	1	5	Song #2 - Blur
B00001R3O9	1	6	Breathe - The Prodigy
B00001R3O9	1	7	Bow Down (Rock Is Dead Mix) - Westside Connection
B00001R3O9	1	8	Make Em Say Uhh! - Master P
B00001R3O9	1	9	(Interlude) - John Madden
B00001R3O9	1	10	Walkin' On The Sun - Smash Mouth
B00001R3O9	1	11	Fly - Sugar Ray
B00001R3O9	1	12	Bailamos - Enrique Iglesias
B00001R3O9	1	13	Super Bow Sundae - Ozomatli
B00001R3O9	1	14	(Interlude) - Terry Bradshaw
B00001R3O9	1	15	In The Zone (Ken Griffey Jr. Theme) - Ice Cube
B00001R3O9	1	16	Renegade Master (Fatboy Slim Old Skool Edit) - Wildchild
B00001R3O9	1	17	Bodyrock - Moby
B00001R3O9	1	18	Who Dat - JT Money
B00001R3O9	1	19	Stomp To My Beat - JS-16
B00001R3O9	1	20	Busy Child - Crystal Method
B00001R3O9	1	21	Ready To Go - Republica
B00001R3O9	1	22	Fox Sports Football Theme - Fox Sports Presents Game Time!
B00001R3O9	1	23	Keep On Dancin' (Let's Go) (Fox Sports Highlight Reel) - Perpetual Motion
B00002MZ41	1	1	Sound of Silence
B00002MZ41	1	2	Homeward Bound
B00002MZ41	1	3	I Am a Rock
B00002MZ41	1	4	Dangling Conversation
B00002MZ41	1	5	Scarborough Fair/Canticle
B00002MZ41	1	6	59th Street Bridge Song (Feelin' Groovy)
B00002MZ41	1	7	Hazy Shade of Winter
B00002MZ41	1	8	At the Zoo
B00002MZ41	1	9	Fakin' It [Mono Version]
B00002MZ41	1	10	Mrs. Robinson
B00002MZ41	1	11	Old Friends/Bookends
B00002MZ41	1	12	Boxer
B00002MZ41	1	13	Bridge over Troubled Water
B00002MZ41	1	14	Cecilia
B00002MZ41	1	15	Only Living Boy in New York
B00002MZ41	1	16	Song for the Asking
B00002MZ41	1	17	Condor Pasa (If I Could) - D.A Robles
B00002MZ41	1	18	For Emily, Whenever I May Find Her [Live]
B00002MZ41	1	19	America
B00002MZ41	1	20	My Little Town
B00004NRTD	1	1	Dead from the Waist Down
B00004NRTD	1	2	Londinium
B00004NRTD	1	3	Post Script
B00004NRTD	1	4	She's a Millionaire
B00004NRTD	1	5	Storm the Palace
B00004NRTD	1	6	Karaoke Queen
B00004NRTD	1	7	Bulimic Beats
B00004NRTD	1	8	Valerian
B00004NRTD	1	9	Shoot the Messenger
B00004NRTD	1	10	Nothing Hurts
B00004NRTD	1	11	Dazed, Beautiful and Bruised
B00004NRTD	1	12	Mulder and Scully [Live in Newport][*]
B00004NRTD	1	13	Nothing Hurts [Live][*]
B00004R84V	1	1	You Give Good Love
B00004R84V	1	2	Saving All My Love for You
B00004R84V	1	3	Greatest Love of All
B00004R84V	1	4	All at Once
B00004R84V	1	5	If You Say My Eyes Are Beautiful
B00004R84V	1	6	Didn't We Almost Have It All
B00004R84V	1	7	Where Do Broken Hearts Go
B00004R84V	1	8	All The Man That I Need
B00004R84V	1	9	Run To You
B00004R84V	1	10	I Have Nothing
B00004R84V	1	11	I Will Always Love You
B00004R84V	1	12	Exhale (Shoop, Shoop)
B00004R84V	1	13	Why Does It Hurt So Bad
B00004R84V	1	14	I Believe In You And Me
B00004R84V	1	15	Heartbreak Hotel (Featuring Faith Evans, & Kelly Price)
B00004R84V	1	16	My Love Is Your Love
B00004R84V	1	17	Same Script, Different Cast (Duet With Deborah Cox)
B00004R84V	1	18	Could I Have This Kiss Forever (Duet With Enrique Iglesias) (Metro Mix)
B00004R84V	2	1	Fine
B00004R84V	2	2	If I Told You That (Whitney Houston & George Michael)
B00004R84V	2	3	It's Not Right But It's Okay (Thunderpuss Mix)
B00004R84V	2	4	My Love Is Your Love (Jonathan Peters Mix)
B00004R84V	2	5	Heartbreak Hotel (Featuring Faith Evans And Kelly Price) (Hex Nector Mix)
B00004R84V	2	6	I Learned From The Best (HQ2 Mix)
B00004R84V	2	7	Step By Step (Junour Vasquez Mix)
B00004R84V	2	8	I'm Every Woman (Clivilles & Cole Mix)
B00004R84V	2	9	Queen Of The Night (CJ MacIntosh Mix)
B00004R84V	2	10	I Will Always Love You (Hex Rector Mix)
B00004R84V	2	11	Love Will Save The Day (Jellybean & David Morales Mix)
B00004R84V	2	12	I'm Your Baby Tonight (Dronez Mix)
B00004R84V	2	13	So Emotional (David Morales Mix)
B00004R84V	2	14	I Wanna Dance With Somebody (Who Loves Me) (Junior Vasquez Mix)
B00004R84V	2	15	How Will I Know (Junior Vasquez Mix)
B00004R84V	2	16	Greatest Love Of All (Juniour Vasquez Mix)
B00004R84V	2	17	One Moment In Time
B00004R84V	2	18	The Star Spangled Banner (Performed Live 1/27/91 at Super Bowl XXV)
B00004R84V	2	19	Fine
B00004R84V	2	20	If I Told You That
B00004R84V	2	21	It's Not Right But It's Okay [Thunderpuss Mix]
B00004R84V	2	22	My Love Is Your Love [Jonathan Peters Mix]
B00004R84V	2	23	Heartbreak Hotel [Hex Hector Mix] - Faith Evans
B00004R84V	2	24	I Learned from the Best [HQ2 Mix]
B00004R84V	2	25	Step by Step [Junior Vasquez Mix]
B00004R84V	2	26	I'm Every Woman [Clivilles & Cole Mix]
B00004R84V	2	27	Queen of the Night [CJ Mackintosh Mix]
B00004R84V	2	28	I Will Always Love You [Hex Hector Mix]
B00004R84V	2	29	Love Will Save the Day [Jeallybean/David Morales Mix]
B00004R84V	2	30	I'm Your Baby Tonight [Dronez Mix]
B00004R84V	2	31	So Emotional [David Morales Mix]
B00004R84V	2	32	I Wanna Dance With Somebody (Who Loves Me) [Junior Vasquez Mix]
B00004R84V	2	33	How Will I Know [Junior Vasquez Mix]
B00004R84V	2	34	Greatest Love of All [Junior Vasquez Mix]
B00004R84V	2	35	One Moment in Time
B00004R84V	2	36	Star Spangled Banner [Featuring Florida Orchestra][*]
B00004SBGD	1	1	Writing To Reach You
B00004SBGD	1	2	The Fear
B00004SBGD	1	3	As You Are
B00004SBGD	1	4	Driftwood
B00004SBGD	1	5	The Last Laugh Of The Laughter
B00004SBGD	1	6	Turn
B00004SBGD	1	7	Why Does It Always Rain On Me?
B00004SBGD	1	8	Luv
B00004SBGD	1	9	She's So Strange
B00004SBGD	1	10	Slide Show
\.

ALTER TABLE ONLY actors
    ADD CONSTRAINT actor_pkey PRIMARY KEY (id);

ALTER TABLE ONLY albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (asin);

ALTER TABLE ONLY castings
    ADD CONSTRAINT casting_pkey PRIMARY KEY (movie_id, actor_id);

ALTER TABLE ONLY countries
    ADD CONSTRAINT country_pkey PRIMARY KEY (name);

ALTER TABLE ONLY depts
    ADD CONSTRAINT dept_pkey PRIMARY KEY (id);

ALTER TABLE ONLY movies
    ADD CONSTRAINT movie_pkey PRIMARY KEY (id);

ALTER TABLE ONLY routes
    ADD CONSTRAINT route_pkey PRIMARY KEY (num, company, pos);

ALTER TABLE ONLY stops
    ADD CONSTRAINT stops_pkey PRIMARY KEY (id);

ALTER TABLE ONLY styles
    ADD CONSTRAINT styles_pkey PRIMARY KEY (album, style);

ALTER TABLE ONLY teachers
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (id);

ALTER TABLE ONLY tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (album, disk, posn);

CREATE INDEX actor_name ON actors USING btree (name);

CREATE INDEX casting_actor ON castings USING btree (actor_id);

CREATE INDEX casting_movie ON castings USING btree (movie_id);

CREATE INDEX casting_ord ON castings USING btree (ord);

CREATE INDEX movie_title ON movies USING btree (title);

CREATE INDEX teacher_dept ON teachers USING btree (dept_id);

ALTER TABLE ONLY castings
    ADD CONSTRAINT casting_actorid_fkey FOREIGN KEY (actor_id) REFERENCES actors(id);

ALTER TABLE ONLY castings
    ADD CONSTRAINT casting_movieid_fkey FOREIGN KEY (movie_id) REFERENCES movies(id);

ALTER TABLE ONLY movies
    ADD CONSTRAINT movie_director_fkey FOREIGN KEY (director_id) REFERENCES actors(id);

ALTER TABLE ONLY routes
    ADD CONSTRAINT route_stop_fkey FOREIGN KEY (stop_id) REFERENCES stops(id);

ALTER TABLE ONLY styles
    ADD CONSTRAINT styles_album_fkey FOREIGN KEY (album) REFERENCES albums(asin);

ALTER TABLE ONLY teachers
    ADD CONSTRAINT teacher_dept_fkey FOREIGN KEY (dept_id) REFERENCES depts(id);

ALTER TABLE ONLY tracks
    ADD CONSTRAINT tracks_album_fkey FOREIGN KEY (album) REFERENCES albums(asin);

REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

