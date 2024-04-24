PGDMP         3                |           web_scraping_db    14.2    14.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    105039    web_scraping_db    DATABASE     k   CREATE DATABASE web_scraping_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Polish_Poland.1250';
    DROP DATABASE web_scraping_db;
                postgres    false            �            1259    105045    currency_data    TABLE     �   CREATE TABLE public.currency_data (
    id character varying(15) NOT NULL,
    effective_date date NOT NULL,
    mid double precision NOT NULL,
    currency_code character varying(3)
);
 !   DROP TABLE public.currency_data;
       public         heap    postgres    false            �            1259    105040    currency_info    TABLE     �   CREATE TABLE public.currency_info (
    currency_code character varying(3) NOT NULL,
    currency_name character varying(50) NOT NULL
);
 !   DROP TABLE public.currency_info;
       public         heap    postgres    false            �          0    105045    currency_data 
   TABLE DATA           O   COPY public.currency_data (id, effective_date, mid, currency_code) FROM stdin;
    public          postgres    false    210          �          0    105040    currency_info 
   TABLE DATA           E   COPY public.currency_info (currency_code, currency_name) FROM stdin;
    public          postgres    false    209          b           2606    105049     currency_data currency_data_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.currency_data
    ADD CONSTRAINT currency_data_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.currency_data DROP CONSTRAINT currency_data_pkey;
       public            postgres    false    210            `           2606    105044     currency_info currency_info_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.currency_info
    ADD CONSTRAINT currency_info_pkey PRIMARY KEY (currency_code);
 J   ALTER TABLE ONLY public.currency_info DROP CONSTRAINT currency_info_pkey;
       public            postgres    false    209            c           2606    105050 .   currency_data currency_data_currency_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.currency_data
    ADD CONSTRAINT currency_data_currency_code_fkey FOREIGN KEY (currency_code) REFERENCES public.currency_info(currency_code);
 X   ALTER TABLE ONLY public.currency_data DROP CONSTRAINT currency_data_currency_code_fkey;
       public          postgres    false    210    3168    209            �   �   x�m��n�0E��_���:WOz������O��2]����|<ߟ���1?W����ݻ?ﯳ�C�&$���	u��!�v�&Dj�"	1�,����C�R<o�I����(���j��${;`|ք��x�G�'�=80>��܀�Q�s�d��\W�-�0> Zϒ�к�����[�A��&�|����&d�����������4�q��
�gPN���������>�����      �   $   x�v�L��I,RH�M-��N<�R������� �S	T     