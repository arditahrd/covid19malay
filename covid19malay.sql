PGDMP         ;                x            covid19malay    12.3    12.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24576    covid19malay    DATABASE     �   CREATE DATABASE covid19malay WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_Indonesia.1252' LC_CTYPE = 'English_Indonesia.1252';
    DROP DATABASE covid19malay;
                postgres    false            �            1259    57401    data_malay_ver3    TABLE     r  CREATE TABLE public.data_malay_ver3 (
    id bigint NOT NULL,
    province character varying NOT NULL,
    lat double precision NOT NULL,
    long double precision NOT NULL,
    cases bigint,
    date bigint,
    streetname character varying,
    city character varying,
    country character varying,
    countrycode character varying,
    zipcode character varying
);
 #   DROP TABLE public.data_malay_ver3;
       public         heap    postgres    false            �            1259    57399    data_malay_ver3_id_seq    SEQUENCE        CREATE SEQUENCE public.data_malay_ver3_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.data_malay_ver3_id_seq;
       public          postgres    false    207                       0    0    data_malay_ver3_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.data_malay_ver3_id_seq OWNED BY public.data_malay_ver3.id;
          public          postgres    false    206            �
           2604    57404    data_malay_ver3 id    DEFAULT     x   ALTER TABLE ONLY public.data_malay_ver3 ALTER COLUMN id SET DEFAULT nextval('public.data_malay_ver3_id_seq'::regclass);
 A   ALTER TABLE public.data_malay_ver3 ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207                      0    57401    data_malay_ver3 
   TABLE DATA           �   COPY public.data_malay_ver3 (id, province, lat, long, cases, date, streetname, city, country, countrycode, zipcode) FROM stdin;
    public          postgres    false    207   f                  0    0    data_malay_ver3_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.data_malay_ver3_id_seq', 132, true);
          public          postgres    false    206            �
           2606    57409 $   data_malay_ver3 data_malay_ver3_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.data_malay_ver3
    ADD CONSTRAINT data_malay_ver3_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.data_malay_ver3 DROP CONSTRAINT data_malay_ver3_pkey;
       public            postgres    false    207               @  x������0��ӧ�X�ǎ�,ж�"
BH\\մ�m�J�}{�)�m�is����3��Jݱ>�S��Pke�q�e	�Ad����k�]�n����.v����\Gx�
Z~�˴�{"��f��n��4���6n�j��X�&�b�,A5�PTu#;+S22�t�ΐ����f���M�e��`as!��r��g���T��]קG�)�ȫ�A���:僶R���~D���{�β��ө�-1���i��Z�s�Ԃ�<a��F6��<m�}]�\�}��Kk/`���w����v/�B���%E�q��<O��G�9�s�A�*�sHo��hh����|^6,�좆O�K�n�A2F���Ɉ*�S�%<M?�3ǖ?�9��J�0)��ܧ��-Aϼf�0��<V�h���S>8_��������c��#,�>w����ǲ����S�C��$1C���f��,��/Uq9�j8=yF��8 �t�6��0r�WC���)G9g/p�� w��%��4Cw����AZ�o#�p�,H��ګ���]:��������L�0���b��?     