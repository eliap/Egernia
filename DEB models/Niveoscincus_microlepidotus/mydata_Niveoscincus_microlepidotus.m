%% mydata_my_pet
% Sets referenced data

%%
function [data, txt_data, metadata] = mydata_Niveoscincus_microlepidotus 
  % created by Starrlight Augustine, Bas Kooijman, Dina Lika, Goncalo Marques and Laure Pecquerie 2015/03/31
  
  %% Syntax
  % [data, txt_data, metadata] = <../mydata_my_pet.m *mydata_my_pet*>
  
  %% Description
  % Sets data, pseudodata, metadata, explanatory text, weight coefficients.
  % Meant to be a template in add_my_pet
  %
  % Output
  %
  % * data: structure with data
  % * txt_data: text vector for the presentation of results
  % * metadata: structure with info about this entry
  
  %% To do (remove these remarks after editing this file)
  % * copy this template; replace 'my_pet' by the name of your species
  % * fill in metadata fields with the proper information
  % * insert references for the data (an example is given)
  % * edit fact-list for your species, where you can add species and/or data properties
  % * edit real data; remove all data that to not belong to your pet
  % * complete reference list
  % * OPTIONAL : add discussion points / comments before the reference list

%% set metadata

T_C = 273.15; % K, temperature at 0 degrees C (used in T_typical)

metadata.phylum     = 'Chordata'; 
metadata.class      = 'Reptilia'; 
metadata.order      = 'Squamata'; 
metadata.family     = 'Scincidae';
metadata.species    = 'Niveoscincus_microlepidotus'; 
metadata.species_en = 'Southern Snow Skink'; 
metadata.T_typical  = T_C + 17.7; % K
metadata.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'};  % tags for different types of zero-variate data
metadata.data_1     = {'t-L', 'L-W', 'T_O'}; % tags for different types of uni-variate data

metadata.COMPLETE = 2.5; % using criteria of LikaKear2011

metadata.author   = {'Michael Kearney', 'Mandy Caldwell', 'Erik Wapstra'};                              % put names as authors as separate strings:  {'author1','author2'} , with corresponding author in first place 
metadata.date_acc = [2015 04 20];                             % [year month day], date of entry is accepted into collection
metadata.email    = {'mrke@unimelb.edu.au'};                   % e-mail of corresponding author
metadata.address  = {'School of BioSciences, The University of Melbourne, 3010, Australia'};        % affiliation, postcode, country of the corresponding author

% uncomment and fill in the following fields when the entry is updated:
% metadata.author_mod_1  = {'author2'};                       % put names as authors as separate strings:  {'author1','author2'} , with corresponding author in first place 
% metadata.date_mod_1    = [2017 09 18];                      % [year month day], date modified entry is accepted into the collection
% metadata.email_mod_1   = {'myname@myuniv.univ'};            % e-mail of corresponding author
% metadata.address_mod_1 = {'affiliation, zipcode, country'}; % affiliation, postcode, country of the corresponding author

%% set data
% zero-variate data;
% typically depend on scaled functional response f.
% here assumed to be equal for all real data; the value of f is specified in pars_init_my_pet.

% age 0 is at onset of embryo development. 
data.ab = 365;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Caldwell_unpub';    
  temp.ab = T_C + 19.5;  bibkey.ab = 'Caldwell_unpub'; % K, temperature, based on ;
  % observed age at birth is frequently larger than ab, because of diapauzes during incubation. Range in age at birth is about 330 - 450 days (Olsson and Shine, 1999). Average is provided (365, Girling and Jones, 2005).
data.ap = data.ab+3*365;     units.ap = 'd';    label.ap = 'age at puberty';              bibkey.ap = 'Caldwell_unpub';
  % reproductive maturity is estimated to occur at 3- 4 years of age (Olsson et al., 2001), 
  temp.ap = T_C + 18.88;  bibkey.ap = 'Caldwell_unpub'; % K, temperature, based on simulation of Tb from 2000-2013 at Orford, see last lines of Niveoscincus_ocellatus_lowland traits.R;; 
  % observed age at puberty is frequently larger than ap, 
  %   because allocation to reproduction starts before first eggs appear
data.am = 13*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Caldwell_unpub';   
  temp.am = T_C + 18.88;  bibkey.am = 'Caldwell_unpub'; % K, temperature, based on simulation of Tb from 2000-2013 at Orford, see last lines of Niveoscincus_ocellatus_lowland traits.R;; 
% (accounting for aging only) 

% Please specify what type of length measurement is used for your species.
% We put here snout-to-vent length, but you should change this depending on your species:
data.Lb  = 2.8;   units.Lb  = 'cm';   label.Lb  = 'snout to vent length at birth';    bibkey.Lb  = 'Caldwell_unpub';
data.Lp  = 5.1;   units.Lp  = 'cm';   label.Lp  = 'snout to vent length at puberty';  bibkey.Lp  = 'Caldwell_unpub';
data.Li  = 6.9;   units.Li  = 'cm';   label.Li  = 'ultimate snout to vent length';    bibkey.Li  = 'Caldwell_unpub';
data.Wdb = 0.36*0.3; units.Wdb = 'g';    label.Wdb = 'dry weight at birth';              bibkey.Wdb = 'Caldwell_unpub';
data.Wdp = 2.531*0.3;   units.Wdp = 'g';    label.Wdp = 'dry weight at puberty';            bibkey.Wdp = 'Caldwell_unpub';
%dry wweight at puberty estimated by finding proportion difference in asymptotic sizes between ocellatus and micro, multiplying by ocellatus wet weight at puberty. e.g. (5.99/7.1)*3 = 2.531
data.Wdi = 5.99*0.3;   units.Wdi = 'g';    label.Wdi = 'ultimate dry weight';              bibkey.Wdi = 'Caldwell_unpub';
data.Ri  = 5/730;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';              bibkey.Ri  = 'Caldwell_unpub';   
  % for an individual of ultimate length Li 
  temp.Ri = T_C +  18.88;  bibkey.Ri = 'Caldwell_unpub'; % K, temperature, based on simulation of Tb from 2000-2013 at Orford, see last lines of Niveoscincus_ocellatus_lowland traits.R; 
 
% uni-variate data

% uni-variate data at f = 1.0 (this value should be added in pars_init_my_pet as a parameter f_tL) 
% snout-to-vent length and wet weight were measured at the same time. This is from ocellatus, not micro.
data.tL = []';  % cm, snout-to-vent length at f and T
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'snout to vent length'};  bibkey.tL = 'Caldwell_unpub';
  temp.tL = T_C + 17.7;  % K, temperature

%do not have data for micro.I have a growth coefficient: 1.375. This is for surviving highland offspring released at high elevations. From: Olsson and Shine 2002 Evolution Growth to death in Lizards Figure 2.
data.LW = [;      % cm, snout-to-vent length at f
           ]';   % g, wet weight at f and T
units.LW = {'cm', 'g'};     label.LW = {'time since birth', 'wet weight'};  bibkey.LW = 'Caldwell_unpub';

%used cooling (ramping down) temperature for metabolic rates below, baseline
 data.TO = [ ... temp (C), O2 consumption (ml/h.gwet) of 4.16 g wet weight (1.39 g dry), based on 10th percentile of Mandy's data
8  0.07287053
9  0.0667237
10	0.05269695
11	0.03597983
12	0.03332057
13	0.02019122
14	0.01409753
15	0.02329151
16	0.02390791
17	0.02935731
18	0.03173851
19	0.033
20	0.0438
21	0.0654
22	0.08212784
23	0.09823614
24	0.11163079
25	0.12164581
26	0.1213049
27	0.12842377
28	0.13986127
29	0.19142226
30	0.30037792
];
units.TO = {'mlO2/gwet/min', 'C'};     label.TO = {'O2 consumption rate', 'temperature'};  bibkey.TO = 'Caldwell_unpub';


%% set weights for all real data
weight = setweights(data, []);

%% overwriting weights (remove these remarks after editing the file)
% the weights were set automatically with the function setweigths,
% if one wants to ovewrite one of the weights it should always present an explanation example:
%
% zero-variate data:
% weight.Wdi = 100 * weight.Wdi; % Much more confidence in the ultimate dry
%                                % weight than the other data points
weight.Ri = 100*weight.Ri;
weight.Wdb = 10*weight.Wdb;
weight.Wdp = 10*weight.Wdp;
weight.Wdi = 10*weight.Wdi;
 weight.ap = 100*weight.ap;
% data.ab = 20*data.ab;
% data.Lp = 100*data.Lp;

% uni-variate data: 
% weight.LW = .1 * weight.LW;

%% set pseudodata and respective weights
% (pseudo data are in data.psd and weights are in weight.psd)
[data, units, label, weight] = addpseudodata(data, units, label, weight);

%% overwriting pseudodata and respective weights (remove these remarks after editing the file)
% the pseudodata and respective weights were set automatically with the function setpseudodata
% if one wants to ovewrite one of the values it should always present an explanation
% example:
% data.psd.p_M = 1000;                    % my_pet belongs to a group with high somatic maint 
% weight.psd.kap = 10 * weight.psd.kap;   % I need to give this pseudo data a higher weight

%% pack data and txt_data for output
data.weight = weight;
data.temp = temp;
txt_data.units = units;
txt_data.label = label;
txt_data.bibkey = bibkey;

%% References
  bibkey = 'Wiki'; type = 'Misc'; bib = ...
  'URL = {http://en.wikipedia.org/wiki/Niveoscincus_ocellatus}';   % replace my_pet by latin species name
  eval(['metadata.biblist.' bibkey, '= ''@', type, '{', bibkey, ', ' bib, '}'';']);
  %
  bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
  'author = {Kooijman, S.A.L.M.}, ' ...
  'year = {2010}, ' ...
  'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
  'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
  'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
  'URL = {http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}'];
  eval(['metadata.biblist.' bibkey, '= ''@', type, '{', bibkey, ', ' bib, '}'';']);
  %
  bibkey = 'Caldwell_unpub'; type = 'Thesis'; bib = [ ... % meant as example; replace this and further bib entries
  'author = {Caldwell, M. and Wapstra, E.}, ' ... 
  'year = {2015}, ' ...
  'title = {TBA}'];
  eval(['metadata.biblist.' bibkey, '= ''@', type, '{', bibkey, ', ' bib, '}'';']);
  %
  bibkey = 'Anon2015'; type = 'Misc'; bib = [ ...
  'author = {Anonymous}, ' ...
  'year = {2015}, ' ...
  'URL = {http://www.fishbase.org/summary/Rhincodon-typus.html}'];
  eval(['metadata.biblist.' bibkey, '= ''@', type, '{', bibkey, ', ' bib, '}'';']);

%% Facts
% * Standard model with egg (not foetal) development and no acceleration
  
%% Discussion points
pt1 = 'Kearney: there is a github repository for this project git/mrke/Niveoscincus/';
pt2 = 'Caldwell: TA was estimated from Caldwells unpublished data on metabolic rate and compared with Yunis unpublished data for ocellatus on sprint speed (/sprint speed/sprint_speed_N_occelatus_Yuni.csv), using script /sprint speed/TA from sprint speed.R';
pt3 = 'Kearney: metabolic rates were extracted from Caldwells measurements of short-term (hours) dynamics of metabolic rate under ramping temperature, using only the ramping down temperatures and taking the 10th percentile to capture the indviduals closest to resting, which were in close agreement with Andrews and Pough''s general equation for squamate metabolic rate, see script /Niveoscincus/metabolic rates/mrate_analysis.R ';     
pt4 = 'Kearney: Temperatures for ';     
metadata.discussion = {pt1; pt2; pt3; pt4};
