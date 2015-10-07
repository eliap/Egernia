%% mydata_my_pet
% Sets referenced data

%%
function [data, txt_data, metadata] = mydata_Niveoscincus_highland 
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
data.Lb  = 3.018;   units.Lb  = 'cm';   label.Lb  = 'snout to vent length at birth';    bibkey.Lb  = 'Caldwell_unpub';
data.Lp  = 5.5;   units.Lp  = 'cm';   label.Lp  = 'snout to vent length at puberty';  bibkey.Lp  = 'Caldwell_unpub';
data.Li  = 9.2;   units.Li  = 'cm';   label.Li  = 'ultimate snout to vent length';    bibkey.Li  = 'Caldwell_unpub';
data.Wdb = 0.58*0.3; units.Wdb = 'g';    label.Wdb = 'dry weight at birth';              bibkey.Wdb = 'Caldwell_unpub';
data.Wdp = 3.1*0.3;   units.Wdp = 'g';    label.Wdp = 'dry weight at puberty';            bibkey.Wdp = 'Caldwell_unpub';
data.Wdi = 13.4*0.3;   units.Wdi = 'g';    label.Wdi = 'ultimate dry weight';              bibkey.Wdi = 'Caldwell_unpub';
data.Ri  = 6/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';              bibkey.Ri  = 'Caldwell_unpub';   
  % for an individual of ultimate length Li 
  % max reproductive rate of 9 has been recorded but is unusual - 6 is a more common max.
  temp.Ri = T_C +  18.88;  bibkey.Ri = 'Caldwell_unpub'; % K, temperature, based on simulation of Tb from 2000-2013 at Orford, see last lines of Niveoscincus_ocellatus_lowland traits.R; 
 
% uni-variate data

% uni-variate data at f = 1.0 (this value should be added in pars_init_my_pet as a parameter f_tL) 
% snout-to-vent length and wet weight were measured at the same time
data.tL = [0  3.2	344.6	347.8	347.8	635	743.5	749.8	982.8	982.8	986	986	1017.9	1030.6	1040.2	1043.4	1046.6	1046.6	1049.8	1056.2	1094.5	1104	1273.1	1273.1	1273.1	1279.5	1368.9	1391.2	1400.8	1416.7	1419.9	1423.1	1474.2	1474.2	1474.2	1630.5	1719.9	1751.8	1764.5	1767.7	1783.7	1793.3	1837.9	1837.9	2115.5	2115.5	2131.5	2150.6	2157	2157	2160.2	2227.2	2233.6	2469.7	2472.9	2527.2	2533.5	2587.8	2597.4	2600.5	2890.9	2900.5	2906.9	2910.1	2932.4	2954.7	3216.4	3219.6	3289.8	3344	3350.4	3602.5	3624.8	3650.3	3653.5	3669.5	3969.4	4106.6	4384.2;  % d, time since birth
           2.9  3	4.3	4.2	4.5	4.8	5.6	4.9	5	6.4	5.2	5.6	5.1	6.6	5.9	6.7	5.8	6.2	6.5	6	6.6	7.3	6.5	6.6	6.7	6.4	6.6	6.3	6.1	6.7	6.9	7	6.5	6.7	6.8	6.5	6.8	7.2	7	7.4	6.9	7.1	6.2	7.4	7.1	7.3	7.7	6.9	7	7.5	7.4	7.3	7.1	8	7.6	7.4	7	7.1	7.9	7.8	7.7	7.5	7.6	7.3	7.2	7.9	7.9	8	7.7	7.9	7.8	8.1	7.5	7.6	8.3	8.2	7.7	8.2	7.8]';  % cm, snout-to-vent length at f and T
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'snout to vent length'};  bibkey.tL = 'Caldwell_unpub';
  temp.tL = T_C + 17.7;  % K, temperature

data.LW = [2.785  2.967  2.783  2.872	2.784	2.93	2.825	2.903	2.859	2.938	2.866	2.94	3.041	2.923	2.893	3.014	2.897	3.01	2.917	2.935	2.984	2.898	2.886	2.837	2.959	2.89	2.867	2.992	2.892	3.044	3.007	3.007	2.947	2.835	3.027	2.888	3.081	2.969	3.002	2.982	2.989	2.822	2.834	2.954	2.881	2.98	2.936	2.959	3.05	3	3.031	2.966	2.984	2.915	2.996	2.98	3.077	2.909	2.966	2.953	2.95	3.011	2.949	2.971	3.055	3.016	3.057	2.978	2.99	2.994	2.965	2.989	2.979	3.013	2.96	3.06	3.113	3.063	2.939	2.972	2.954	3.059	3.034	2.994	3.061	3.03	3.01	3.065	3.052	3.046	3.001	3.035	3.068	3.032	3.177	2.992	2.975	2.934	2.978	2.995	3.032	2.959	3.119	3.047	3.032	2.955	3.039	2.878	3.055	3.003	3.052	3.041	3.05	3.009	2.919	3.039	3.079	3.031	2.992	3.001	2.921	2.926	3.06	2.997	3.008	3.101	2.95	2.98	3.093	2.953	3.075	3.061	3.047	3.157	2.986	3.018	2.893	3.066	3.051	3.152	2.977	3.152	3.044	3.12	3.068	3.014	3.079	3.051	3.101	3.134	2.972	3.041	2.947	3.055	3.054	3.014	3.083	2.966	3.042	3.015	3.138	3.035	3.004	2.971	3.082	3.146	3.046	3.02	3.119	3.064	3.065	3.059	3.025	2.998	3.05	3.095	3.009	3.056	3.109	3.125	3.094	3.138	3.1	3.1	3.052	3.098	3.054	2.985	3.097	2.981	3.072	3.056	3.032	3.064	3.084	2.94	3.025	3.194	3.086	3.121	3.169	3.006	3.094	3.054	3.09	3.054	3.12	3.149	3.085	3.142	3.111	3.11	3.156	3.15	3.082	3.134	3.055	3.166	3.09	3.102	3.16	3.054	3.03	3.05	3.206	3.145	3.18	3.13	3.16	3.165	3.202	3.243	3.224	3.241	7.2	6.4	7.1	7.3	6.6	6.8	7.3	7.5	6.8	6.9	7.2	6.6	6.7	7.1	7.3	7.4	7.2	7	6.8	6.8	7.2	7	6.9	7	6.1	7.3	7.4	7.5	7	7	7	6.9	7.2	7	6.7	6.5	7.4	7	6.8	7.1	7.2	6.5	6.7	7	7.3	6.8	6.8	6.6	7.2	7	6.5	6.8	7.2	7.1	7.3	7.2	6.8	7	7.6	6.8	6.3	6.9	6.9	7.1	6.8	7.2	7	6.8	7.3	7	7.2	7	6.9	7.4	7.5	7.2	7.4	7.2	7.4	7	7.2	7.2	7.25	7.3	7.4	7.5	7.5	7.1	7.6	7.5	7.1	6.9	7.2	7.2	7.4	7.4	6.8	6.9	7.5	7.4	7.3	7.4	7	7.4	6.9	6.6	7.2	7.2	6.9	7.1	7.5	7.1	7.5	7.2	7.3	7.4	7.3	7.1	7.3	7.4	7.4	7.4	7.2	7	6.9	7.3	6.9	7.3	7.1	7.2	7.5	7.7	7.6	7.5	7.5	7.2	7.5	7.2	7.4	6.8	7.2	7.6	7	7.4	7.3	7.7	7.5	7.1	7.2	7.5	7	7.3	7.5	7.5	7.2	7.5	7.4	7.1	7.3	7.5	7.4	7.2	7	7.4	7.3	7.2	7.1	7.6	7.7	6.8	7.2	7.5	7.2	7.6	7.2	7.7	7.4	7.6	7.5	6.9	7.2	7.2	7.4	7.4	7.6	7.1	7.5	7.6	7.6	7.5	7.3	7.3	6.9	7.5	7.3	7.7	7.7	7.4	7.2	7.2	7	7.4	7.2	8	7.1	7.4	7.1	7.8	8.6	7.2	7.3	7.1	7.7	7.4	7.7	7.1	7.2	8.3	7.3	7.7	7.3	7.5	7	7.5	7.5	7.2	7.8	7.1	7.2	7.7	7.6	7.5	7.4	7.8	7.2	7.8	7.6	7.5	7.8	7.2	7.3	7.4	7.4	7.9	8	7.7	7.8	7.4	7.5	8	8.2	7.8	7.5	7.6	7.2	7.5	7.5	7.7	7.6	7.4	7.7	7.8	7.3	7.5	7.3	8	7.4	7.3	7.6	7.3	7.2	7.7	7.4	7.1	8	7.9	7.7	7.4	7.6	7.3	7.4	7.6	8	8	7.5	7.2	7.3	7.7	7.6	7.5	7.9	7.4	7.4	7.7	7.9	7.8	7.5	7.3	7.1	7.6	8.1	7.9	7.5	7.8	7.6	7.6	7.6	7.7	7.5	7.9	7.5	7.6	7.5	8.1	7.6	7.9	8.2	7.8	7.4	7.5	7.7	7.5	7.8	8.2	7.5	7.6	7.7	7.7	7.5	7.6	7.9	7.6	7.7	7.4	7.6	7.9	7.7	7.9	7.5	7.5	7.7	7.6	7.6	8.2	7.2	7.6	8	7.7	7.6	7.8	8.1	7.9	7.4	8	8.2	7.8	7.9	7.2	7.9	8	7.6	7.7	7.7	7.8	7.3	8	7.6	8.2	7.7	8.2	7.9	7.9	7.8	7.9	7.9	8	7.6	8	7.6	7.8	7.9	7.7	8.7	7.6	7.9	7.7	8.1	8	8.1	7.7	8.1	7.7	8	8.2	8.1	8.2	7.8	8.2	8.1	8.2	8.4	8.4;      % cm, snout-to-vent length at f
           0.425  0.428	0.4297	0.4352	0.4358	0.4364	0.4473	0.452	0.4566	0.4683	0.4698	0.4783	0.479	0.4792	0.4805	0.4877	0.4891	0.493	0.4938	0.4976	0.4987	0.5048	0.5052	0.5076	0.5087	0.5092	0.5139	0.5145	0.5171	0.5192	0.5205	0.5205	0.521	0.522	0.5224	0.5228	0.523	0.5239	0.5246	0.525	0.5271	0.5314	0.5316	0.5319	0.5334	0.5348	0.5351	0.5357	0.5374	0.5378	0.538	0.5392	0.5392	0.5417	0.5427	0.5432	0.5443	0.5456	0.5459	0.546	0.5463	0.5464	0.548	0.5489	0.5489	0.5492	0.5531	0.5547	0.5556	0.556	0.5568	0.5572	0.5574	0.5586	0.5589	0.5596	0.5613	0.5619	0.563	0.563	0.5634	0.5646	0.5657	0.5673	0.5685	0.5686	0.569	0.5698	0.571	0.5727	0.5728	0.5738	0.5739	0.5761	0.5772	0.5786	0.5788	0.5791	0.5795	0.5799	0.5799	0.5803	0.5807	0.5808	0.5816	0.5818	0.5818	0.5829	0.5829	0.5836	0.5842	0.5846	0.5848	0.5856	0.5859	0.5861	0.5862	0.5865	0.588	0.5892	0.5903	0.5905	0.5925	0.593	0.593	0.5938	0.5939	0.5957	0.5966	0.5984	0.5991	0.5995	0.5997	0.59993	0.601	0.6013	0.6032	0.6034	0.6048	0.6054	0.6056	0.6067	0.6069	0.6071	0.6074	0.6075	0.6084	0.61	0.6105	0.6112	0.6122	0.6123	0.613	0.613	0.6136	0.614	0.615	0.6164	0.6165	0.6173	0.6175	0.6182	0.6189	0.62	0.6206	0.6206	0.6218	0.6232	0.6234	0.6239	0.6239	0.6242	0.6244	0.625	0.6263	0.6274	0.6286	0.629	0.6315	0.633	0.6366	0.6368	0.6369	0.6369	0.6402	0.6409	0.6416	0.6419	0.6426	0.6445	0.6447	0.6463	0.6464	0.6472	0.648	0.6495	0.6516	0.6542	0.6543	0.6549	0.655	0.6551	0.657	0.6574	0.6584	0.6597	0.661	0.6637	0.6666	0.669	0.6692	0.6703	0.672	0.6735	0.6736	0.678	0.685	0.6894	0.6918	0.6933	0.7004	0.7005	0.7027	0.7087	0.7112	0.7131	0.7234	0.7283	0.7306	0.734	0.7401	0.7455	0.7506	0.7725	4.044	4.8248	4.9297	5.047	5.0548	5.0736	5.113	5.1509	5.2303	5.2417	5.2907	5.3069	5.5083	5.515	5.5886	5.6	5.613	5.6706	5.6824	5.6985	5.7139	5.7168	5.7239	5.724	5.7247	5.7269	5.739	5.74	5.7481	5.7582	5.769	5.7816	5.7976	5.8039	5.83	5.8741	5.8875	5.8887	5.9116	5.9303	5.933	5.934	5.9414	5.9473	5.9581	5.9735	6.0063	6.013	6.028	6.0287	6.0296	6.0323	6.0352	6.057	6.0577	6.0757	6.1152	6.1203	6.136	6.1379	6.1506	6.157	6.1605	6.1668	6.1689	6.1802	6.1872	6.1992	6.2186	6.2234	6.225	6.2272	6.2273	6.228	6.2613	6.2795	6.2798	6.2901	6.2973	6.2976	6.2993	6.3086	6.3122	6.3141	6.3215	6.3265	6.3297	6.3339	6.3391	6.3392	6.3612	6.365	6.3676	6.3752	6.38	6.3904	6.3905	6.4064	6.4338	6.4368	6.4462	6.4478	6.4505	6.4517	6.4745	6.476	6.4956	6.5032	6.511	6.5233	6.5248	6.5286	6.5379	6.539	6.55	6.5588	6.5634	6.567	6.5846	6.5846	6.5933	6.5951	6.6039	6.6047	6.6176	6.6205	6.6606	6.6676	6.6873	6.692	6.7244	6.7261	6.7347	6.7437	6.7456	6.7483	6.7637	6.7698	6.786	6.7975	6.8032	6.8125	6.8324	6.845	6.8635	6.89	6.8964	6.8992	6.8994	6.9103	6.9118	6.9158	6.9239	6.9252	6.9426	6.9618	6.963	6.9692	6.9753	6.9787	6.9789	6.982	6.9821	6.9828	6.9897	7.0086	7.0114	7.0118	7.0155	7.0198	7.02	7.0256	7.0318	7.0453	7.0595	7.0699	7.0709	7.0738	7.0926	7.0943	7.0985	7.1139	7.114	7.1228	7.1237	7.1245	7.1354	7.1486	7.1542	7.1584	7.1618	7.1758	7.1828	7.1913	7.2	7.204	7.206	7.2083	7.2131	7.2165	7.223	7.243	7.2508	7.2535	7.2737	7.278	7.2795	7.2834	7.2993	7.3	7.3071	7.3145	7.3231	7.325	7.3595	7.365	7.3671	7.3863	7.3913	7.4031	7.4256	7.4305	7.4331	7.4369	7.4534	7.4642	7.4808	7.4875	7.4933	7.4964	7.5051	7.5107	7.5138	7.5223	7.5328	7.5405	7.5498	7.5614	7.5648	7.5752	7.589	7.593	7.5955	7.6045	7.6055	7.6065	7.6289	7.6303	7.6317	7.644	7.6498	7.6617	7.6643	7.6652	7.6729	7.6748	7.6819	7.6878	7.6919	7.6948	7.7026	7.7123	7.7134	7.7148	7.716	7.725	7.7265	7.73	7.7342	7.7495	7.7506	7.7519	7.7592	7.7654	7.7765	7.7766	7.7803	7.781	7.7867	7.7889	7.7965	7.7969	7.8016	7.8041	7.8081	7.8114	7.8223	7.8282	7.8448	7.882	7.8835	7.9074	7.91	7.9169	7.9235	7.925	7.9306	7.9317	7.9368	7.9528	7.9595	7.9683	7.9748	7.9765	7.982	7.9824	8.0141	8.024	8.052	8.0535	8.0839	8.0874	8.0877	8.1052	8.112	8.1267	8.1433	8.1635	8.1813	8.1834	8.184	8.1983	8.1988	8.212	8.23	8.2506	8.2821	8.2879	8.2959	8.3138	8.335	8.339	8.3444	8.4007	8.4143	8.4284	8.4325	8.4346	8.4386	8.444	8.4609	8.4709	8.4768	8.4925	8.5036	8.5224	8.5523	8.57	8.6033	8.6129	8.6634	8.67	8.6738	8.7041	8.724	8.7341	8.7384	8.7789	8.7874	8.7966	8.7985	8.8263	8.8506	8.8509	8.863	8.8779	8.878	8.908	8.9152	8.953	8.9977	9.022	9.0452	9.0723	9.1047	9.1173	9.1696	9.2138	9.2879	9.3371	9.357	9.3693	9.466	9.475	9.49	9.5402	9.6465	9.6745	9.7392	9.8051	9.8341	9.8358	9.9056	9.9284	9.9351	10.266	10.3425	10.4165	10.5481	10.6566	10.733	11.1702	13.2285]';   % g, wet weight at f and T
units.LW = {'cm', 'g'};     label.LW = {'time since birth', 'wet weight'};  bibkey.LW = 'Caldwell_unpub';

%did not change the following from the original N. ocellatus lowland file. 
%The following data was not from ocellatus - it is an average from three other species.
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
pt2 = 'Kearney: TA was estimated from Yuni''s unpublished data on sprint speed (/sprint speed/sprint_speed_N_occelatus_Yuni.csv), using script /sprint speed/TA from sprint speed.R';
pt3 = 'Kearney: metabolic rates were extracted from Caldwell''s measurements of short-term (hours) dynamics of metabolic rate under ramping temperature, using only the ramping down temperatures and taking the 10th percentile to capture the indviduals closest to resting, which were in close agreement with Andrews and Pough''s general equation for squamate metabolic rate, see script /Niveoscincus/metabolic rates/mrate_analysis.R ';     
pt4 = 'Kearney: Temperatures for ';     
metadata.discussion = {pt1; pt2; pt3; pt4};
