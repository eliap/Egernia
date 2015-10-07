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
metadata.species    = 'Niveoscincus_metallicus'; 
metadata.species_en = 'Metallic Skink'; 
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
data.ab = 98;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Caldwell_unpub';    
  temp.ab = T_C + 19.5;  bibkey.ab = 'Caldwell_unpub'; % K, temperature, based on ;
  % observed age at birth is frequently larger than ab, because of diapauzes during incubation
data.ap = data.ab+490;     units.ap = 'd';    label.ap = 'age at puberty';              bibkey.ap = 'Caldwell_unpub';
  temp.ap = T_C + 18.88;  bibkey.ap = 'Caldwell_unpub'; % K, temperature, based on simulation of Tb from 2000-2013 at Orford, see last lines of Niveoscincus_ocellatus_lowland traits.R;; 
  % observed age at puberty is frequently larger than ap, 
  %   because allocation to reproduction starts before first eggs appear
data.am = 12*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Caldwell_unpub';   
  temp.am = T_C + 18.88;  bibkey.am = 'Caldwell_unpub'; % K, temperature, based on simulation of Tb from 2000-2013 at Orford, see last lines of Niveoscincus_ocellatus_lowland traits.R;; 
% (accounting for aging only) 

% Please specify what type of length measurement is used for your species.
% We put here snout-to-vent length, but you should change this depending on your species:
data.Lb  = 2.3;   units.Lb  = 'cm';   label.Lb  = 'snout to vent length at birth';    bibkey.Lb  = 'Caldwell_unpub';
data.Lp  = 4.3;   units.Lp  = 'cm';   label.Lp  = 'snout to vent length at puberty';  bibkey.Lp  = 'Caldwell_unpub';
data.Li  = 6.6;   units.Li  = 'cm';   label.Li  = 'ultimate snout to vent length';    bibkey.Li  = 'Caldwell_unpub';
data.Wdb = 0.244*0.3; units.Wdb = 'g';    label.Wdb = 'dry weight at birth';              bibkey.Wdb = 'Caldwell_unpub';
data.Wdp = 1.93*0.3;   units.Wdp = 'g';    label.Wdp = 'dry weight at puberty';            bibkey.Wdp = 'Caldwell_unpub';
%dry weight at puberty estimated by finding proportion difference in asymptotic sizes between ocellatus and metallicus, multiplying by ocellatus wet weight at puberty. e.g. (4.56/7.1)*3 = 1.93
data.Wdi = 4.56*0.3;   units.Wdi = 'g';    label.Wdi = 'ultimate dry weight';              bibkey.Wdi = 'Caldwell_unpub';
data.Ri  = 6/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';              bibkey.Ri  = 'Caldwell_unpub';   
  % for an individual of ultimate length Li 
  temp.Ri = T_C +  18.88;  bibkey.Ri = 'Caldwell_unpub'; % K, temperature, based on simulation of Tb from 2000-2013 at Orford, see last lines of Niveoscincus_ocellatus_lowland traits.R; 
 
% uni-variate data

% uni-variate data at f = 1.0 (this value should be added in pars_init_my_pet as a parameter f_tL) 
% snout-to-vent length and wet weight were measured at the same time. This is from metallicus at Clarendon, Hobart, Mt Wellington and Orford. From McCoull 2001 Thesis.
data.tL = [1075  2175	1805	1810	1810	2171	2531	1904	1445	3247	2887	2892	1810	4343	2180	2499	3248	3603	2892	2527	3248	3585	3346	2887	3252	1129	738	736	1087	1089	1454	1059	1454	1087	1815	1459	1087	1455	1455	2176	1747	2571	1815	2534	2894	3264	1818	1815	2178	2534	3262	1084	1080	1452	1457	1815	1815	1815	1452	2180	2538	1820	1452	1820	2536	2183	2531	2894	3622	2183	2897	2178	3620	3992	639	735	733	1453	1084	611	1081	1842	1456	1051	1084	1814	1481	1425	1811	1453	2172	2530	1814	1329	2570;    % d, time since birth
           4.8  5.1	5.1	5.4	5.4	5.5	5.5	5.5	5.5	5.5	5.6	5.6	5.6	5.6	5.6	5.7	5.7	5.8	5.8	5.8	5.8	6	6	6	6.1	4.7	4.8	4.9	4.9	5	5.1	5.1	5.2	5.2	5.3	5.4	5.4	5.4	5.6	5.6	5.6	5.6	5.7	5.7	5.7	5.7	5.8	5.9	6	6	6.1	4.8	4.9	5.1	5.2	5.2	5.3	5.4	5.4	5.5	5.5	5.5	5.6	5.7	5.7	5.8	5.8	5.8	5.8	5.9	5.9	6	6.3	6.5	4.8	4.8	5	5.1	5.1	5.2	5.3	5.4	5.4	5.5	5.5	5.5	5.7	5.7	5.7	5.9	5.9	5.9	5.9	6	6.3]';  % cm, snout-to-vent length at f and T
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'snout to vent length'};  bibkey.tL = 'Caldwell_unpub';
  temp.tL = T_C + 17.7;  % K, temperature

%following data is from ocellatus. Don't have mass - svl data for metallicus.
data.LW = [2.785	2.967	2.783	2.872	2.784	2.93	2.825	2.903	2.859	2.938	2.866	2.94	3.041	2.923	2.893	3.014	2.897	3.01	2.917	2.935	2.984	2.898	2.886	2.837	2.959	2.89	2.867	2.992	2.892	3.044	2.947	2.835	3.027	2.888	3.081	2.969	3.002	2.982	2.989	2.822	2.834	2.954	2.881	2.98	2.936	2.959	3.05	3	3.031	2.966	2.984	2.915	2.996	2.98	3.077	2.909	2.966	2.953	2.95	3.011	2.949	2.971	3.055	3.016	3.057	2.978	2.99	2.994	2.965	2.989	2.979	3.013	2.96	3.06	3.113	3.063	2.939	2.972	2.954	3.059	3.034	2.994	3.061	3.03	3.01	3.065	3.052	3.046	3.001	3.035	3.068	3.032	3.177	2.992	2.975	2.934	2.978	2.995	3.032	2.959	3.119	3.047	3.032	2.955	3.039	2.878	3.055	3.003	3.052	3.041	3.05	3.009	2.919	3.039	3.079	3.031	2.992	3.001	2.921	2.926	3.06	2.997	3.008	3.101	2.95	2.98	3.093	2.953	3.075	3.061	3.047	3.157	2.986	3.018	2.893	3.066	3.051	3.152	2.977	3.152	3.044	3.12	3.014	3.079	3.051	3.101	3.134	2.972	3.041	3.055	2.947	3.054	3.014	3.083	2.966	3.042	3.015	3.138	3.035	3.004	2.971	3.146	3.082	3.046	3.02	3.119	3.065	3.064	3.059	3.025	2.998	3.05	3.095	3.009	3.056	3.109	3.125	3.094	3.138	3.1	3.052	3.098	3.054	2.985	3.097	2.981	3.072	3.056	3.032	3.064	3.084	2.94	3.025	3.194	3.086	3.121	3.169	3.006	3.094	3.054	3.09	3.054	3.12	3.149	3.085	3.142	3.111	3.11	3.156	3.15	3.082	3.134	3.055	3.166	3.09	3.102	3.16	3.054	3.03	3.05	3.206	3.145	3.18	3.13	3.16	3.165	3.202	3.243	3.224	3.241	3.068	3.007	3.1	6.4	6.6	7	6.1	6.5	6.7	6.6	6.5	7.6	6.3	6.8	7.2	7	7.2	7.1	6.8	7.3	6.8	6.9	7.2	6.7	7.3	7.4	7.2	6.8	6.8	7.2	7	7	7.3	7.4	7.5	7	7	7	6.9	7.2	7	6.7	7	6.8	7.2	7	6.8	6.8	7.2	7	6.8	7.2	7.1	7.3	7.2	7	6.8	6.9	7.2	7	7.3	7	7	6.9	7.2	7.2	7.25	7.5	7.5	7.1	7.6	7.5	7.1	6.9	7.2	6.8	6.9	7.4	7.3	7.4	6.9	6.6	7.2	6.9	7.1	7.5	7.1	7.3	7.4	7.3	7.4	7	6.9	7.3	7.2	7.2	7.2	6.8	7	7.4	7.1	7.2	7	7.3	7.2	7	7.1	7.6	6.8	7.2	7.2	7.4	6.9	7.2	7.4	7.4	7.6	7.1	7.5	7.3	7.3	6.9	7.5	7.3	7.2	7.2	7	7.4	8.6	7.2	7.3	7.1	7.2	7.5	7.2	7.2	7.5	7.2	7.8	7.7	7.6	7.5	8	7.4	7.6	7.1	7.3	7.3	7.5	7.1	7.8	7.6	7.5	7.5	7.4	7.7	7.2	7.8	7.3	7.6	7.6	7.3	6.9	7.1	7.3	6.9	7.1	7.2	7.4	7.2	7.4	7	7.2	7.4	7.4	7.5	7.4	7.1	7.3	7.4	6.9	7.3	7.1	7.5	7.7	7.5	7.5	7.2	7.3	7.5	7.5	7.5	7.5	7.2	7.5	7.1	7.4	7.4	7.2	7.7	7.2	7.6	7.6	7.5	7.5	7.6	7.6	7.2	7.4	7.1	7.7	7.4	7.7	7.7	7	7.1	7.5	7.2	7.3	7.4	7.8	7.4	8	7.5	7.2	7.5	7.7	7.4	7.8	7.3	7.2	7.7	7.4	7.9	7.4	7.6	7.4	7.5	7.2	7.6	7.4	7.9	8.1	7.5	7.6	7.6	7.6	7.8	7.7	7.8	7.5	7.5	7.4	7.6	7.7	7.5	7.6	7.6	8.2	7.8	7.9	7.4	7.9	7.7	7.7	8.2	3.007	6.6	7.5	6.8	6.8	7.4	7.5	7.3	7.4	7.2	7.5	7.2	7.4	7.6	7.5	7.6	7.4	7.3	7.5	7.2	7.7	8	7.8	7.3	7.8	7.4	7.8	7.8	7.4	8	7.8	7.5	7.7	7.3	8	8	7.7	7.9	7.4	7.7	7.5	7.3	7.6	7.7	7.9	7.6	7.5	7.9	8.2	7.5	7.6	7.6	7.9	7.5	7.6	7.6	8	7.6	7.1	7.4	7.4	7.7	7.7	7.7	7.1	7.3	7.5	7.6	7.9	8.2	7.6	7.6	7.9	8.1	8.2	7.8	8.2	7.8	8	7.9	7.7	8.1	8	7.7	7.7	8.2	7.8	7.2	6.5	7.5	7.4	8.3	7.7	7.3	8	7.7	8.1	8.2	7.7	7.6	7.9	7.7	7.9	7.9	8.1	8.1	8	8.2	8.4	7.3	7.1	7.5	7.5	7.3	7.9	7.5	7.7	7.7	7.2	7.7	8.2	7.7	7.8	8.7	7.6	8.1	8.1	7.6	7.6	7.8	8	7.9	7.9	7.9	8.2	7.9	8	8	8.4	8	8.4	2.835	2.824	2.818	2.82	2.79	2.79	2.761	2.985	2.879	2.755	2.915	2.834	2.823	2.869	2.903	2.835	2.86	2.73	2.73	2.845	2.86	2.75	2.895	2.821	2.879	2.753	3.017	2.921	2.915	2.92	2.842	2.836	2.918	2.989	2.899	2.938	2.825	2.991	2.919	2.958	2.926	2.869	2.873	2.927	2.948	3.016	2.918	2.87	2.926	2.947	2.86	2.952	2.916	2.99	2.954	2.993	2.902	2.976	2.821	2.922	2.906	2.861	3.024	3.061	2.917	3.022	2.969	2.943	2.988	2.959	2.773	2.943	3.003	2.997	2.903	2.96	2.886	3.01	2.981	2.922	2.952	3.027	3.02	3.024	2.986	2.919	2.92	2.957	3.12	2.959	2.938	2.925	2.879	2.951	3.04	2.854	3.084	2.93	2.942	2.909	3.056	2.978	3.001	2.975	2.898	2.994	2.97	3.077	3.09	2.968	3.05	2.949	2.885	2.968	2.988	2.987	3.045	3.023	2.913	2.975	2.97	3.126	3.01	3.166	3.032	2.999	2.931	3.13	3.045	3.087	3.018	2.935	2.94	2.94	2.895	3.08	3	2.955	2.902	3.049	2.879	2.908	3.032	2.944	2.973	3.026	3.05	3.043	2.966	2.957	3.02	2.987	2.992	3.112	2.967	2.983	2.921	3.042	2.996	2.978	3.065	2.986	2.969	3.075	3.04	3.033	2.998	3.154	2.965	3.11	3.168	3.008	3.078	2.925	3.13	3.106	2.962	3.098	3.109	3.075	3.21	3.04	3.045	3.024	3.06	3.023	2.905	3.114	2.94	3.123	3.122	3.138	3.288	3.112	5.9	6.2	6.1	5.5	5.9	5.7	5.8	5.8	6	6.1	5.9	6	6.3	6	6.2	5.9	6.1	6	6.3	6.1	6.2	5.5	6.3	5.7	6	6	6	5.7	6.2	6.2	5.9	6.6	5.8	5.5	6.2	6.1	5.8	6	6.1	5.8	6.4	6.1	6.2	6.2	6.3	6.8	5.7	6.2	6.5	6.8	6.3	6.7	6.2	5.6	6.9	5.5	6	6.3	5.9	5.8	5.7	5.9	6.7	5.9	5.9	6	6.1	6.7	6.2	5.6	6.4	5.8	5.8	5.9	6.3	6.5	6.2	5.8	6.1	6.1	6	6.2	6.3	6	6.4	6.3	6	5.7	6.3	6.5	6.3	5.9	6	6.1	5.6	5.9	5.9	6.1	6.1	5.7	6.1	6.2	6	6.3	6.1	6.7	6.2	6.2	6.2	6	7	6.2	5.9	6	6.4	6.4	6.1	5.9	6.2	6.3	6.4	6.5	6.1	5.8	6.2	6	6.2	6.3	6.1	6.6	6.1	6.3	6.2	6.4	6.5	6.5	6.5	7	6.1	6.4	6.4	6	6.2	6.2	6.3	6.5	6.4	6.1	6.3	6.4	6.9	6.4	6.6	6.6	6.5	6.6	6.9	7	6.8	5.9	6.1	5.9	6	6.1	6.1	6.4	5.8	6	5.9	6.4	6.1	6	6.3	7	6	6.8	6.4	6.3	6.7	6.5	6.3	6.3	6.3	6.3	6.1	6.5	6.6	6.6	6.3	6.6	6.6	6.5	6.9	6.3	6.2	6.3	6.3	6.4	6.8	6.4	6.4	6.3	6.4	6.3	6.4	6.4	6.4	6.5	6.5	6.5	6.3	6.8	6.9	6.7	7	6.5	6.8	7	6.5	6.3	6.7	6.8	6.5	6.7	6.2	6.3	6.1	6	6.4	6	7	7.3	6.5	6.8	6	6.5	6.1	6.5	6.1	6.4	6.2	6.4	6.4	6.5	6.5	6.3	6.7	6.9	6.2	6.6	6.1	6.6	6.2	6.7	6.2	6.7	7	6.9	6.3	6	6.2	6.7	6.7	6.5	6.5	6.6	6.4	6.3	6.6	6.5	6.8	6.9	6	6.8	6.5	7	6.5	6.5	7.3	6.7	6.5	6.7	6.1	6.7	6.4	6.5	6.8	6.4	6.5	6.8	7	7.2	5.8	6.2	6.3	6.5	6.4	6.1	6.4	6.7	6.5	6.5	6.6	6.4	6.4	6.6	6.5	6.8	6.2	6.7	6.5	6.7	6.8	6.5	6.7	6.8	6.6	6.7	6.9	6.8	7	6.5	6.1	6.3	6.4	6.8	6.3	6.4	6.4	6.3	5.8	6.8	6.9	6.6	6.8	6.8	6.9	6.8	6.7	6.5	6.2	6.1	6.4	6.3	6.5	6.3	6.9	6.3	6.2	6.5	6.8	6.6	6.7	7	6.8	6.9	6.4	6.4	6.2	6.4	6.6	7	7	6.5	6.4	6.5	6.4	6.4;      % cm, snout-to-vent length at f
           0.425	0.428	0.4297	0.4352	0.4358	0.4364	0.4473	0.452	0.4566	0.4683	0.4698	0.4783	0.479	0.4792	0.4805	0.4877	0.4891	0.493	0.4938	0.4976	0.4987	0.5048	0.5052	0.5076	0.5087	0.5092	0.5139	0.5145	0.5171	0.5192	0.521	0.522	0.5224	0.5228	0.523	0.5239	0.5246	0.525	0.5271	0.5314	0.5316	0.5319	0.5334	0.5348	0.5351	0.5357	0.5374	0.5378	0.538	0.5392	0.5392	0.5417	0.5427	0.5432	0.5443	0.5456	0.5459	0.546	0.5463	0.5464	0.548	0.5489	0.5489	0.5492	0.5531	0.5547	0.5556	0.556	0.5568	0.5572	0.5574	0.5586	0.5589	0.5596	0.5613	0.5619	0.563	0.563	0.5634	0.5646	0.5657	0.5673	0.5685	0.5686	0.569	0.5698	0.571	0.5727	0.5728	0.5738	0.5739	0.5761	0.5772	0.5786	0.5788	0.5791	0.5795	0.5799	0.5799	0.5803	0.5807	0.5808	0.5816	0.5818	0.5818	0.5829	0.5829	0.5836	0.5842	0.5846	0.5848	0.5856	0.5859	0.5861	0.5862	0.5865	0.588	0.5892	0.5903	0.5905	0.5925	0.593	0.593	0.5938	0.5939	0.5957	0.5966	0.5984	0.5991	0.5995	0.5997	0.59993	0.601	0.6013	0.6032	0.6034	0.6048	0.6054	0.6056	0.6067	0.6069	0.6071	0.6075	0.6084	0.61	0.6105	0.6112	0.6122	0.6123	0.613	0.613	0.6136	0.614	0.615	0.6164	0.6165	0.6173	0.6175	0.6182	0.6189	0.62	0.6206	0.6206	0.6218	0.6232	0.6234	0.6239	0.6239	0.6242	0.6244	0.625	0.6263	0.6274	0.6286	0.629	0.6315	0.633	0.6366	0.6368	0.6369	0.6402	0.6409	0.6416	0.6419	0.6426	0.6445	0.6447	0.6463	0.6464	0.6472	0.648	0.6495	0.6516	0.6542	0.6543	0.6549	0.655	0.6551	0.657	0.6574	0.6584	0.6597	0.661	0.6637	0.6666	0.669	0.6692	0.6703	0.672	0.6735	0.6736	0.678	0.685	0.6894	0.6918	0.6933	0.7004	0.7005	0.7027	0.7087	0.7112	0.7131	0.7234	0.7283	0.7306	0.734	0.7401	0.7455	0.7506	0.7725	0.6074	0.5205	0.6369	4.8248	5.3069	5.6706	5.7247	5.934	5.9414	6.013	6.0296	6.136	6.1506	6.1992	6.2795	6.4505	6.6039	4.9297	5.0736	5.113	5.2303	5.2417	5.2907	5.5083	5.5886	5.6	5.613	5.6824	5.6985	5.7139	5.7168	5.724	5.7269	5.739	5.74	5.7481	5.7582	5.769	5.7816	5.7976	5.8039	5.83	5.8887	5.9116	5.933	5.9473	5.9735	6.0063	6.028	6.0287	6.0323	6.0352	6.057	6.0577	6.0757	6.1203	6.1379	6.157	6.1802	6.1872	6.2186	6.2234	6.2272	6.2273	6.2993	6.3086	6.3122	6.3265	6.3297	6.3339	6.3391	6.3392	6.3612	6.365	6.3752	6.3905	6.4064	6.4368	6.4462	6.4517	6.4745	6.476	6.5032	6.511	6.5233	6.5248	6.5286	6.55	6.5588	6.5634	6.5933	6.6047	6.6176	6.6205	6.692	6.7483	6.7698	6.7975	6.8324	6.845	6.8992	6.8994	6.9118	6.9753	6.982	6.9821	7.0114	7.0118	7.0198	7.02	7.0595	7.0709	7.0943	7.1139	7.114	7.1228	7.1237	7.1245	7.1584	7.1618	7.1758	7.1828	7.1913	7.2	7.2131	7.2165	7.223	7.243	7.2993	7.3	7.3071	7.365	7.3671	7.4369	7.4642	7.4933	7.5107	7.5328	7.5405	7.6065	7.6652	7.7148	7.725	7.7265	7.7342	7.7654	7.7889	7.8223	7.882	7.9368	7.9765	7.982	8.052	8.0839	8.1813	8.2879	8.7789	8.8509	8.863	8.878	9.1696	5.047	5.7239	5.9303	5.9581	6.1605	6.1668	6.225	6.2798	6.2901	6.2973	6.2976	6.3676	6.38	6.3904	6.4338	6.4478	6.567	6.5846	6.5846	6.6606	6.6676	6.6873	6.7244	6.7261	6.7437	6.7456	6.8032	6.8635	6.8964	6.9103	6.9239	6.9252	6.9426	6.9618	6.9692	6.9789	6.9828	7.0086	7.0155	7.0318	7.0453	7.0738	7.0926	7.1354	7.1486	7.1542	7.2508	7.278	7.2795	7.3231	7.325	7.3595	7.4031	7.4331	7.4875	7.5614	7.5752	7.589	7.593	7.6289	7.6303	7.644	7.6643	7.6729	7.6819	7.6878	7.6948	7.7123	7.7495	7.7506	7.7519	7.7592	7.7766	7.781	7.7867	7.7965	7.8081	7.8114	7.8448	7.91	7.9235	7.9595	7.9748	7.9824	8.0141	8.112	8.1635	8.184	8.1988	8.23	8.2959	8.4007	8.4143	8.4325	8.4386	8.4709	8.4768	8.4925	8.6129	8.67	8.6738	8.7874	8.8263	9.3693	9.9284	0.5205	5.0548	5.1509	6.1152	6.1689	6.228	6.2613	6.3141	6.3215	6.4956	6.5379	6.539	6.5951	6.7347	6.7637	6.8125	6.963	6.9897	7.0256	7.0985	7.206	7.2535	7.2834	7.3913	7.4808	7.5138	7.5223	7.5648	7.5955	7.6055	7.6617	7.6748	7.7026	7.73	7.8016	7.8041	7.8282	7.8835	7.9074	7.9169	7.9306	7.9317	7.9528	8.024	8.0535	8.0874	8.0877	8.1267	8.1433	8.1834	8.2506	8.339	8.4284	8.444	8.5224	8.7985	8.8779	9.2879	5.515	5.8875	6.786	6.89	7.0699	7.204	7.3145	7.4256	7.4305	7.5051	7.6045	7.6498	7.6919	8.3138	8.4346	8.6634	8.724	8.7341	8.953	9.0452	9.2138	9.49	9.5402	9.6465	9.6745	9.8051	9.8358	10.266	10.3425	4.044	5.8741	6.9787	7.2083	7.3863	7.4964	7.7134	7.7765	7.7803	8.1052	8.212	8.2821	8.6033	8.7384	8.8506	9.022	9.357	9.7392	9.8341	9.9056	10.6566	10.733	6.9158	7.2737	7.4534	7.6317	7.716	7.9683	8.1983	8.3444	8.4609	8.5036	8.57	8.908	8.9152	9.3371	9.466	9.475	9.9351	10.5481	7.5498	7.7969	7.925	8.5523	8.9977	9.0723	9.1047	10.4165	8.335	8.7041	9.1173	11.1702	8.7966	13.2285	0.3629	0.403	0.4046	0.4258	0.4382	0.4431	0.4431	0.4436	0.4479	0.4496	0.4508	0.4544	0.4636	0.464	0.4643	0.4647	0.4647	0.466	0.466	0.4669	0.4709	0.4719	0.4727	0.4738	0.4752	0.476	0.4769	0.4771	0.4781	0.4804	0.4814	0.4818	0.4824	0.4828	0.483	0.484	0.4842	0.4851	0.49	0.493	0.493	0.4961	0.497	0.5016	0.5024	0.503	0.5044	0.5064	0.5065	0.5073	0.508	0.5082	0.5083	0.5096	0.5124	0.5129	0.5134	0.5148	0.5149	0.515	0.5157	0.516	0.5163	0.5165	0.5167	0.5171	0.5171	0.5176	0.5181	0.5183	0.5195	0.5199	0.5206	0.5216	0.5224	0.5232	0.5233	0.5244	0.5267	0.5274	0.5279	0.5284	0.5294	0.5298	0.53	0.5308	0.531	0.5324	0.5332	0.5339	0.5349	0.535	0.5355	0.5366	0.5375	0.5383	0.5387	0.5402	0.5402	0.5403	0.5407	0.5422	0.5439	0.544	0.5445	0.5468	0.547	0.5474	0.549	0.5496	0.5499	0.5519	0.553	0.5548	0.5576	0.5577	0.5587	0.5588	0.5592	0.5604	0.5611	0.5611	0.5621	0.5643	0.5645	0.5648	0.5653	0.5663	0.5665	0.5672	0.5674	0.5676	0.5687	0.5687	0.5696	0.5705	0.5706	0.5708	0.5715	0.5724	0.574	0.575	0.5778	0.5785	0.5786	0.5799	0.5825	0.5827	0.5847	0.5852	0.5855	0.5887	0.5888	0.5906	0.5918	0.5918	0.5919	0.5936	0.5968	0.5989	0.6004	0.6007	0.6015	0.6025	0.6036	0.6038	0.6044	0.605	0.6068	0.6092	0.6125	0.6146	0.6168	0.6183	0.6196	0.6228	0.6229	0.6269	0.6302	0.6313	0.6358	0.6373	0.64	0.6441	0.6458	0.6515	0.652	0.6629	0.6858	0.6892	0.7114	0.7208	0.783	0.6777	3.3773	4.9592	3.1318	3.2	3.3053	3.32	3.3996	3.483	3.4874	3.4895	3.4899	3.5304	3.6758	3.6869	3.7077	3.7651	3.7874	3.8227	3.9576	3.9649	3.9987	3.9991	4.032	4.0623	4.0671	4.1138	4.1658	4.2486	4.3241	4.3345	4.3466	4.3469	4.38	4.3802	4.41	4.41	4.4174	4.468	4.495	4.5097	4.51	4.6086	4.667	4.737	4.8628	4.8701	5.0315	5.0499	5.0724	5.0801	5.0827	5.2715	5.436	5.4683	6.0826	2.9745	3.3231	3.3671	3.3831	3.4205	3.5611	3.6703	3.748	3.8023	3.8027	3.8061	3.8125	3.8352	3.8501	3.8863	3.891	3.9012	3.934	4.0327	4.0739	4.0808	4.092	4.1013	4.1018	4.109	4.1115	4.1316	4.151	4.1765	4.1966	4.2132	4.2296	4.2739	4.2894	4.3011	4.3042	4.3144	4.3726	4.3787	4.3895	4.39	4.3912	4.416	4.4596	4.4613	4.4687	4.476	4.4901	4.4965	4.5051	4.5111	4.54	4.6138	4.6428	4.6756	4.678	4.68	4.68	4.7053	4.7091	4.7135	4.7292	4.7352	4.75	4.7852	4.8051	4.8336	4.8471	4.8848	4.8899	4.8926	4.93	4.943	4.9768	5.0011	5.0102	5.0581	5.0758	5.118	5.1525	5.1667	5.1739	5.35	5.3517	5.3639	5.3712	5.3819	5.4205	5.4506	5.4952	5.4998	5.5115	5.5138	5.5226	5.6178	5.7	5.7502	5.775	5.8273	5.8393	5.8862	5.9061	6.32	7.0899	3.5833	3.7594	3.777	3.886	3.9388	4.0201	4.106	4.1861	4.284	4.3192	4.3262	4.44	4.48	4.5133	4.5516	4.554	4.6061	4.618	4.6212	4.6337	4.6463	4.6585	4.7071	4.7227	4.7688	4.8063	4.832	4.8386	4.84	4.85	4.8561	4.8869	4.95	4.9583	4.9609	4.9664	5.0637	5.0898	5.0903	5.1141	5.1164	5.1608	5.17	5.219	5.259	5.2754	5.28	5.32	5.3329	5.383	5.3843	5.4003	5.43	5.437	5.4376	5.4927	5.5828	5.607	5.616	5.7156	5.7244	5.7687	5.858	5.9366	5.9735	6.013	6.0291	6.3148	6.3172	6.3765	6.4914	6.5898	6.619	6.682	7.4294	4.0979	4.1688	4.3211	4.4546	4.4815	4.519	4.6138	4.635	4.6418	4.7098	4.76	4.8968	4.9263	4.9266	4.9275	4.9905	4.9973	5.061	5.065	5.108	5.1331	5.141	5.164	5.307	5.3489	5.38	5.3815	5.39	5.4193	5.477	5.4858	5.53	5.5402	5.5455	5.61	5.621	5.6542	5.6994	5.8341	5.8384	5.852	5.8636	5.9175	5.9364	5.9501	6.0162	6.0178	6.0721	6.0791	6.0911	6.1428	6.203	6.3832	6.3934	6.4069	6.6639	6.6882	6.8704	4.1874	4.2366	4.6037	4.7337	4.7779	4.9404	5.0896	5.2219	5.229	5.3184	5.329	5.4615	5.5155	5.6206	5.7112	5.7782	5.8089	5.8258	5.8836	5.9737	6.007	6.0114	6.2291	6.2519	6.264	6.3102	6.35	6.6373	7.0219	7.2795	4.2037	4.8397	5.0713	5.0867	5.1317	5.4136	5.4174	5.4786	5.542	5.7242	6.0558	6.2542	6.3528	6.5057	6.6078	6.7865	6.84	6.8841	7.2916	4.6527	5.2679	5.3194	5.3292	5.3308	5.569	5.6562	5.8237	5.9388	6.0104	6.0564	6.5659	6.8093	6.852	7.6508	4.8528	4.91	5.0389	5.0931	5.53	6.9203	7.3146	5.549	5.574	5.73	7.029	5.4746]';   % g, wet weight at f and T
units.LW = {'cm', 'g'};     label.LW = {'time since birth', 'wet weight'};  bibkey.LW = 'Caldwell_unpub';

%baseline values for metallicus only. Both high and low altitude populations
 data.TO = [ ... temp (C), O2 consumption (ml/h.gwet) of 4.19 g wet weight (1.26 g dry), based on 10th percentile of Mandy's data
8  0.05204329
9	0.06538832
10	0.08439193
11	0.10910323
12	0.13190832
13	0.16716865
14	0.19350912
15	0.21160087
16	0.2180405
17	0.25373316
18	0.27701706
19	0.28210837
20	0.26486982
21	0.25143882
22	0.27424882
23	0.31175872
24	0.35537359
25	0.36307062
26	0.38366966
27	0.40783075
28	0.39894371
29	0.41614495
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
pt2 = 'Caldwell: TA was estimated from Caldwell's unpublished data on metabolic rate and compared with Yuni's unpublished data for ocellatus on sprint speed (/sprint speed/sprint_speed_N_occelatus_Yuni.csv), using script /sprint speed/TA from sprint speed.R';
pt3 = 'Kearney: metabolic rates were extracted from Caldwell''s measurements of short-term (hours) dynamics of metabolic rate under ramping temperature, using only the ramping down temperatures and taking the 10th percentile to capture the indviduals closest to resting, which were in close agreement with Andrews and Pough''s general equation for squamate metabolic rate, see script /Niveoscincus/metabolic rates/mrate_analysis.R ';     
pt4 = 'Kearney: Temperatures for ';     
metadata.discussion = {pt1; pt2; pt3; pt4};
