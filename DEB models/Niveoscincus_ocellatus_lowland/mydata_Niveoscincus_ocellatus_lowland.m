%% mydata_my_pet
% Sets referenced data

%%
function [data, txt_data, metadata] = mydata_Niveoscincus_ocellatus_lowland 
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
metadata.species    = 'Niveoscincus_ocellatus'; 
metadata.species_en = 'Ocellated Skink'; 
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

% age 0 is at onset of embryo development
data.ab = 92;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Caldwell_unpub';    
  temp.ab = T_C + 19.5;  bibkey.ab = 'Caldwell_unpub'; % K, temperature, based on ;
  % observed age at birth is frequently larger than ab, because of diapauzes during incubation
data.ap = data.ab+1*365;     units.ap = 'd';    label.ap = 'age at puberty';              bibkey.ap = 'Caldwell_unpub';
  temp.ap = T_C + 18.88;  bibkey.ap = 'Caldwell_unpub'; % K, temperature, based on simulation of Tb from 2000-2013 at Orford, see last lines of Niveoscincus_ocellatus_lowland traits.R;; 
  % observed age at puberty is frequently larger than ap, 
  %   because allocation to reproduction starts before first eggs appear
data.am = 13*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Caldwell_unpub';   
  temp.am = T_C + 18.88;  bibkey.am = 'Caldwell_unpub'; % K, temperature, based on simulation of Tb from 2000-2013 at Orford, see last lines of Niveoscincus_ocellatus_lowland traits.R;; 
% (accounting for aging only) 

% Please specify what type of length measurement is used for your species.
% We put here snout-to-vent length, but you should change this depending on your species:
data.Lb  = 2.962;   units.Lb  = 'cm';   label.Lb  = 'snout to vent length at birth';    bibkey.Lb  = 'Caldwell_unpub';
data.Lp  = 5.0;   units.Lp  = 'cm';   label.Lp  = 'snout to vent length at puberty';  bibkey.Lp  = 'Caldwell_unpub';
%svl at puberty is recorded as 5.4 - I assume we lowered the value to 5.0 to better fit the model as it is likely 5.4 overestimates svl at puberty? 
data.Li  = 7.3;   units.Li  = 'cm';   label.Li  = 'ultimate snout to vent length';    bibkey.Li  = 'Caldwell_unpub';
data.Wdb = 0.55*0.3; units.Wdb = 'g';    label.Wdb = 'dry weight at birth';              bibkey.Wdb = 'Caldwell_unpub';
data.Wdp = 3.0*0.3;   units.Wdp = 'g';    label.Wdp = 'dry weight at puberty';            bibkey.Wdp = 'Caldwell_unpub';
data.Wdi = 7.1*0.3;   units.Wdi = 'g';    label.Wdi = 'ultimate dry weight';              bibkey.Wdi = 'Caldwell_unpub';
data.Ri  = 5/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';              bibkey.Ri  = 'Caldwell_unpub';   
  % for an individual of ultimate length Li 
  temp.Ri = T_C +  18.88;  bibkey.Ri = 'Caldwell_unpub'; % K, temperature, based on simulation of Tb from 2000-2013 at Orford, see last lines of Niveoscincus_ocellatus_lowland traits.R; 
 
% uni-variate data

% uni-variate data at f = 1.0 (this value should be added in pars_init_my_pet as a parameter f_tL) 
% snout-to-vent length and wet weight were measured at the same time
data.tL = [0  0	30.5	61	61	305	335.5	335.5	366	366	427	427	732	732	762.5	884.5	1037	1037	1037	1067.5	1098	1128.5	1250.5	1372.5	1372.5	1372.5	1403	1403	1616.5	1738.5	1769	1769	1769	1860.5	2135	2196	2196	2196	2562	2562	2928	2928;    % d, time since birth
           2.9	3	3.6	3.3	3.4	4.9	4.1	4.6	4	4.2	4.5	4.7	5.1	5.3	5.6	6.2	5.7	5.9	6.2	6.5	6.2	5.7	5.9	5.7	6.1	6.5	6.3	6.4	5.8	6.4	6	6.5	7	6.6	6.5	6.2	6.3	6.5	6.5	6.6	6.6	6.8]';  % cm, snout-to-vent length at f and T
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'snout to vent length'};  bibkey.tL = 'Caldwell_unpub';
  temp.tL = T_C + 17.7;  % K, temperature

data.LW = [2.835  2.824	2.818	2.82	2.79	2.761	2.79	2.985	2.879	2.755	2.915	2.834	2.823	2.869	2.903	2.835	2.86	2.73	2.73	2.845	2.86	2.75	2.895	2.821	2.879	2.753	3.017	2.921	2.915	2.92	2.842	2.836	2.918	2.989	2.899	2.938	2.825	2.991	2.919	2.926	2.958	2.869	2.873	2.927	2.948	3.016	2.918	2.87	2.926	2.947	2.86	2.952	2.916	2.99	2.954	2.993	2.902	2.976	2.821	2.922	2.906	2.861	3.024	3.061	2.917	2.969	3.022	2.943	2.988	2.959	2.773	2.943	3.003	2.997	2.903	2.96	2.886	3.01	2.981	2.922	2.952	3.027	3.02	3.024	2.986	2.919	2.92	2.957	3.12	2.959	2.938	2.925	2.879	2.951	3.04	2.854	3.084	2.93	2.942	2.909	3.056	2.978	3.001	2.975	2.898	2.994	2.97	3.077	3.09	2.968	3.05	2.949	2.885	2.968	2.988	2.987	3.045	3.023	2.913	2.975	2.97	3.126	3.01	3.166	3.032	2.999	2.931	3.13	3.045	3.087	3.018	2.935	2.94	2.94	2.895	3.08	3	2.955	2.902	3.049	2.879	2.908	3.032	2.944	2.973	3.026	3.05	3.043	2.966	2.957	3.02	2.987	2.992	3.112	2.967	2.983	2.921	3.042	2.996	2.978	3.065	2.986	2.969	3.075	3.04	3.033	2.998	3.154	2.965	3.11	3.168	3.008	3.078	2.925	3.13	3.106	2.962	3.098	3.109	3.075	3.21	3.04	3.045	3.024	3.06	3.023	2.905	3.114	3.112	2.94	3.123	3.122	3.138	3.288	5.5	6.1	5.5	5.9	5.7	6	6.3	5.9	5.9	5.8	5.8	5.8	6	6.1	5.9	6	5.7	5.9	5.9	6.3	6	6.2	6.7	6.1	5.9	5.9	6.1	5.9	5.9	6	6.1	6	6.7	6.2	6	5.6	6.4	5.8	5.8	6.1	6.3	6.1	6.2	5.5	6.1	6.3	5.9	5.7	6	6.3	6.5	6.2	6	5.8	6.1	6.4	6.1	6	6	6.2	6.3	6	6.5	6	5.8	5.8	6.4	6.1	6.3	6	6.2	5.7	5.7	6	6.3	6.5	6.3	5.9	5.9	6.1	6.2	6.4	6.2	5.9	6.6	6	6.1	5.8	5.5	5.6	5.9	5.9	6.1	6.2	6.1	5.8	6.1	6.5	6.1	5.7	6	6.1	6.2	6	6.1	6	6.1	6.3	6.1	5.8	6.4	6.7	6.3	6.4	6.2	7	6	6.3	6.8	6.1	6.2	6.2	6.4	6.3	6.7	6.4	6.4	6.2	6.5	6.1	6.3	6.2	6	7	5.9	6.2	6	6.3	6.4	6.5	6.4	6.3	6.1	6.5	5.9	6.2	6.2	6.5	6.3	6.4	6.3	6.4	6.1	6.5	6.5	6.6	6.3	6.6	6.1	6.3	6.4	6.6	6.3	6.8	5.8	6.6	6.2	6	6.3	6.4	6.7	6.9	6.2	6.2	6.1	6.3	6.5	6.9	6.2	6.3	6.2	6.1	6.6	6.1	6.6	6.1	5.7	6.2	6.2	6.3	6.6	6.3	6.2	6.4	6.5	6.2	6.8	6.3	6.8	6.4	6.3	6.4	6.4	6.7	6.8	6.4	6.4	6.3	6.2	6.7	6.5	6.4	7	6.5	6.3	6.5	6.4	6.7	6.5	6.3	6.4	6.7	6.4	6.4	6.9	6.5	6.3	6.4	6.6	6.5	6.3	6.5	6.3	7	6.1	6.4	6.4	6	6.2	6	6.5	6.5	6.7	6.3	6.4	6.4	6.7	6.2	6.8	6.2	6.9	6.7	6.2	6.4	5.6	6.4	6.5	6.3	6.5	7	6.3	6.5	6.4	6.1	6.4	6.3	6.6	6.6	6.4	5.8	6.3	6.5	6.9	6.4	6.5	6.8	6.6	7	6.4	6.6	6.5	6.8	6.3	6.9	6.9	6.5	6.5	6.8	6.3	6.5	6.4	6.7	6.6	6.8	6.2	6.2	6.7	6.6	6	6.8	6.5	6.5	6.8	7	6.5	6.6	6.9	6.5	6.5	6.5	6.5	7.3	6.7	6.7	6.8	6.8	6.5	6.2	6.7	6.5	6.3	6.9	6.6	6.7	6.1	6.9	6.7	6.4	6.5	6.7	6.8	6.6	6.6	6.7	6.1	6	7	6.9	6.8	6.4	6.8	6.4	6.5	6	6.8	6.7	7	6.9	7.3	6.8	6.8	6.5	7	6.8	7	6.7	6.8	7.2	6.5	7	7	6.4	6.8	6.5	6.2	7	6.8	6.9;      % cm, snout-to-vent length at f
           0.3629  0.403	0.4046	0.4258	0.4382	0.4431	0.4431	0.4436	0.4479	0.4496	0.4508	0.4544	0.4636	0.464	0.4643	0.4647	0.4647	0.466	0.466	0.4669	0.4709	0.4719	0.4727	0.4738	0.4752	0.476	0.4769	0.4771	0.4781	0.4804	0.4814	0.4818	0.4824	0.4828	0.483	0.484	0.4842	0.4851	0.49	0.493	0.493	0.4961	0.497	0.5016	0.5024	0.503	0.5044	0.5064	0.5065	0.5073	0.508	0.5082	0.5083	0.5096	0.5124	0.5129	0.5134	0.5148	0.5149	0.515	0.5157	0.516	0.5163	0.5165	0.5167	0.5171	0.5171	0.5176	0.5181	0.5183	0.5195	0.5199	0.5206	0.5216	0.5224	0.5232	0.5233	0.5244	0.5267	0.5274	0.5279	0.5284	0.5294	0.5298	0.53	0.5308	0.531	0.5324	0.5332	0.5339	0.5349	0.535	0.5355	0.5366	0.5375	0.5383	0.5387	0.5402	0.5402	0.5403	0.5407	0.5422	0.5439	0.544	0.5445	0.5468	0.547	0.5474	0.549	0.5496	0.5499	0.5519	0.553	0.5548	0.5576	0.5577	0.5587	0.5588	0.5592	0.5604	0.5611	0.5611	0.5621	0.5643	0.5645	0.5648	0.5653	0.5663	0.5665	0.5672	0.5674	0.5676	0.5687	0.5687	0.5696	0.5705	0.5706	0.5708	0.5715	0.5724	0.574	0.575	0.5778	0.5785	0.5786	0.5799	0.5825	0.5827	0.5847	0.5852	0.5855	0.5887	0.5888	0.5906	0.5918	0.5918	0.5919	0.5936	0.5968	0.5989	0.6004	0.6007	0.6015	0.6025	0.6036	0.6038	0.6044	0.605	0.6068	0.6092	0.6125	0.6146	0.6168	0.6183	0.6196	0.6228	0.6229	0.6269	0.6302	0.6313	0.6358	0.6373	0.64	0.6441	0.6458	0.6515	0.652	0.6629	0.6777	0.6858	0.6892	0.7114	0.7208	0.783	2.9745	3.1318	3.2	3.3053	3.32	3.3231	3.3671	3.3773	3.3831	3.3996	3.4205	3.483	3.4874	3.4895	3.4899	3.5304	3.5611	3.5833	3.6703	3.6758	3.6869	3.7077	3.748	3.7594	3.7651	3.777	3.7874	3.8023	3.8027	3.8061	3.8125	3.8227	3.8352	3.8501	3.886	3.8863	3.891	3.9012	3.934	3.9388	3.9576	3.9649	3.9987	3.9991	4.0201	4.032	4.0327	4.0623	4.0671	4.0739	4.0808	4.092	4.0979	4.1013	4.1018	4.106	4.109	4.1115	4.1138	4.1316	4.151	4.1658	4.1688	4.1765	4.1861	4.1874	4.1966	4.2037	4.2132	4.2296	4.2366	4.2486	4.2739	4.284	4.2894	4.3011	4.3042	4.3144	4.3192	4.3211	4.3241	4.3262	4.3345	4.3466	4.3469	4.3726	4.3787	4.38	4.3802	4.3895	4.39	4.3912	4.41	4.41	4.416	4.4174	4.44	4.4546	4.4596	4.4613	4.468	4.4687	4.476	4.48	4.4815	4.4901	4.495	4.4965	4.5051	4.5097	4.51	4.5111	4.5133	4.519	4.54	4.5516	4.554	4.6037	4.6061	4.6086	4.6138	4.6138	4.618	4.6212	4.6337	4.635	4.6418	4.6428	4.6463	4.6527	4.6585	4.667	4.6756	4.678	4.68	4.68	4.7053	4.7071	4.7091	4.7098	4.7135	4.7227	4.7292	4.7337	4.7352	4.737	4.75	4.76	4.7688	4.7779	4.7852	4.8051	4.8063	4.832	4.8336	4.8386	4.8397	4.84	4.8471	4.85	4.8528	4.8561	4.8628	4.8701	4.8848	4.8869	4.8899	4.8926	4.8968	4.91	4.9263	4.9266	4.9275	4.93	4.9404	4.943	4.95	4.9583	4.9592	4.9609	4.9664	4.9768	4.9905	4.9973	5.0011	5.0102	5.0315	5.0389	5.0499	5.0581	5.061	5.0637	5.065	5.0713	5.0724	5.0758	5.0801	5.0827	5.0867	5.0896	5.0898	5.0903	5.0931	5.108	5.1141	5.1164	5.118	5.1317	5.1331	5.141	5.1525	5.1608	5.164	5.1667	5.17	5.1739	5.219	5.2219	5.229	5.259	5.2679	5.2715	5.2754	5.28	5.307	5.3184	5.3194	5.32	5.329	5.3292	5.3308	5.3329	5.3489	5.35	5.3517	5.3639	5.3712	5.38	5.3815	5.3819	5.383	5.3843	5.39	5.4003	5.4136	5.4174	5.4193	5.4205	5.43	5.436	5.437	5.4376	5.4506	5.4615	5.4683	5.4746	5.477	5.4786	5.4858	5.4927	5.4952	5.4998	5.5115	5.5138	5.5155	5.5226	5.53	5.53	5.5402	5.542	5.5455	5.549	5.569	5.574	5.5828	5.607	5.61	5.616	5.6178	5.6206	5.621	5.6542	5.6562	5.6994	5.7	5.7112	5.7156	5.7242	5.7244	5.73	5.7502	5.7687	5.775	5.7782	5.8089	5.8237	5.8258	5.8273	5.8341	5.8384	5.8393	5.852	5.858	5.8636	5.8836	5.8862	5.9061	5.9175	5.9364	5.9366	5.9388	5.9501	5.9735	5.9737	6.007	6.0104	6.0114	6.013	6.0162	6.0178	6.0291	6.0558	6.0564	6.0721	6.0791	6.0826	6.0911	6.1428	6.203	6.2291	6.2519	6.2542	6.264	6.3102	6.3148	6.3172	6.32	6.35	6.3528	6.3765	6.3832	6.3934	6.4069	6.4914	6.5057	6.5659	6.5898	6.6078	6.619	6.6373	6.6639	6.682	6.6882	6.7865	6.8093	6.84	6.852	6.8704	6.8841	6.9203	7.0219	7.029	7.0899	7.2795	7.2916	7.3146	7.4294	7.6508]';   % g, wet weight at f and T
units.LW = {'cm', 'g'};     label.LW = {'time since birth', 'wet weight'};  bibkey.LW = 'Caldwell_unpub';

 data.TO = [ ... temp (C), O2 consumption (ml/h.gwet) of 2.87 g wet weight (0.86 g dry), based on 10th percentile of Mandy's data
8	0.02780458
9	0.03049981
10	0.0212313
11	0.02379942
12	0.02292096
13	0.0260858
14	0.02509908
15	0.03468672
16	0.05028846
17	0.04796786
18	0.05455975
19	0.07156085
20	0.0796292
21	0.08045851
22	0.09173029
23	0.10476782
24	0.11284453
25	0.11689254
26	0.1398726
27	0.14346611
28	0.16273635
29	0.14157626
30	0.20413891
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
weight.ab = 100*weight.ab;


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
pt2 = 'Kearney: TA was estimated from Yuni''s unpublished data on sprint speed (/sprint speed/sprint_speed_N_occelatus_Yuni.csv), using script /sprint speed/TA from sprint speed.R';
pt3 = 'Kearney: metabolic rates were extracted from Caldwell''s measurements of short-term (hours) dynamics of metabolic rate under ramping temperature, using only the ramping down temperatures and taking the 10th percentile to capture the indviduals closest to resting, which were in close agreement with Andrews and Pough''s general equation for squamate metabolic rate, see script /Niveoscincus/metabolic rates/mrate_analysis.R ';     
pt4 = 'Kearney: Temperatures for ';     
metadata.discussion = {pt1; pt2; pt3; pt4};
